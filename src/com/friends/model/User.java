package com.friends.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class User {
	
	private Integer id;
	private String userName;//账号
	private String sex;//性别
	private String signature;//个性签名
	private String password;
	private String head_pic;//用户头像
	private String level;//等级
	private int experience;//经验
	private String nickName;//昵称
	private String phoneNum;//手机号
	private Date birth;//出生日期
	private Date registerTime;//注册时间
	private String idCard;//身份证号
	private String email;//邮箱
	private String userRealName;
	
	private Set<InterestGroup> createdInterestGroups;
	private Set<InterestGroup> interestGroups;
	private Set<UserDynamic> userDynamics;
 	
	public Set<UserDynamic> getUserDynamics() {
		return userDynamics;
	}
	public void setUserDynamics(Set<UserDynamic> userDynamics) {
		this.userDynamics = userDynamics;
	}
	public Set<InterestGroup> getInterestGroups() {
		return interestGroups;
	}
	public void setInterestGroups(Set<InterestGroup> interestGroups) {
		this.interestGroups = interestGroups;
	}
	public String getHead_pic() {
		return head_pic;
	}
	public void setHead_pic(String head_pic) {
		this.head_pic = head_pic;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    public Set<InterestGroup> getCreatedInterestGroups() {
        return createdInterestGroups;
    }
    public void setCreatedInterestGroups(Set<InterestGroup> createdInterestGroups) {
        this.createdInterestGroups = createdInterestGroups;
    }
    public String getUserRealName() {
        return userRealName;
    }
    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public String getBirthTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(getBirth());
    }
}
