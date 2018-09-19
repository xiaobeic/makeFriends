package com.friends.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.UserDynamicPic;

@Controller
@Scope("prototype")
public class UserDynamticPicAction extends BaseAction<UserDynamicPic>{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -7080275035003245337L;

}
