package com.friends.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import util.DateUtil;
import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.InterestGroup;
import com.friends.model.User;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> implements ServletRequestAware{

	private HttpServletRequest request;
	
	private static final long serialVersionUID = -3010979754973676105L;

	/**
	 * 
	 * @Title: login 
	 * @Description: TODO(用户登录) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String login(){
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		User realUser = this.userService.login(user);
		if (realUser != null) {
			request.getSession().setAttribute("user", realUser);
			
			return "login";
		}else{
			request.setAttribute("username", user.getUserName());
			request.setAttribute("errorMsg", "账号或密码错误！！！");
			return INPUT;
		}
	}
	
	/**
	 * 
	 * @Title: logOut 
	 * @Description: TODO(用户登出) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String logOut(){
		request.getSession().setAttribute("user", null);
		return "login";
	}

	/**
	 * @Title: getMyCollections 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String getMyCollections(){
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    List<InterestGroup> list_interestGroup = new ArrayList<InterestGroup>();
	    list_interestGroup.addAll(user.getInterestGroups());
	    request.setAttribute("list_interestGroup", list_interestGroup);
		return "getMyCollections";
	}
	/**
	 * @Title: seeMyGroups 
	 * @Description: TODO(查看用户创建的小组) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeMyGroups() {
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    if (user != null) {
            List<Integer> userLikedInterestGroupIds = new ArrayList<Integer>();
            for (InterestGroup interestGroup : user.getInterestGroups()) {
                userLikedInterestGroupIds.add(interestGroup.getId());
            }
            request.setAttribute("userLikedInterestGroupIds", userLikedInterestGroupIds);
        }
	    request.setAttribute("interestGroups", user.getCreatedInterestGroups());
	    return "seeMyGroups";
	}
	/**
	 * 
	 * @Title: seeMyAccountSetting 
	 * @Description: TODO(查看用户设置页面) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeMyAccountSetting() {
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    if (user != null) {
	        request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
        }
	    return "seeMyAccountSetting";
	}
	
	/**
	 * @Title: saveUserBasicInfos 
	 * @Description: TODO(保存用户的基本信息) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String saveUserBasicInfos(){
	    String nickName = request.getParameter("nickName");
	    String email = request.getParameter("email");
	    String phoneNum = request.getParameter("phoneNum");

	    if (!StringUtil.isEmpty(nickName) && !StringUtil.isEmpty(email) && !StringUtil.isEmpty(phoneNum)) {
            User user = (User) request.getSession().getAttribute(Constant.USER);
            user.setNickName(nickName);
            user.setEmail(email);
            user.setPhoneNum(phoneNum);
            this.userService.update(user);
        }
	    return "saveUserBasicInfos";
	}
	
	/**
	 * 
	 * @Title: saveUserPersonalInfors 
	 * @Description: TODO(保存个人资料) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String saveUserPersonalInfors() {
	    String realName = request.getParameter("realName");
	    String birth = request.getParameter("birth");
	    String sex = request.getParameter("sex");
	    String signature = request.getParameter("signature");
	    if (!StringUtil.isEmpty(realName) && !StringUtil.isEmpty(birth) && !StringUtil.isEmpty(sex) && !StringUtil.isEmpty(signature)) {
	        User user = (User) request.getSession().getAttribute(Constant.USER);
	        user.setUserRealName(realName);
	        user.setBirth(DateUtil.getDateFromTime(birth));
	        user.setSex(sex);
	        user.setSignature(signature);
	        this.userService.update(user);
        }

	    return "saveUserPersonalInfors";
	}
	/**
	 * 
	 * @Title: changeUserPassword 
	 * @Description: TODO(修改用户密码) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String changeUserPassword() {
	    String oldPassword = request.getParameter("oldPassword");
	    String newPassword = request.getParameter("newPassword");
	    String confirmPassword = request.getParameter("confirmPassword");

	    if (!StringUtil.isEmpty(oldPassword) && !StringUtil.isEmpty(newPassword) && !StringUtil.isEmpty(confirmPassword)) {
	        User user = (User) request.getSession().getAttribute(Constant.USER);
	        String ERROR_MSG = "";
	        if (user.getPassword().equals(oldPassword)) {
                if (oldPassword.equals(newPassword)) {
                    user.setPassword(newPassword);
                    this.userService.update(user);
                } else {
                    ERROR_MSG = "两次输入密码不一致";
                }
            } else {
                ERROR_MSG = "原密码输入错误";
            }
	        request.setAttribute(Constant.ERROR_MSG, ERROR_MSG);
        }
	    return "changeUserPassword";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest hsq) {
		this.request=hsq;
	}
	
}
