package com.wipe.entity.article;

import java.util.Date;
import java.util.List;

//游记
public class Article {

	private String articleId;//足迹Id
	private Integer userId;//用户Id
	private Integer bigId;//大的户外类型的Id
	private Integer littleId;//大的户外类型其中一种活动的Id
	private String name;//足迹名称
	private Date goTime;//出发时间
	private String place;//目的地
	private Integer people;//人数
	private String money;//花费
	private String preface;//感想
	private Date writeTime;//发表足迹时间
	private Integer flag;
	private Integer good;
	private List<ArticleDay> day;//发表的足迹天数
	private Integer dayCount;//天数
	private Integer imageCount;//图片数量
	private String bgImageName;//足迹背景图片
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getBigId() {
		return bigId;
	}
	public void setBigId(Integer bigId) {
		this.bigId = bigId;
	}
	public Integer getLittleId() {
		return littleId;
	}
	public void setLittleId(Integer littleId) {
		this.littleId = littleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getGoTime() {
		return goTime;
	}
	public void setGoTime(Date goTime) {
		this.goTime = goTime;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getPreface() {
		return preface;
	}
	public void setPreface(String preface) {
		this.preface = preface;
	}
	
	public Date getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getGood() {
		return good;
	}
	public void setGood(Integer good) {
		this.good = good;
	}
	public List<ArticleDay> getDay() {
		return day;
	}
	public void setDay(List<ArticleDay> day) {
		this.day = day;
	}
	public Integer getDayCount() {
		return dayCount;
	}
	public void setDayCount(Integer dayCount) {
		this.dayCount = dayCount;
	}
	public Integer getImageCount() {
		return imageCount;
	}
	public void setImageCount(Integer imageCount) {
		this.imageCount = imageCount;
	}
	public String getBgImageName() {
		return bgImageName;
	}
	public void setBgImageName(String bgImageName) {
		this.bgImageName = bgImageName;
	}
	
	
	
}
