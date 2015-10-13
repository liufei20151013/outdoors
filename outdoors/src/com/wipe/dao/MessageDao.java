package com.wipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mysql.jdbc.Statement;
import com.wipe.entity.QueryResult;
import com.wipe.entity.User;
import com.wipe.tool.JdbcConnect;
import com.wipe.tool.JdbcUtils;

public class MessageDao extends JdbcConnect{
	Statement stmt;
	ResultSet rs;
	Connection conn;
	PreparedStatement ps;

	/**
	 * 查询用户基本信息
	 */
	public boolean findUserById(int userId){
		User user = new User();
		String sql = "select * from user where userId = ? ";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()){
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setNickName(rs.getString("nickName"));
				user.setGender(rs.getString("gender"));
				user.setPhone(rs.getString("phone"));
				user.setQq(rs.getString("qq"));
				user.setEmail(rs.getString("email"));
				user.setHeadPortrait(rs.getString("headPortrait"));
				user.setFriendCount(rs.getInt("friendCount"));
				user.setFansCount(rs.getInt("fansCount"));
				user.setArticleCount(rs.getInt("articleCount"));
				user.setActivityCount(rs.getInt("activityCount"));
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 修改用户信息
	 */
	public boolean updateUserMessage(int userId,User user){
		System.out.println("123"+userId);
		String sql = "update user set username=?,nickName=?, gender=?," +
				"phone=?,qq=?,email=? where userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			System.out.println(user.getUsername());
			ps.setString(2, user.getNickName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getQq());
			ps.setString(6, user.getEmail());
			ps.setInt(7, user.getUserId());
			System.out.println(userId);
			int rs = ps.executeUpdate();
			System.out.println(rs);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 修改密码
	 */
	public boolean updatePassword(int userId,User user){
		System.out.println("123"+userId);
		String sql = "update user set password=? where userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			System.out.println(user.getPassword());
			ps.setInt(2, user.getUserId());

			int rs = ps.executeUpdate();
			System.out.println(rs);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 修改用户头像
	 */
	public boolean updateHeadPortrait(int userId,User user){
		System.out.println("123"+userId);
		String sql = "update user set headPortrait = ? where userId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getHeadPortrait());
			System.out.println(user.getHeadPortrait());
			ps.setInt(2, user.getUserId());

			int rs = ps.executeUpdate();
			System.out.println(rs);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public QueryResult queryFans(int userId){
		try {
			QueryResult qr = new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = null;
			List<Object[]> list = null;
			//用来存好友的信息
			List<User> fans = new ArrayList<User>();
			//数据总数
			int totalrecord = 0;
			int startindex = 0;
			int pagesize = 0;
			sql = "select userId from user_friend where friendId = ? order by addTime desc";

			//获取数据总条数
			totalrecord = list.size();
			if(totalrecord <= startindex + pagesize){
				//如果list大小小于总数
				list = list.subList(startindex, totalrecord);
			}else{
				list = list.subList(startindex, startindex + pagesize);
			}
			sql = "select * from user where userId = ?";
			for(Object[] obj:list){
				User user = runner.query(sql, new BeanHandler<User>(User.class),obj);
				fans.add(user);
			}
			qr.setList(fans);
			qr.setTotalrecord(totalrecord);
			return qr;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.getMessage();
			throw new RuntimeException(e);

		}
	}

	public int getFriendCount(int userId){
		try {
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select count(friendId) from user_friend where userId = ?";
			return ((Long)qr.query(sql, new ScalarHandler(),userId)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public int getFansCount(int userId){
		try {
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select count(friendId) from user_friend where friendId = ?";
			return ((Long)qr.query(sql, new ScalarHandler(),userId)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public int getArticleCount(int userId){
		try {
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select count(*) from user_article where userId = ?";
			return ((Long)qr.query(sql, new ScalarHandler(),userId)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public int getActivityCount(int userId){
		try {
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select count(*) from travel_message where userId = ?";
			return ((Long)qr.query(sql, new ScalarHandler(),userId)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public boolean chargeFans(int userId,int userId2){
		try {
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_friend where userId = ? and friendId = ?";
			Object count = qr.query(sql, new ScalarHandler(),userId,userId2);
			if(count!=null)
				return true;
			else
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
}
