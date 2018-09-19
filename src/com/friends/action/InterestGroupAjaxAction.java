package com.friends.action;



import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.InterestGroup;
import com.friends.model.User;
import com.friends.service.UserService;

@Controller
@Scope("prototype")
public class InterestGroupAjaxAction extends BaseAction<InterestGroup> implements ServletRequestAware{

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
	public String addLikedInterestGroup() throws Exception{
	    String userId = request.getParameter("userId");
	    String interestGroupId = request.getParameter("interestGroupId");
	    String deleted = request.getParameter("deleted");;
	    User user = userService.getById(Integer.parseInt(userId));
	    InterestGroup interestGroup = this.interestGroupService.getById(Integer.parseInt(interestGroupId));
	    String msg = "";
	    if(!Boolean.parseBoolean(deleted)) {
	        msg = "收藏成功";
	        user.getInterestGroups().add(interestGroup);
	        interestGroup.getUsers().add(user);
	    } else {
	        msg = "取消收藏";
	        user.getInterestGroups().remove(interestGroup);
	        interestGroup.getUsers().remove(user);
	    }
	    this.userService.save(user);
	    this.interestGroupService.save(interestGroup);
	    request.getSession().setAttribute("user", user);
		ObjectMapper mapper = new ObjectMapper();
		result = mapper.writeValueAsString(msg);
		return SUCCESS;
	}
	public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
}
