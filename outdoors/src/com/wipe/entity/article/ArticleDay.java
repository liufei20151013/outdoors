package com.wipe.entity.article;

import java.sql.Time;
import java.util.Date;
import java.util.List;

//游记天数
public class ArticleDay {

	private String articleId;//足迹Id
	private Integer dayId;//天数Id
	private String preface;//感想
	private List<ArticleContent> content;//足迹内容
	private Integer contentCount;//足迹内容条数
	private Date thisTime;//用来显示当前时间
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public Integer getDayId() {
		return dayId;
	}
	public void setDayId(Integer dayId) {
		this.dayId = dayId;
	}
	public String getPreface() {
		return preface;
	}
	public void setPreface(String preface) {
		this.preface = preface;
	}
	public List<ArticleContent> getContent() {
		return content;
	}
	public void setContent(List<ArticleContent> content) {
		this.content = content;
	}
	public Integer getContentCount() {
		return contentCount;
	}
	public void setContentCount(Integer contentCount) {
		this.contentCount = contentCount;
	}
	public Date getThisTime() {
		return thisTime;
	}
	public void setThisTime(Date date) {
		this.thisTime = date;
	}
	
	
	
}
