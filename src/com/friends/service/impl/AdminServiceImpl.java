package com.friends.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.Admin;
import com.friends.service.AdminService;
@Service
@Transactional
public class AdminServiceImpl extends BaseDaoImpl<Admin> implements AdminService{

}
