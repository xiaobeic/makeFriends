package com.friends.service;

import java.util.List;

import com.friends.dao.BaseDao;
import com.friends.model.Interest;

public interface InterestService extends BaseDao<Interest>{

	/**
	 * @Title: getInterestInfos 
	 * @Description: TODO(获取所有兴趣信息列表) 
	 * @param @return    设定文件 
	 * @return List<Interest>    返回类型 
	 * @throws
	 */
	public List<Interest> getInterestInfos();

}
