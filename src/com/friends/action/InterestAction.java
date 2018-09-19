package com.friends.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.Interest;
import com.friends.model.InterestGroup;
import com.friends.model.User;

@Controller
@Scope("prototype")
public class InterestAction extends BaseAction<Interest> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1787258346738810L;

	private HttpServletRequest request;
	
	/**
	 * @Title: getAllInterests 
	 * @Description: TODO(获取所有兴趣) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String getAllInfos(){
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    if (user != null) {
	        List<Integer> userLikedInterestGroupIds = new ArrayList<Integer>();
            for (InterestGroup interestGroup : user.getInterestGroups()) {
                userLikedInterestGroupIds.add(interestGroup.getId());
            }
            request.setAttribute("userLikedInterestGroupIds", userLikedInterestGroupIds);
        }
		String interestId = request.getParameter("interestId");
		List<Interest> list_interest = this.interestService.getInterestInfos();
		request.setAttribute("list_interest", list_interest);
		if (interestId != null) {
			Interest currentInterest = this.interestService.getById(Integer.parseInt(interestId));
			Set<InterestGroup> temp = this.interestService.getById(Integer.parseInt(interestId)).getInterestGroups();
			List<InterestGroup> list_interestGroup = new ArrayList<InterestGroup>();
			list_interestGroup.addAll(temp);
			request.setAttribute("list_interestGroup", list_interestGroup);
			request.setAttribute("currentInterestName", currentInterest.getInterestName());
		} else {
			List<InterestGroup> list_interestGroup = this.interestGroupService.getInterestGroupInfos();
			request.setAttribute("list_interestGroup", list_interestGroup);
		}
		return SUCCESS;
	}

	/**
	 * @Title: seeSpecificInterestGroup 
	 * @Description: TODO(查看指定类型的兴趣小组) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeSpecificInterestGroup(){
		String interestGroupId = request.getParameter("interestGroupId");
		if (interestGroupId != null) {
			Set<InterestGroup> temp = this.interestService.getById(Integer.parseInt(interestGroupId)).getInterestGroups();
			List<InterestGroup> list_interestGroup = new ArrayList<InterestGroup>();
			list_interestGroup.addAll(temp);
			request.setAttribute("list_interestGroup", list_interestGroup);
		}
		
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest hsq) {
		request = hsq;
	}
}
