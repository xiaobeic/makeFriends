package com.friends.model;

import java.util.Set;

public class UserDynamicPic {

	private Integer id;
	private String pic_name;
	
	private Set<UserDynamic> userDynamic;
	
	public Set<UserDynamic> getUserDynamic() {
		return userDynamic;
	}
	public void setUserDynamic(Set<UserDynamic> userDynamic) {
		this.userDynamic = userDynamic;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	
	
}
