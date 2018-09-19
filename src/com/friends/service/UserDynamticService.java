package com.friends.service;

import java.util.List;

import com.friends.dao.BaseDao;
import com.friends.model.UserDynamic;

public interface UserDynamticService extends BaseDao<UserDynamic>{
	
	/**
	 * @Title: getUserDynamicsByInterestGroupId 
	 * @Description: TODO(通过兴趣小组的id获取用户动态) 
	 * @param @param interestGroupId
	 * @param @return    设定文件 
	 * @return List<UserDynamic>    返回类型 
	 * @throws
	 */
	public List<UserDynamic> getUserDynamicsByInterestGroupId(int interestGroupId);

    public UserDynamic getUserDynamticById(int parseInt);
}
