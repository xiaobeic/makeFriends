package com.friends.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.UserDynamicPic;
import com.friends.service.UserDynamicPicService;
@Service
@Transactional
public class UserDynamicPicServiceImpl extends BaseDaoImpl<UserDynamicPic> implements UserDynamicPicService{

}
