package com.wipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mysql.jdbc.Statement;
import com.wipe.entity.Activity;
import com.wipe.entity.PageInfo;
import com.wipe.entity.QueryResult;
import com.wipe.tool.JdbcConnect;
import com.wipe.tool.JdbcUtils;

public class ActivityDao extends JdbcConnect{
	Statement stmt;
	ResultSet rs;
	Connection conn;
	PreparedStatement ps;

	public boolean addMessage(Activity a) {
		try {
			//1.先放到travel_message表中
			String sql = "insert into travel_message (activityId,name,message,userId," +
					"username,imageCount,writeTime,qq,phone) values(?,?,?,?,?,?,?,?,?)";
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, a.getActivityId());
			ps.setString(2, a.getName());
			ps.setString(3, a.getMessage());
			ps.setInt(4, a.getUserId());
			ps.setString(5, a.getUsername());
			ps.setInt(6, a.getImageCount());
			ps.setTimestamp(7, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setString(8, a.getQq());
			ps.setString(9, a.getPhone());
			ps.execute();
			System.out.println("添加成功！");

			//2.再放到travel_message_image表中
			List<String> imageList=a.getImage();
			//先做判断，看有没有图片
			if(imageList!=null){
				sql="insert into travel_message_image values(?,?)";
				for(String imageName:imageList){
					ps = conn.prepareStatement(sql);
					ps.setString(1, a.getActivityId());
					ps.setString(2, imageName);
					ps.execute();
					System.out.println("添加成功！");

					return true;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public QueryResult myMessageList(PageInfo pf , int userId) {
		int startindex = 0;
		int pagesize = 10;
		QueryResult queryResult=new QueryResult();
		QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
		String sql=null;
		List list=new ArrayList();
		// 数据总数
		int totalrecord = 0;

		sql="select * from travel_message where userId=?";
		//循环拿到指定序号的数据
		for(int i=startindex;i<startindex+pagesize;i++){
			try {
				conn = super.getConnect();
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				while (rs.next()) {
					Activity a = new Activity();
					a.setActivityId(rs.getString("activityId"));
					a.setName(rs.getString("name"));
					a.setUserId(rs.getInt("userId"));
					a.setUsername(rs.getString("username"));
					a.setMessage(rs.getString("message"));
					a.setImageCount(rs.getInt("imageCount"));
					a.setWriteTime(rs.getTime("writeTime"));
					a.setQq(rs.getString("qq"));
					a.setPhone(rs.getString("phone"));

					if(a!=null){
						//如果有图片，去拿到图片的数据
						if(a.getImageCount()!=0){
							sql="select imageName from travel_message_image where activityId=?";
							ps = conn.prepareStatement(sql);
							ps.setString(1, a.getActivityId());
							rs = ps.executeQuery();
							while (rs.next()) {
								a.setActivityId(rs.getString("activityId"));
								a.setImageName(rs.getString("imageName"));
								List<Object[]> query=runner.query(sql, new ArrayListHandler(), a.getActivityId());
								List<String> image=new ArrayList<String>();
								for(Object[] obj:query){
									image.add(obj[0].toString());
								}
								a.setImage(image);
							}
							list.add(a);
						}

					}
				}

				sql="select count(*) from travel_message where userId=?";
				Long count = (Long) runner.query(sql, new ScalarHandler(), userId);

				queryResult.setList(list);

				queryResult.setTotalrecord(count.intValue());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return queryResult;

	}

	public boolean findActivityById(int userId){
		String sql = "select activityId from travel_message where userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public List<Activity> getActivityList(int currentPage, int Pagesize) {
		int startNum = (currentPage - 1) * Pagesize + 1;
		String sql = "select * from travel_message limit ?,?";
		List<Activity> list = new ArrayList<Activity>();

		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,startNum);
			ps.setInt(2, Pagesize);
			rs = ps.executeQuery();
			while (rs.next()) {
				Activity a = new Activity();
				a.setActivityId(rs.getString("activityId"));
				a.setName(rs.getString("name"));
				a.setUserId(rs.getInt("userId"));
				a.setUsername(rs.getString("username"));
				a.setMessage(rs.getString("message"));
				a.setImageCount(rs.getInt("imageCount"));
				a.setWriteTime(rs.getTime("writeTime"));
				a.setQq(rs.getString("qq"));
				a.setPhone(rs.getString("phone"));
				list.add(a);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		// TODO Auto-generated method stub

	}
	
	public List<Activity> getActivityList() {
		String sql = "select * from travel_message ";
		List<Activity> list = new ArrayList<Activity>();

		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Activity a = new Activity();
				a.setActivityId(rs.getString("activityId"));
				a.setName(rs.getString("name"));
				a.setUserId(rs.getInt("userId"));
				a.setUsername(rs.getString("username"));
				a.setMessage(rs.getString("message"));
				a.setImageCount(rs.getInt("imageCount"));
				a.setWriteTime(rs.getTime("writeTime"));
				a.setQq(rs.getString("qq"));
				a.setPhone(rs.getString("phone"));
				list.add(a);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//	public QueryResult myMessageList(int startindex, int pagesize, int userId) {
	//		try {
	//			QueryResult queryResult=new QueryResult();
	//			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
	//			String sql=null;
	//			List list=new ArrayList();
	//			// 数据总数
	//			int totalrecord = 0;
	//
	//			sql="select * from travel_message where userId=?";
	//			//循环拿到指定序号的数据
	//			for(int i=startindex;i<startindex+pagesize;i++){
	//				Activity a = runner.query(sql, new BeanHandler<Activity>(Activity.class), userId,i,i+1);
	//				if(a!=null){
	//					
	//					//如果有图片，去拿到图片的数据
	//					if(a.getImageCount()!=0){
	//						String sql1="select imageName from travel_message_image where activityId=?";
	//						List<Object[]> query=runner.query(sql1, new ArrayListHandler(), a.getActivityId());
	//						List<String> image=new ArrayList<String>();
	//						for(Object[] obj:query){
	//							image.add(obj[0].toString());
	//						}
	//						a.setImage(image);
	//					}
	//					list.add(a);
	//				}
	//			}
	//			
	//			sql="select count(*) from travel_message where userId=?";
	//			Long count = (Long) runner.query(sql, new ScalarHandler(), userId);
	//			
	//			queryResult.setList(list);
	//			
	//			queryResult.setTotalrecord(count.intValue());
	//			return queryResult;
	//		} catch (Exception e) {
	//			// TODO Auto-generated catch block
	//			throw new RuntimeException(e);
	//		}
	//	}
}
