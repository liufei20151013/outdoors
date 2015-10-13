package com.wipe.entity;

/**
 * 提交的分页信息
 * @author Huang
 *
 */
public class PageInfo {

	//当前页码
	private int currentpage=1;
	//每页显示的数目
	private int pagesize=10;
	//数据库起始位置
	private int startindex;
	
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getStartindex() {
		this.startindex=(this.currentpage-1)*this.pagesize;
		return startindex;
	}
	
	
}
