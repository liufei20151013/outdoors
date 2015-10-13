package com.wipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wipe.entity.User;
import com.wipe.tool.JdbcConnect;

public class UserDao extends JdbcConnect{
	Statement stmt;
	ResultSet rs;
	Connection conn;
	PreparedStatement ps;
	
	
	/**
	 * 查找用户
	 * @param username
	 * @param password
	 * @return
	 */
	public User findUser(String username, String password){
		User user=new User();
		
		String sql = "select * from user where username=? and password=?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setNickName(rs.getString("nickName"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("qq"));
				user.setQq(rs.getString("qq"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 查询用户基本信息
	 */
	public User findUserById(int userId){
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
				return user;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean login(String username,String password) {
		String sql = "select userId from user where username=? and password=?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,password);
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
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	public boolean addUser(User user){
		String sql = "insert into user(username,password,nickName," +
				"gender,phone,qq,email,regTime,headportrait,friendCount," +
				"fansCount,articleCount,activityCount) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getNickName());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getQq());
			ps.setString(7, user.getEmail());
			ps.setTimestamp(8, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setString(9, user.getHeadPortrait());
			ps.setInt(10, user.getFriendCount());
			ps.setInt(11, user.getFansCount());
			ps.setInt(12, user.getArticleCount());
			ps.setInt(13, user.getActivityCount());
            ps.execute();
            System.out.println("用户注册成功!");
            return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return false;
		
		
	}
	
	
	
	/**
	 * 通过用户名查找用户
	 * @param username
	 * @return
	 */
	public boolean findUserByUsername(String username){
		User user=new User();
		
		String sql = "select * from user where username=?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
//			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setNickName(rs.getString("nickName"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("qq"));
				user.setQq(rs.getString("qq"));
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public List<User> getFriendList(){
		String sql = "select * from user_friend";
		List<User> list = new ArrayList<User>();
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setFriendId(rs.getInt("friendId"));
				list.add(user);
			}
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> getFriendList(int currentPage, int Pagesize) {
		int startNum = (currentPage - 1) * Pagesize + 1;
		String sql = "select * from user limit ?,?";
		List<User> list = new ArrayList<User>();
		
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,startNum);
			ps.setInt(2, Pagesize);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setFriendId(rs.getInt("friendId"));
				list.add(user);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		// TODO Auto-generated method stub
	}
	
	public boolean selectFriend(int userId,int friendId){
		String sql = "select * from user_friend where userId = ? and friendId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, friendId);
			rs = ps.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setFriendId(rs.getInt("friendId"));
				
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean addFriend(int userId,int friendId){
		String sql = "insert into user_friend values(?,?,?)";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, friendId);
			ps.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
