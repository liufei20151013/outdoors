package com.wipe.biz;

import com.wipe.dao.MessageDao;
import com.wipe.entity.QueryResult;
import com.wipe.entity.User;

public class MessageBiz {
	MessageDao md = new MessageDao();

	/**
	 * 显示用户基本信息
	 * @return
	 */
	public boolean findUserById(int userId){
		return md.findUserById(userId);
	}

	/**
	 * 修改用户信息
	 */
	public boolean updateUserMessage(int userId,User user){
		boolean a = md.findUserById(userId);
		if(a){
			return md.updateUserMessage(userId, user);
		}
		return false;
	}

	/**
	 * 修改密码
	 */
	public boolean updatePassword(int userId,User user){
		boolean a = md.findUserById(userId);
		if(a){
			return md.updatePassword(userId, user);
		}
		return false;
	}
	
	/**
	 * 修改头像
	 */
	public boolean updateHeadPortrait(int userId,User user){
		boolean a = md.findUserById(userId);
		if(a){
			return md.updateHeadPortrait(userId, user);
		}
		return false;
	}

	public QueryResult queryFans(int userId){
		return md.queryFans(userId);
	}
	
	public int getFriendCount(int userId){
		return md.getFriendCount(userId);
	}
	
	public int getFansCount(int userId){
		return md.getFansCount(userId);
	}
	
	public int getArticleCount(int userId){
		return md.getArticleCount(userId);
	}
	
	public int getActivityCount(int userId){
		return md.getActivityCount(userId);
	}
	
	public boolean chargeFans(int userId,int userId2){
		return md.chargeFans(userId, userId2);
	}
}
