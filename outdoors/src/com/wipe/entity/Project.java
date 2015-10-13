package com.wipe.entity;

import java.sql.Time;

public class Project {
	private Integer userId;
	private Integer PjId;
	private String PjName;
	private String PjTime;
	private Time time;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getPjId() {
		return PjId;
	}
	public void setPjId(Integer pjId) {
		PjId = pjId;
	}
	public String getPjName() {
		return PjName;
	}
	public void setPjName(String pjName) {
		PjName = pjName;
	}
	public String getPjTime() {
		return PjTime;
	}
	public void setPjTime(String pjTime) {
		PjTime = pjTime;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	
	
	
}
