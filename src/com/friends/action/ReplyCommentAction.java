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
import com.friends.model.ReplyComment;
import com.friends.model.User;
import com.friends.service.CommentService;

@Controller
@Scope("prototype")
public class ReplyCommentAction extends BaseAction<ReplyComment> implements ServletRequestAware {

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
	public String saveReplyComment() {
	    User user = (User) request.getSession().getAttribute(Constant.USER);
	    String editor = request.getParameter("editor");
	    String userDynamticId = request.getParameter("userDynamticId");
	    String replyUserId = request.getParameter("replyUserId");
	    String commentId = request.getParameter("commentId");
        if (user == null || StringUtil.isEmpty(userDynamticId) || StringUtil.isEmpty(replyUserId)
                || StringUtil.isEmpty(commentId)) {
            return "goUserDynamtic";
        } else {
            ReplyComment replyComment = new ReplyComment();
            replyComment.setReplyComment(editor);
            replyComment.setReplyTime(new Date());
            replyComment.setUser(user);
            replyComment.setReplyUser(this.userService.getById(Integer.parseInt(replyUserId)));
            replyComment.setComment(commentService.getById(Integer.parseInt(commentId)));
            replyCommentService.save(replyComment);
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
