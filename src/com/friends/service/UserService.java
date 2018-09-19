package com.friends.service;

import com.friends.dao.BaseDao;
import com.friends.model.User;

public interface UserService extends BaseDao<User>{

	/**
	 * @Title: login 
	 * @Description: TODO(用户登录) 
	 * @param @param user
	 * @param @return    设定文件 
	 * @return User    返回类型 
	 * @throws
	 */
	public User login(User user);
}
