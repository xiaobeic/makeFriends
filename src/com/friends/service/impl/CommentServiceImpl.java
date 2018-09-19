package com.friends.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.Comment;
import com.friends.service.CommentService;
@Service
@Transactional
public class CommentServiceImpl extends BaseDaoImpl<Comment> implements CommentService{

}
