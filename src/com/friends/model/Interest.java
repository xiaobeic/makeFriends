package com.friends.model;

import java.util.Set;

public class Interest {

	private Integer id;
	private String interestName;
	
	private Set<InterestGroup> interestGroups;
	
	public Set<InterestGroup> getInterestGroups() {
		return interestGroups;
	}
	public void setInterestGroups(Set<InterestGroup> interestGroups) {
		this.interestGroups = interestGroups;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	
}
