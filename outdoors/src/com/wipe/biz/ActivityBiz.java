package com.wipe.biz;

import java.util.List;

import com.wipe.dao.ActivityDao;
import com.wipe.entity.Activity;
import com.wipe.entity.PageInfo;
import com.wipe.entity.QueryResult;

public class ActivityBiz {
	ActivityDao ad = new ActivityDao();
	
	public boolean addMessage(Activity a) {
		return ad.addMessage(a);
	}
	
	public QueryResult myMessageList(PageInfo pf , int userId) {
		return ad.myMessageList(pf, userId);
	}

	public boolean findActivityById(int userId){
		return ad.findActivityById(userId);
	}
	
	public List<Activity> getActivityList(int currentPage, int Pagesize) {
		return ad.getActivityList(currentPage, Pagesize);
	}
	
	public List<Activity> getActivityList() {
		return ad.getActivityList();
	}
}
