package com.friends.service;

import java.util.List;

import com.friends.dao.BaseDao;
import com.friends.model.InterestGroup;

public interface InterestGroupService extends BaseDao<InterestGroup>{

	/**
	 * @Title: getInterestGroupInfos 
	 * @Description: TODO(获取所有兴趣小组) 
	 * @param @return    设定文件 
	 * @return List<InterestGroup>    返回类型 
	 * @throws
	 */
	public List<InterestGroup> getInterestGroupInfos();
}
