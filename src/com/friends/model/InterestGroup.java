package com.friends.model;

import java.util.Date;
import java.util.Set;

public class InterestGroup {
	private Integer id;
	private int searchCount;
	private String groupName;
	private String groupBg;
	private String groupDesc;
	private String applyReason;
	private Date createdTime;
	
	private Set<User> users;
	private Set<UserDynamic> userDynamics;
	private Interest interest;
	private User createdUser;
	
	public Integer getId() {
		return id;
	} 
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Interest getInterest() {
		return interest;
	}
	public void setInterest(Interest interest) {
		this.interest = interest;
	}
	public String getGroupBg() {
		return groupBg;
	}
	public void setGroupBg(String groupBg) {
		this.groupBg = groupBg;
	}
	public String getGroupDesc() {
		return groupDesc;
	}
	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}
	public String getApplyReason() {
		return applyReason;
	}
	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	public Set<UserDynamic> getUserDynamics() {
		return userDynamics;
	}
	public void setUserDynamics(Set<UserDynamic> userDynamics) {
		this.userDynamics = userDynamics;
	}
	public int getSearchCount() {
		return searchCount;
	}
	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}
	public Set<User> getUsers() {
        return users;
    }
    public void setUsers(Set<User> users) {
        this.users = users;
    }
    public User getCreatedUser() {
        return createdUser;
    }
    public void setCreatedUser(User createdUser) {
        this.createdUser = createdUser;
    }
    public Date getCreatedTime() {
        return createdTime;
    }
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
	
}
