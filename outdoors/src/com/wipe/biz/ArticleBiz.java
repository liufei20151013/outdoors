package com.wipe.biz;

import java.util.List;

import com.wipe.dao.ArticleDao;
import com.wipe.entity.PageInfo;
import com.wipe.entity.QueryResult;
import com.wipe.entity.article.Article;
import com.wipe.entity.article.ArticleContent;
import com.wipe.entity.article.ArticleDay;
import com.wipe.entity.article.ArticleType;
import com.wipe.entity.article.ArticleTypeType;

public class ArticleBiz {
	ArticleDao ad = new ArticleDao();

	/**
	 * 创建一篇游记
	 * @param a
	 * @return
	 */
	public boolean createArticle(String articleId,int userId){
		return ad.createArticle(articleId, userId);
	}

	public boolean updateWriteTime(String articleId){
		return ad.updateWriteTime(articleId);
	}

	/**
	 * 添加异步上传的信息
	 * @param articleId
	 * @param name
	 * @return
	 */
	public boolean addMessage(String articleId,String name, String value){
		return ad.addMessage(articleId, name, value);
	}

	/**
	 * 添加异步上传的每一天的前言
	 * @param articleId
	 * @param dayId
	 * @param preface
	 * @return
	 */
	public boolean addPreface(String articleId, int dayId, String preface) {
		return ad.addPreface(articleId, dayId, preface);
	}

	/**
	 * 添加异步上传的每张图片下的content
	 * @param imageName
	 * @param content
	 * @return
	 */
	public boolean addContent(String imageName, String content) {
		return ad.addContent(imageName, content);
	}

	/**
	 * 删除异步上传的每张图片下的content
	 */
	public boolean delContent(String articleId, int dayId, int contentId) {
		return ad.delContent(articleId, dayId, contentId);
	}
	
	/**
	 * 异步删除天
	 * @param articleId
	 * @param dayId
	 * @return
	 */
	public boolean delDay(String articleId,int dayId){
		return ad.delDay(articleId, dayId);
	}

	/**
	 * 添加图片
	 * @param articleId
	 * @param dayId
	 * @param imageName
	 * @return
	 */
	public boolean addArticleImage(String articleId,int dayId,String imageName){
		return ad.addArticleImage(articleId, dayId, imageName);
	}
	
	/**
	 * 在article_day表中找到所有关于天的数据
	 * @param articleId
	 * @return
	 */
//	public ArticleDay findArticleDay(String articleId) {
//		return ad.findArticleDay(articleId);
//	}
//	
//	/**
//	 * 在article_content表中迭代出每一天的所有图片，信息
//	 * @param articleId
//	 * @return
//	 */
//	public ArticleContent findArticleContent(String articleId,int dayId) {
//		return ad.findArticleContent(articleId, dayId);
//	}
//	
	/**
	 * 在user_article表中找信息
	 * @param userId
	 * @return
	 */
	public Article findArticle(String articleId) {
		return ad.findArticle(articleId);
	}

	/**
	 * 进入页面时，显示大的游记类型
	 * @return
	 */
	public List<ArticleType> showBigType() {
		return ad.showBigType();
	}

	/**
	 * 拿到大类型id后，从数据库中拿到小类型数据
	 * @param value
	 * @return
	 */
	public List<ArticleTypeType> showLittleType(String value) {
		return ad.showLittleType(value);
	}

	public int getArticleCountGreen(int userId) {
		return ad.getArticleCountGreen(userId);	
	}
	
	public List<Article> getAllArticle(int userId) {
		return ad.getAllArticle(userId);
	}
	
	public boolean deleteArticle(String articleId) {
		return ad.deleteArticle(articleId);
	}
	
	public List<Article> getArticleListGreen(int userId) {
		return ad.getAllArticle(userId);
	}
	
	public boolean changeFlagStatus(String articleId, int i) {
		return ad.changeFlagStatus(articleId, i);
	}
	
	public String getBigType(int bigId) {
		return ad.getBigType(bigId);
	}
	
	public String getLittleType(int bigId, int littleId) {
		return ad.getLittleType(bigId, littleId);
	}
	
	public QueryResult getAllArticle(int startindex, int pagesize) {
		return ad.getAllArticle(startindex, pagesize);	
	}
	
	public QueryResult queryArticle(int startindex, int pagesize, String where,Object[] whereParams) {
		return ad.queryArticle(startindex, pagesize, where, whereParams);
	}
	
	public QueryResult getGoodArticle(int startindex, int pagesize) {
		return ad.getGoodArticle(startindex, pagesize);
	}
	
	public boolean addGoodArticle(String articleId) {
		return ad.addGoodArticle(articleId);
	}
	
	public boolean deleteGoodArticle(String articleId) {
		return ad.deleteGoodArticle(articleId);
	}
	
	public boolean updateBgImage(String articleId, String imageName) {
		return ad.updateBgImage(articleId, imageName);
	}
	
	public List<Article> getGoodArticle(int i) {
		return ad.getGoodArticle(i);
	}
	
	public List<Article> getTypeArticle(int i, int j) {
		return ad.getTypeArticle(i, j);
	}
	
	public List<Article> getAllArticle() {
		return ad.getAllArticle();
	}
	
	public boolean deleteMessage(String id){
		return ad.deleteMessage(id);
	}
	
	public QueryResult queryMessage(int startindex,int pagesize,String where,Object[] whereParams){
		return ad.queryMessage(startindex, pagesize, where, whereParams);
	}
	
	public QueryResult queryMessage(PageInfo pf){
		return ad.queryMessage(pf);
	}
}
