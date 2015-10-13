package com.wipe.entity;

import java.util.List;

/**
 * 从数据库返回的数据信息
 * @author Huang
 *
 */
public class QueryResult {

	//信息
	private List list;
	//总信息数
	private int totalrecord;
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	
	
}
