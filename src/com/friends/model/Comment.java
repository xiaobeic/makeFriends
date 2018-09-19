package com.friends.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class Comment {

    private int id;
    private Date replyTime;
    private String comment;

    private Set<ReplyComment> replyComments;
    private UserDynamic userDynamic;
    private User user;

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
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public Set<ReplyComment> getReplyComments() {
        return replyComments;
    }
    public void setReplyComments(Set<ReplyComment> replyComments) {
        this.replyComments = replyComments;
    }
    public UserDynamic getUserDynamic() {
        return userDynamic;
    }
    public void setUserDynamic(UserDynamic userDynamic) {
        this.userDynamic = userDynamic;
    }
    public String getPublishTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        String publishTime = sdf.format(getReplyTime());
        return publishTime.substring(0, publishTime.length());
    }
}
