package com.friends.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.friends.dao.BaseDaoImpl;
import com.friends.model.Comment;
import com.friends.model.ReplyComment;
import com.friends.service.CommentService;
import com.friends.service.ReplyCommentService;
@Service
@Transactional
public class ReplyCommentServiceImpl extends BaseDaoImpl<ReplyComment> implements ReplyCommentService{

}
