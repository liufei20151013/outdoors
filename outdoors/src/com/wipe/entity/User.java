package com.wipe.entity;

import java.sql.Time;

public class User {
	private Integer userId;
	private String username;
	private String password;
	private String nickName;//昵称
	private String gender;//性别
	private String phone;//手机号
	private String qq;//qq号
	private String email;//邮箱
	private Time regTime;//注册时间
	private String headPortrait;//头像
	private Integer friendCount;//好友人数
	private Integer fansCount;//粉丝人数
	private Integer activityCount;//发起活动数量
	private Integer articleCount;//发表足迹数量
	private Integer friendId;
	
	public Integer getFriendId() {
		return friendId;
	}
	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Time getRegTime() {
		return regTime;
	}
	public void setRegTime(Time regTime) {
		this.regTime = regTime;
	}
	public String getHeadPortrait() {
		return headPortrait;
	}
	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}
	public Integer getFriendCount() {
		return friendCount;
	}
	public void setFriendCount(Integer friendCount) {
		this.friendCount = friendCount;
	}
	public Integer getFansCount() {
		return fansCount;
	}
	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}
	public Integer getActivityCount() {
		return activityCount;
	}
	public void setActivityCount(Integer activityCount) {
		this.activityCount = activityCount;
	}
	public Integer getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}
	
}
