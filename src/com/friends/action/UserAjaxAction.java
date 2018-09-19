package com.friends.action;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Decoder;
import util.DateUtil;
import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.User;

@Controller
@Scope("prototype")
public class UserAjaxAction extends BaseAction<User> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;
	
	private String result;
	private HttpServletRequest request;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * @Title: userLogin 
	 * @Description: TODO(用户登录) 
	 * @param @return
	 * @param @throws Exception    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String userLogin() throws Exception{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String remberPwd = request.getParameter("remberPwd");
		
		if (userName!=null && password!=null && remberPwd!=null) {
			User user = new User();
			user.setUserName(userName);
			user.setPassword(password);
			User realUser = this.userService.login(user);
			if (realUser != null) {
				request.getSession().setAttribute("user", realUser);
				ObjectMapper mapper = new ObjectMapper();
				result = mapper.writeValueAsString("ok");
			}
		}
		return SUCCESS;
	}
	/**
	 * @throws Exception 
	 * 
	 * @Title: userRegister 
	 * @Description: TODO(用户注册) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String userRegister() throws Exception{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String verifyCode = request.getParameter("verifyCode").toUpperCase();
		String realVerifyCode = request.getSession().getAttribute("securityCode").toString().toUpperCase();
		
		if (!verifyCode.equals(realVerifyCode)) {
			ObjectMapper mapper = new ObjectMapper();
			result = mapper.writeValueAsString("验证码有误...");
			return SUCCESS;
		}
		
		User user =new User();
		user.setUserName(userName);
		user.setPassword(password);
		user.setNickName(nickName);
		user.setExperience(0);
		user.setHead_pic("img/head.jpg");
		user.setRegisterTime((new Date()));
		this.userService.save(user);
		request.getSession().setAttribute("user", user);
		ObjectMapper mapper = new ObjectMapper();
		result = mapper.writeValueAsString("ok");
		return SUCCESS;
	}
	/**
	 * @throws Exception 
     * @Title: saveUserPersonalInfors 
     * @Description: TODO(保存个人资料) 
     * @param @return    设定文件 
     * @return String    返回类型 
     * @throws
     */
    public String saveUserPersonalInfors() throws Exception {
        String realName = request.getParameter("realName");
        String birth = request.getParameter("birth");
        String sex = request.getParameter("sex");
        String signature = request.getParameter("signature");
        ObjectMapper mapper = new ObjectMapper();
        if (!StringUtil.isEmpty(realName) && !StringUtil.isEmpty(birth) && !StringUtil.isEmpty(sex) && !StringUtil.isEmpty(signature)) {
            User user = (User) request.getSession().getAttribute(Constant.USER);
            user.setUserRealName(realName);
            user.setBirth(DateUtil.getDateFromTime(birth));
            user.setSex(sex);
            user.setSignature(signature);
            this.userService.update(user);
            result = mapper.writeValueAsString("保存成功");
            request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
        } else {
            result = mapper.writeValueAsString("保存失败");
        }

        return SUCCESS;
    }
    /**
     * 
     * @Title: changeUserPassword 
     * @Description: TODO(修改用户密码) 
     * @param @return    设定文件 
     * @return String    返回类型 
     * @throws
     */
    public String changeUserPassword() throws Exception {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        ObjectMapper mapper = new ObjectMapper();
        if (!StringUtil.isEmpty(oldPassword) && !StringUtil.isEmpty(newPassword) && !StringUtil.isEmpty(confirmPassword)) {
            User user = (User) request.getSession().getAttribute(Constant.USER);
            if (user.getPassword().equals(oldPassword)) {
                if (newPassword.equals(confirmPassword)) {
                    user.setPassword(newPassword);
                    this.userService.update(user);
                    result = mapper.writeValueAsString("修改密码成功");
                    request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
                } else {
                    result = mapper.writeValueAsString("两次输入密码不一致");
                }
            } else {
                result = mapper.writeValueAsString("原密码输入错误");
            }
        }
        return SUCCESS;
    }
    /**
     * @Title: changeUserHeadPic 
     * @Description: TODO(修改用户头像) 
     * @param @return
     * @param @throws Exception    设定文件 
     * @return String    返回类型 
     * @throws
     */
    public String changeUserHeadPic() {
        String img = request.getParameter("img");
        if (img != null) {
            ObjectMapper mapper = new ObjectMapper();
            BASE64Decoder decoder = new BASE64Decoder();
            String savePath = ServletActionContext.getServletContext().getRealPath("/" + Constant.UPLOAD_FOLDER);
            String fileName = StringUtil.createFileName() + ".png";
            // Base64解码
            byte[] b;
            try {
                b = decoder.decodeBuffer(img.split(",")[1]);
                // 生成jpeg图片
                OutputStream out = new FileOutputStream(new File(savePath, fileName));
                out.write(b);
                out.flush();
                out.close();

                User user = (User) request.getSession().getAttribute(Constant.USER);
                user.setHead_pic(Constant.UPLOAD_FOLDER + fileName);
                this.userService.update(user);
                request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
                result = mapper.writeValueAsString("修改头像成功");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                try {
                    result = mapper.writeValueAsString("修改头像失败");
                } catch (JsonGenerationException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                } catch (JsonMappingException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                } catch (IOException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
            }
        }
        return SUCCESS;
    }
    public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
}
