package com.friends.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.User;
import com.friends.model.UserDynamic;

@Controller
@Scope("prototype")
public class UserDynamticAction extends BaseAction<UserDynamic> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -9204636150225500544L;

	private String interestGroupId;
	private String userDynamticId;
	private HttpServletRequest request;

	/**
	 * @Title: saveDynamtic 
	 * @Description: TODO(保存动态) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String saveDynamtic() {
 		String dynamticTitle = request.getParameter("dynamticTitle");
		String dynamticContent = request.getParameter("putDynamtic");
		String interestGroupId = request.getParameter("interestGroupId");
		User user = (User) request.getSession().getAttribute(Constant.USER);
		if (user != null && !StringUtil.isEmpty(interestGroupId)) {
			UserDynamic userDynamic = new UserDynamic();
			userDynamic.setContent(dynamticContent);
			userDynamic.setTitle(dynamticTitle);
			userDynamic.setInterestGroup(this.interestGroupService.getById(Integer.parseInt(interestGroupId)));
			userDynamic.setToped(0);
			userDynamic.setPicked(0);
			userDynamic.setWatchCount(0);
			userDynamic.setUser(this.userService.getById(user.getId()));
			userDynamic.setTime(new Date());
			this.userDynamticService.save(userDynamic);
			this.setInterestGroupId(interestGroupId);
		}
		return "goInterestGroup";
	}
	/**
	 * @Title: seeUserDynamtic 
	 * @Description: TODO(查看用户动态) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeUserDynamtic() {
	    String userDynamticId = request.getParameter("userDynamticId");
	    UserDynamic userDynamic = null;
	    if (userDynamticId != null) {
	        userDynamic = this.userDynamticService.getUserDynamticById(Integer.parseInt(userDynamticId));
        }
	    //保存浏览数量
	    userDynamic.setWatchCount(userDynamic.getWatchCount() + 1);
	    this.userDynamticService.save(userDynamic);
	    request.setAttribute("userDynamic", userDynamic);
	    return "seeUserDynamtic";
	}
	
	/**
	 * @Title: seeMyDynamtic 
	 * @Description: TODO(查看user的dynamtic) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeMyDynamtic() {
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    List<UserDynamic> userDynamtics = new ArrayList<UserDynamic>();
	    userDynamtics.addAll(user.getUserDynamics());
	    request.setAttribute("userDynamtics", userDynamtics);
	    return "seeMyDynamtic";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest hsr) {
		this.request = hsr;
	}
	public String getInterestGroupId() {
		return interestGroupId;
	}
	public void setInterestGroupId(String interestGroupId) {
		this.interestGroupId = interestGroupId;
	}
	//CommentAction会传递userDynamticId过来
    public void setUserDynamticId(String userDynamticId) {
        this.userDynamticId = userDynamticId;
    }
}
