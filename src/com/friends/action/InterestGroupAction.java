package com.friends.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import util.DateUtil;
import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.Interest;
import com.friends.model.InterestGroup;
import com.friends.model.User;
import com.friends.model.UserDynamic;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

@Controller
@Scope("prototype")
public class InterestGroupAction extends BaseAction<InterestGroup> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -1501524264138118400L;

	private String interestGroupId;
	private File interestGroupBg;
	private String interestGroupBgFileName;
	private String interestGroupBgContentType;
	
	private HttpServletRequest request;
	
	/**
	 * @Title: seeSpecificInterestGroup 
	 * @Description: TODO(查看兴趣小组的信息) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeInterestGroup(){
		String interestGroupId = request.getParameter("interestGroupId");
		if (interestGroupId!=null) {
		    User user = (User) request.getSession().getAttribute(Constant.USER);
	        if (user != null) {
	            List<Integer> userLikedInterestGroupIds = new ArrayList<Integer>();
	            for (InterestGroup interestGroup : user.getInterestGroups()) {
	                userLikedInterestGroupIds.add(interestGroup.getId());
	            }
	            request.setAttribute("userLikedInterestGroupIds", userLikedInterestGroupIds);
	        }
			InterestGroup interestGroup = this.interestGroupService.getById(Integer.parseInt(interestGroupId));
			List<UserDynamic> userDynamics = this.userDynamticService.getUserDynamicsByInterestGroupId(Integer.parseInt(interestGroupId));
			request.setAttribute("interestGroup", interestGroup);
			request.setAttribute("userDynamics", userDynamics);
		}
		return SUCCESS;
	}

	/**
	 * @Title: seeSpecificInterestGroup 
	 * @Description: TODO(查看具体的兴趣小组) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeSpecificInterestGroup(){
		String interestGroupId = request.getParameter("interestGroupId");
		if (interestGroupId!=null) {
			InterestGroup interestGroup = this.interestGroupService.getById(Integer.parseInt(interestGroupId));
			request.setAttribute("interestGroup", interestGroup);
		}
		return SUCCESS;
	}

	/**
	 * @Title: createInterestGroup 
	 * @Description: TODO(进入创建兴趣小组的页面) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String createInterestGroup() {
	    List<Interest> interests = this.interestService.findAll();
	    
	    request.setAttribute("interests", interests);
	    return "createInterestGroup";
	}
	/**
	 * @Title: saveCreatedInterestGroup 
	 * @Description: TODO(创建兴趣小组) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String saveCreatedInterestGroup() {
	    String interestGroupName = request.getParameter("interestGroupName");
	    String interestId = request.getParameter("interestId");
	    String interestGroupDesc = request.getParameter("interestGroupDesc");
	    String applyReason = request.getParameter("applyReason");
	    String userRealName = request.getParameter("userRealName");
	    String userBirthday = request.getParameter("userBirthday");
	    String userIdCard = request.getParameter("userIdCard");
	    String userEmail = request.getParameter("userEmail");
	    String userPhoneNumber = request.getParameter("userPhoneNumber");
	    
	    String savePath = ServletActionContext.getServletContext().getRealPath("/" + Constant.UPLOAD_FOLDER);
	    String fileName = StringUtil.createFileName() + interestGroupBgFileName.substring(interestGroupBgFileName.lastIndexOf("."));

	    InterestGroup interestGroup = new InterestGroup();
	    interestGroup.setGroupName(interestGroupName);
	    interestGroup.setGroupBg(Constant.UPLOAD_FOLDER + fileName);
	    interestGroup.setSearchCount(0);
	    interestGroup.setInterest(this.interestService.getById(Integer.parseInt(interestId)));
	    interestGroup.setGroupDesc(interestGroupDesc);
	    interestGroup.setApplyReason(applyReason);
	    interestGroup.setCreatedTime(new Date());
	    this.interestGroupService.save(interestGroup);
	    
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    user.setUserRealName(userRealName);
	    user.setBirth(DateUtil.getDateFromTime(userBirthday));
	    user.setIdCard(userIdCard);
	    user.setEmail(userEmail);
	    user.setPhoneNum(userPhoneNumber);
	    user.getCreatedInterestGroups().add(interestGroup);
	    this.userService.update(user);
	    
	    File saveFile = new File(savePath);
	    if (!saveFile.exists()) {
            saveFile.mkdirs();
        }
	    try {
            FileInputStream fis = new FileInputStream(interestGroupBg);
            FileOutputStream fos = new FileOutputStream(new File(savePath, fileName));
            IOUtils.copy(fis, fos);
            fos.flush();
            fos.close();
            fis.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	    request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
	    return "saveCreatedInterestGroup";
	}
	public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
	
	//UserDynamticAction会传递interestGroupId的值
	public void setInterestGroupId(String interestGroupId) {
		this.interestGroupId = interestGroupId;
	}

    public File getInterestGroupBg() {
        return interestGroupBg;
    }
    public void setInterestGroupBg(File interestGroupBg) {
        this.interestGroupBg = interestGroupBg;
    }
    public String getInterestGroupBgFileName() {
        return interestGroupBgFileName;
    }
    public void setInterestGroupBgFileName(String interestGroupBgFileName) {
        this.interestGroupBgFileName = interestGroupBgFileName;
    }
    public String getInterestGroupBgContentType() {
        return interestGroupBgContentType;
    }
    public void setInterestGroupBgContentType(String interestGroupBgContentType) {
        this.interestGroupBgContentType = interestGroupBgContentType;
    }
}
