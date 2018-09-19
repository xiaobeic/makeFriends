package com.friends.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.Interest;
import com.friends.service.InterestService;
@Service
@Transactional
public class InterestServiceImpl extends BaseDaoImpl<Interest> implements InterestService{

	public List<Interest> getInterestInfos() {
		return getSession().createQuery("from Interest").list();
	}

}
