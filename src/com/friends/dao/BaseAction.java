package com.friends.dao;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import com.friends.service.AdminService;
import com.friends.service.CommentService;
import com.friends.service.InterestGroupService;
import com.friends.service.InterestService;
import com.friends.service.ReplyCommentService;
import com.friends.service.UserDynamicPicService;
import com.friends.service.UserDynamticService;
import com.friends.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{

	@Resource
	protected AdminService adminService;
	@Resource
	protected InterestService interestService;
	@Resource
	protected InterestGroupService interestGroupService;
	@Resource
	protected UserDynamicPicService userDynamicPicService;
	@Resource
	protected UserDynamticService userDynamticService;
	@Resource
	protected UserService userService;
	@Resource
    protected CommentService commentService;
	@Resource
	protected ReplyCommentService replyCommentService;
	
	
	protected T model;

	public BaseAction() {
		try {
			
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class clazz = (Class) pt.getActualTypeArguments()[0];
			
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}
}
