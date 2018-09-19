package com.friends.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.Admin;

@Controller
@Scope("prototype")
public class AdminAction extends BaseAction<Admin>{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 3444780695776336974L;


}
