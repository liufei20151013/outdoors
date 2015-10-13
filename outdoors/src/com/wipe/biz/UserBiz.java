package com.wipe.biz;

import java.util.List;

import com.wipe.dao.UserDao;
import com.wipe.entity.User;

public class UserBiz {
	UserDao ud = new UserDao();
	
	/**
	 * 用户登录
	 */
	public boolean login(String username, String password){
		return ud.login(username, password);	
	}
	/**
	 * 用户注册 register
	 * @param user
	 * @return
	 */
	public boolean register(User user){
		return ud.addUser(user);
		
	}
	
	/**
	 * 查找用户
	 * @param username
	 * @param password
	 * @return
	 */
	public User findUser(String username, String password) {

		boolean a = ud.login(username, password);
		if (a) {
			return ud.findUser(username, password);
		}
		return null;

	}
	
	
	/**
	 * 通过用户id查询用户
	 */
	public User findUserById(int userId){
		return ud.findUserById(userId);
	}
	
	
	/**
	 * 通过用户名查找用户
	 * @param username
	 * @return
	 */
	public boolean findUserByUsername(String username){
		return ud.findUserByUsername(username);
	}
	
	public List<User> getFriendList(){
		return ud.getFriendList();
	}
	
	public boolean selectFriend(int userId,int friendId){
		return ud.selectFriend(userId, friendId);
	}
	
	public boolean addFriend(int userId,int friendId){
		return ud.addFriend(userId, friendId);
	}
	
	public List<User> getFriendList(int currentPage, int Pagesize) {
		return ud.getFriendList(currentPage, Pagesize);
	}
}

