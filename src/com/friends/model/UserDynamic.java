package com.friends.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class UserDynamic {

	private Integer id;
	private String title;
	private String content;
	private Date time;
	private int Toped;//置顶
	private int Picked;//加精
	private int approveCount;
	private int notApproveCount;
	private int watchCount;
	
	private User user;
	private InterestGroup interestGroup;
	private Set<UserDynamicPic> userDynamicPics;
	private Set<Comment> comments;
	
	public int getApproveCount() {
        return approveCount;
    }
    public void setApproveCount(int approveCount) {
        this.approveCount = approveCount;
    }
    public int getNotApproveCount() {
        return notApproveCount;
    }
    public void setNotApproveCount(int notApproveCount) {
        this.notApproveCount = notApproveCount;
    }
	
	public Set<Comment> getComments() {
        return comments;
    }
    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }
    public Set<UserDynamicPic> getUserDynamicPics() {
		return userDynamicPics;
	}
	public void setUserDynamicPics(Set<UserDynamicPic> userDynamicPics) {
		this.userDynamicPics = userDynamicPics;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getToped() {
		return Toped;
	}
	public void setToped(int toped) {
		Toped = toped;
	}
	public int getPicked() {
		return Picked;
	}
	public void setPicked(int picked) {
		Picked = picked;
	}
	public InterestGroup getInterestGroup() {
		return interestGroup;
	}
	public void setInterestGroup(InterestGroup interestGroup) {
		this.interestGroup = interestGroup;
	}
	
	public int getWatchCount() {
        return watchCount;
    }
    public void setWatchCount(int watchCount) {
        this.watchCount = watchCount;
    }
    public String getPublishTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String publishTime = sdf.format(getTime());
		return publishTime.substring(0, publishTime.length());
	}
}
