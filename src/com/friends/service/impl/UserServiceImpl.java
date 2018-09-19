package com.friends.service.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.User;
import com.friends.service.UserService;
@Service
@Transactional
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService{

	@Override
	public User login(User user) {
		Query query = getSession().createQuery("from User u where u.userName = ? and u.password = ?");
		query.setString(0, user.getUserName());
		query.setString(1, user.getPassword());
		if (query.list().size()!=0) {
			return (User) query.list().get(0);
		}else
			return null;
	}

}
