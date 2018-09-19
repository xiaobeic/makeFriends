package com.friends.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.UserDynamic;
import com.friends.service.UserDynamticService;
@Service
@Transactional
public class UserDynamticServiceImpl extends BaseDaoImpl<UserDynamic> implements UserDynamticService{
	
	public List<UserDynamic> getUserDynamicsByInterestGroupId(int interestGroupId) {
		Query query = getSession().createQuery("from UserDynamic ud where ud.interestGroup.id = ? order by ud.Toped desc, ud.Picked desc, ud.time desc");
		query.setInteger(0, interestGroupId);
		return query.list();
	}

    public UserDynamic getUserDynamticById(int userDynamticId) {
        Query query = getSession().createQuery("from UserDynamic ud where ud.id = ?");
        query.setInteger(0, userDynamticId);
        return (UserDynamic) query.list().get(0);
    }
}
