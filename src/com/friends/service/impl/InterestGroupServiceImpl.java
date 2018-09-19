package com.friends.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.InterestGroup;
import com.friends.service.InterestGroupService;
@Service
@Transactional
public class InterestGroupServiceImpl extends BaseDaoImpl<InterestGroup> implements InterestGroupService{

	public List<InterestGroup> getInterestGroupInfos() {
		return getSession().createQuery("from InterestGroup").list();
	}

}
