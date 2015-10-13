package com.wipe.entity;

import java.util.HashMap;
import java.util.List;

/**
 * 返回到页面上的信息
 * @author Huang
 *
 */
public class PageBean {

	//List信息集合
	private List list;
	//信息总数
	private int totalrecord;
	//页码总数
	private int totalpage;
	//每页的信息数
	private int pagesize;
	//当前页
	private int currentpage;
	//上一页
	private int previouspage;
	//下一页
	private int nextpage;
	//页码显示条
	private int[] pagebar;
	
	
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
	//总页数
	public int getTotalpage() {
		if(this.totalrecord%this.pagesize==0){
			this.totalpage=this.totalrecord/this.pagesize;
		}else{
			this.totalpage=this.totalrecord/this.pagesize+1;
		}
		return totalpage;
	}
	
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	//上一页
	public int getPreviouspage() {
		if(this.currentpage==1){
			this.previouspage=1;
		}else{
			this.previouspage=this.currentpage-1;
		}
		return previouspage;
	}
	//下一页
	public int getNextpage() {
		if(this.currentpage==this.totalpage){
			this.nextpage=this.totalpage;
		}else{
			this.nextpage=this.currentpage+1;
		}
		return nextpage;
	}
	
	//页码条
	public int[] getPagebar() {
		int shiwei=this.currentpage/10;
		int startpage=shiwei*10+1;
		int endpage=startpage+9;
		if(endpage>this.totalpage){
			endpage=this.totalpage;
		}
		this.pagebar=new int[endpage-startpage+1];
		for(int i=startpage;i<=endpage;i++){
			pagebar[i-startpage]=i;
		}
		return pagebar;
	}
	
	
}
