package com.friends.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.Comment;
import com.friends.model.User;
import com.friends.service.CommentService;

@Controller
@Scope("prototype")
public class CommentAction extends BaseAction<Comment> implements ServletRequestAware {

    private String userDynamticId;
    
    private HttpServletRequest request;
    
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 3444780695776336974L;

	/**
	 * @Title: saveComment 
	 * @Description: TODO(保存comments - 一级保存) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String saveComment() {
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    String editor = request.getParameter("editor");
	    String userDynamticId = request.getParameter("userDynamticId");
        if (user == null || StringUtil.isEmpty(userDynamticId)) {
            return "goUserDynamtic";
        } else {
            Comment comment = new Comment();
            comment.setComment(editor);
            comment.setReplyTime(new Date());
            comment.setUser(user);
            comment.setUserDynamic(userDynamticService.getById(Integer.parseInt(userDynamticId)));
            commentService.save(comment);
            this.setUserDynamticId(userDynamticId);
            return "goUserDynamtic";
        }
	}

    @Override
    public void setServletRequest(HttpServletRequest hsq) {
        this.request = hsq;
    }

    public void setUserDynamticId(String userDynamticId) {
        this.userDynamticId = userDynamticId;
    }
    public String getUserDynamticId() {
        return userDynamticId;
    }
    
}
