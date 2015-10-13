package com.wipe.biz;

import java.util.List;

import com.wipe.dao.ProjectDao;
import com.wipe.entity.Project;

public class ProjectBiz {
	ProjectDao pd = new ProjectDao();
	
	/**
	 * 报名活动
	 * @param pj
	 * @return
	 */
	public boolean apply (Project pj){
		return pd.apply(pj);
	}
	/**
	 * 删除报名的活动
	 * @param userId
	 * @param PjId
	 * @return
	 */
	public boolean delete(int PjId,int userId){
		return pd.delete(PjId,userId);
	}

	/**
	 * 查找活动有没有报名
	 * @param PjId
	 * @param userId
	 * @return
	 */
	public boolean findProjectById(int PjId,int userId){
		return pd.findProjectById(PjId, userId);
	}
	
//	public List<Project> select(){
//		return pjDao.selectAll();
//	}
//	
//	
//	public boolean addProject(Project pj){
//		return pjDao.addProject(pj);
//	}
//	
}
