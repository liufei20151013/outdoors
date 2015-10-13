package com.wipe.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wipe.entity.Project;
import com.wipe.tool.JdbcConnect;

public class ProjectDao extends JdbcConnect{
	ArrayList<Project> list = new ArrayList<Project>();
	Statement stmt;
	Connection conn;
	ResultSet rs;
	PreparedStatement ps;

	/*****报名参加活动******/
	public boolean apply(Project pj){
		System.out.println("报名参加活动：");
		String sql = "insert into relation(PjId,userId, PjName, time) values(?,?, ?, ? )";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pj.getPjId());
			ps.setInt(2, pj.getUserId());
			ps.setString(3, pj.getPjName());
			ps.setTimestamp(4, new java.sql.Timestamp(new java.util.Date().getTime())); 
			ps.executeUpdate();
			System.out.println("报名成功！");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 查找活动
	 * @param PjId
	 * @param userId
	 * @return
	 */
	public boolean findProjectById(int PjId,int userId){

		String sql = "select * from relation where PjId = ? and userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, PjId);
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) { //这一步很重要
				System.out.println("查询成功！");
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/*****取消报名******/
	public boolean delete(int PjId,int userId){
		System.out.println("取消报名:");
		String sql = "delete from relation where PjId = ? and userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, PjId);
			ps.setInt(2, userId);
			ps.executeUpdate();
			System.out.println("取消报名成功！");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

//	public List<Project> selectAll(){
//		System.out.println("活动列表：");
//		String sql = "select * from relation";
//		try {
//			conn = super.getConnect();
//			ps = conn.prepareStatement(sql);
//			rs = ps.executeQuery();
//			while(rs.next()){
//				Project pj = new Project();
//				pj.setPjId(rs.getInt("PjId"));
//				//				pj.setPjName(rs.getString("PjName"));
//				pj.setTime(rs.getTime("time"));
//				list.add(pj);
//			}
//			return list;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//
//	}
//
//	public boolean update (Project pj){
//		System.out.println("修改活动信息：");
//		String sql = "update project set PjName = ? where PjId = ?";
//		try {
//			conn = super.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, pj.getPjId());
//			ps.setString(2, pj.getPjName());
//			ps.executeUpdate();
//			return true;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	public boolean addProject(Project pj){
//		System.out.println("添加活动：");
//		String sql = "insert into poieer(PjName, PjTime, time) values(?, ?, ?)";
//		try {
//			conn = super.getConnect();
//			ps.setString(1, pj.getPjName());
//			ps.setString(2, pj.getPjTime()); 
//			ps.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime())); 
//			ps.executeUpdate();
//			System.out.println("添加成功！");
//			return true;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return false;
//	}
}
