package com.friends.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyComment {

    private int id;
    private Date replyTime;
    private String replyComment;

    private Comment comment;
    private User user;
    private User replyUser;

    public User getReplyUser() {
        return replyUser;
    }
    public void setReplyUser(User replyUser) {
        this.replyUser = replyUser;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Date getReplyTime() {
        return replyTime;
    }
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }
    public String getReplyComment() {
        return replyComment;
    }
    public void setReplyComment(String replyComment) {
        this.replyComment = replyComment;
    }
    public Comment getComment() {
        return comment;
    }
    public void setComment(Comment comment) {
        this.comment = comment;
    }
    public String getPublishTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        String publishTime = sdf.format(getReplyTime());
        return publishTime.substring(0, publishTime.length());
    }
}
