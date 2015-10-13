package com.wipe.entity.article;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ArticleQueryForm {


	private String userId;//用户Id
	private String name;//足迹名称
	private String articleStatus;//足迹状态
	private String startDate;//开始时间
	private String endDate;//结束时间
	


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(String articleStatus) {
		this.articleStatus = articleStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public WhereAndParams buildWhere(){
		
		StringBuffer sb=new StringBuffer();
		List list=new ArrayList();
		sb.append(" where 1=1 ");
		if(userId!=null&&!userId.trim().equals("")){
			sb.append("and userId = ? ");
			list.add(userId);
		}
		if(name!=null&&!name.trim().equals("")){
			sb.append("and name = ? ");
			list.add(name);
		}
		if(articleStatus!=null&&!articleStatus.trim().equals("")){
			sb.append("and flag =? ");
			list.add(articleStatus);
		}
		if(startDate!=null&&!startDate.trim().equals("")){
			sb.append("and writeTime >=? ");
			list.add(startDate);
		}
		if(endDate!=null&&!endDate.trim().equals("")){
			sb.append("and writeTime<=?");
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date=dateFormat.parse(endDate);
				Calendar calendar=Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DAY_OF_MONTH, 1);
				Date d=calendar.getTime();
				list.add(d);
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return new WhereAndParams(sb.toString(),list.toArray());
		
	}
	
	public class WhereAndParams {
		private String where;
		private Object[] params;
		
		
		
		
		public WhereAndParams() {
			super();
			// TODO Auto-generated constructor stub
		}
		public WhereAndParams(String where, Object[] params) {
			super();
			this.where = where;
			this.params = params;
		}
		public String getWhere() {
			return where;
		}
		public void setWhere(String where) {
			this.where = where;
		}
		public Object[] getParams() {
			return params;
		}
		public void setParams(Object[] params) {
			this.params = params;
		}
		
		
	}
	
}
