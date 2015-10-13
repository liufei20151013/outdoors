package com.wipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mysql.jdbc.Statement;
import com.wipe.entity.PageInfo;
import com.wipe.entity.PushMessage;
import com.wipe.entity.QueryResult;
import com.wipe.entity.User;
import com.wipe.entity.article.Article;
import com.wipe.entity.article.ArticleContent;
import com.wipe.entity.article.ArticleDay;
import com.wipe.entity.article.ArticleType;
import com.wipe.entity.article.ArticleTypeType;
import com.wipe.tool.CommonUtils;
import com.wipe.tool.JdbcConnect;
import com.wipe.tool.JdbcUtils;
import com.wipe.tool.UserFactory;

public class ArticleDao extends JdbcConnect{

	Statement stmt;
	ResultSet rs;
	Connection conn;
	PreparedStatement ps;
	ArrayList<ArticleType> list=new ArrayList<ArticleType>() ;
	ArrayList<ArticleTypeType> list2=new ArrayList<ArticleTypeType>() ;

	/**
	 * 创建游记
	 * @param articleId
	 * @param userId
	 */
	public boolean createArticle(String articleId,int userId){
		System.out.println("createArticle:");

		try {
			//创建游记的
			String sql = "insert into user_article (articleId,userId) values(?,?)";
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, articleId);
			ps.setInt(2, userId);
			ps.execute();
			//创建第一天的
			sql="insert into article_day(articleId,dayId) values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, articleId);
			ps.setInt(2, 1);
			ps.execute();
			//给一个发表游记的时间
			sql="update user_article set writeTime=? where articleId=?";
			ps = conn.prepareStatement(sql);
			ps.setTimestamp(1, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setString(2, articleId);
			ps.executeUpdate();

			System.out.println("用户发表足迹:");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		//		try {
		//			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
		//			//创建游记的
		//			String sql = "insert into user_article (articleId,userId) values(?,?)";
		//			runner.update(sql, articleId,userId);
		//			//创建第一天的
		//			sql="insert into article_day(articleId,dayId) values(?,?)";
		//			runner.update(sql, articleId,1);
		//			//给一个发表游记的时间
		//			sql="update user_article set writeTime=? where articleId=?";
		//			runner.update(sql, new Date(),articleId);
		//			//将他的状态置为未提交，也就是flag=3
		//			sql="update user_article set flag=3 where articleId=?";
		//			runner.update(sql, articleId);
		//
		//		} catch (SQLException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//			throw new RuntimeException(e);
		//		}
		//		return false;
	}

	/**
	 * 给一个发表游记的时间
	 * @param articleId
	 */
	public boolean updateWriteTime(String articleId){
		System.out.println("updateWriteTime:123");
		String sql="update user_article set writeTime = ? where articleId = ?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setTimestamp(1, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setString(2, articleId);
			int rs = ps.executeUpdate();
			System.out.println(rs);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean addMessage(String articleId, String name, String value) {
		System.out.println("addMessage:123");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "update user_article set "+name+" =? where articleId=?";
			System.out.println(name+articleId+value);
			runner.update(sql, value,articleId);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;		
	}

	public boolean addPreface(String articleId, int dayId, String preface) {
		System.out.println("addPreface:123");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			//添加天
			String sql="select * from article_day where articleId=? and dayId=?";
			ArticleDay day = runner.query(sql, new BeanHandler<ArticleDay>(ArticleDay.class), articleId,dayId);
			//如果没有查找到这天，创建一天 
			if(day==null){
				runner.update("insert into article_day (articleId,dayId) values(?,?)", articleId,dayId);
			}
			sql = "update article_day set preface=? where articleId=? and dayId=? ";
			runner.update(sql, preface,articleId,dayId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;

	}

	public boolean addContent(String imageName, String content) {
		System.out.println("addContent:123");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "update article_content set content = ? where imageName = ?";
			runner.update(sql,content,imageName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;
	}

	public boolean delContent(String articleId, int dayId, int contentId) {
		System.out.println("delContent:123");
		//		//1.删除数据库中数据//2.删除硬盘中数据（待完成）
		//		String sql="delete from article_content where contentId=?";
		//		try {
		//			conn = super.getConnect();
		//			ps = conn.prepareStatement(sql);
		//			ps.setInt(1, contentId);
		//			ps.executeUpdate();
		//			System.out.println("删除成功！");
		//			return true;
		//		} catch (SQLException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//		}
		//		return false;
		//	}
		//
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select imageName from article_content where contentId = ?";
			Object[] imageName = runner.query(sql, new ArrayHandler(),contentId);
			//如果结果不为空，才进行删除操作
			if(imageName!=null){
				//1.删除数据库中数据
				sql = "delete from article_content where contentId = ?";
				runner.update(sql,contentId);
				//2.删除硬盘中数据
				String path = UserFactory.getInstance().getUri("updateArticleUri")+articleId+"/"+dayId+"/"+imageName[0];
				CommonUtils.deletefile(path);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;	

	}

	public boolean delDay(String articleId, int dayId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			//1.删除article_content中的相关数据
			String sql="delete from article_content where articleId=? and dayId=?";
			runner.update(sql, articleId,dayId);
			//2.删除article_day中的相关数据
			sql="delete from article_day where articleId=? and dayId=?";
			runner.update(sql, articleId,dayId);
			//3.删除硬盘中的相关数据
			String path = UserFactory.getInstance().getUri("updateArticleUri")+ articleId+"/"+dayId;
			CommonUtils.deletefile(path);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;	

	}

	public boolean addArticleImage(String articleId,int dayId,String imageName){
		System.out.println("addArticleImage:123");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			//添加天
			String sql="select * from article_day where articleId=? and dayId=?";
			ArticleDay day = runner.query(sql, new BeanHandler<ArticleDay>(ArticleDay.class), articleId,dayId);
			//如果没有查找到这天，创建一天 
			if(day==null){
				runner.update("insert into article_day (articleId,dayId) values(?,?)", articleId,dayId);
			}
			sql = "insert into article_content (articleId,dayId,imageName) values(?,?,?)";
			runner.update(sql, articleId,dayId,imageName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;	

	}

	/**
	 * 在article_day表中找到所有关于天的数据
	 * @param articleId
	 * @return
	 */
//	public ArticleDay findArticleDay(String articleId) {
//		System.out.println("findArticleDay:123");
//		String sql="select * from article_day where articleId=? order by dayId";
//		try {
//			conn = super.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, articleId);
//			rs = ps.executeQuery();
//
//			while (rs.next()) { //这一步很重要
//				ArticleDay day = new ArticleDay();
//				day.setArticleId(rs.getString("articleid"));
//				day.setDayId(rs.getInt("dayId"));
//				day.setPreface(rs.getString("preface"));
//				System.out.println("查询成功！");
//				return day;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//		return null;
//	}
//
//	/**
//	 * 在article_content表中迭代出每一天的所有图片，信息
//	 * @param articleId
//	 * @return
//	 */
//	public ArticleContent findArticleContent(String articleId,int dayId) {
//		System.out.println("findArticleContent:123");
//		String sql="select * from article_content where articleId=? and dayId=?";
//		try {
//			conn = super.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, articleId);
//			ps.setInt(2, dayId);
//			rs = ps.executeQuery();
//
//			while (rs.next()) { //这一步很重要
//				ArticleContent content = new ArticleContent();
//				content.setArticleId(rs.getString("articleid"));
//				content.setDayId(rs.getInt("dayId"));
//				content.setContentId(rs.getInt("contentId"));
//				content.setImageName(rs.getString("imageName"));
//				content.setContent(rs.getString("content"));
//				System.out.println("查询成功！");
//				return content;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//		return null;
//	}

	/**
	 * 在user_article表中找信息
	 * @param articleId
	 * @return
	 */
	public Article findArticle(String articleId) {
		System.out.println("findArticle:123");
		System.out.println("articleId="+articleId);
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			System.out.println("sssssssssss123");
			//在article_day表中找到所有关于天的数据
			String sql="select * from article_day where articleId=? order by dayId";
			List<ArticleDay> day = runner.query(sql, new BeanListHandler<ArticleDay>(ArticleDay.class), articleId);
			System.out.println("ddddddddddd="+day);
			//在article_content表中迭代出每一天的所有图片，信息
			sql="select * from article_content where articleId=? and dayId=? order by contentId";
			for(ArticleDay d:day){
				List<ArticleContent> content = runner.query(sql, new BeanListHandler<ArticleContent>(ArticleContent.class), articleId,d.getDayId());
				d.setContent(content);
				System.out.println("content"+content);
			}
			//在user_article表中找信息
			sql="select * from user_article where articleId=?";
			Article article = runner.query(sql, new BeanHandler<Article>(Article.class), articleId);
			System.out.println("hhhhhhhhhhh="+article);
			article.setDay(day);
			System.out.println("day="+day);
			return article;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	/**
	 * 进入页面时，显示大的游记类型
	 * @return
	 */
	public List<ArticleType> showBigType() {
		System.out.println("showBigType:123");
		String sql = "select * from article_type";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) { //这一步很重要
				ArticleType at = new ArticleType();
				at.setId(rs.getInt("bigId"));
				System.out.println(rs.getInt("bigId"));
				at.setName(rs.getString("name"));
				System.out.println(rs.getString("name"));
				list.add(at);//将获取的值放到list列表中
				System.out.println("查询成功！");
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		//		try {
		//			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
		//			String sql = "select * from article_type";
		//			return runner.query(sql, new BeanListHandler<ArticleType>(ArticleType.class));
		//		} catch (SQLException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//			throw new RuntimeException(e);
		//		}
	}

	/**
	 * 拿到大类型数据项向数据库要小类型数据
	 * @param value
	 * @return
	 */
	public List<ArticleTypeType> showLittleType(String value) {
		System.out.println("showLittleType:");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from article_type_type where bigId ="+value;
			return runner.query(sql, new BeanListHandler<ArticleTypeType>(ArticleTypeType.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return list2;
	}

	public int getArticleCountGreen(int userId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select count(*) from customer_article where flag = 1 and customerId=?";
			Long l=(Long) runner.query(sql, new ScalarHandler(),userId);
			return l.intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return userId;
	}


	public List<Article> getAllArticle(int userId) {
		System.out.println("getAllArticle:123");
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_article where userId=? order by writeTime desc";
			List<Article> articleList = runner.query(sql, new BeanListHandler<Article>(Article.class), userId);

			String sqlDay="select * from article_day where articleId=?";
			String sqlContent="select * from article_content where articleId=? and dayId=?";
			for(Article article:articleList){
				String articleId=article.getArticleId();
				List<ArticleDay> articleDayList = runner.query(sqlDay, new BeanListHandler<ArticleDay>(ArticleDay.class), articleId);

				for(ArticleDay day:articleDayList){
					int dayId=day.getDayId();
					List<ArticleContent> articleContentList = runner.query(sqlContent, new BeanListHandler<ArticleContent>(ArticleContent.class), articleId,dayId);
					day.setContent(articleContentList);
				}

				article.setDay(articleDayList);
			}
			return articleList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	//	public boolean selectArticle(String articleId) {
	//		System.out.println("selectArticle:123");
	//		//1.找到所有dayId
	//		String sql = "select * from user_article where articleId=?";
	//		try {
	//			conn = super.getConnect();
	//			ps = conn.prepareStatement(sql);
	//			ps.setString(1, articleId);
	//			rs = ps.executeQuery();
	//			while (rs.next()) {
	//				System.out.println("查询成功！");
	//				return true;
	//			}
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//		return false;
	//	}

	/******/
	public boolean deleteArticle(String articleId) {
		System.out.println("deleteArticle:123");
		//		try {
		//			conn = super.getConnect();
		//			//2.用articleId,dayId在article_content和article_day中删除
		//			String sql="delete from article_content where articleId=? and dayId=?";
		//			ps = conn.prepareStatement(sql);
		//			ps.setString(1, articleId);
		//			ps.setInt(2, dayId);
		//			ps.executeUpdate();
		//			System.out.println("删除成功！");
		//
		//			sql="delete from article_day where articleId=? and dayId=?";
		//			ps = conn.prepareStatement(sql);
		//			ps.setString(1, articleId);
		//			ps.setInt(2, dayId);
		//			ps.executeUpdate();
		//			System.out.println("删除成功！");
		//			return true;
		//		} catch (SQLException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//		}
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

			//1.找到所有dayId
			String sql = "select * from user_article where articleId = ?";
			List<Object[]> dayIdList = runner.query(sql, new ArrayListHandler(), articleId);

			//防止空指针
			if(dayIdList!=null){
				//2.用articleId,dayId在article_content和article_day中删除
				sql="delete from article_content where articleId = ? and dayId = ?";
				String sqlDay="delete from article_day where articleId = ? and dayId = ?";
				for(Object[] obj:dayIdList){
					runner.update(sql, articleId,obj[0]);
					runner.update(sqlDay, articleId,obj[0]);
				}
			}

			//3.user_article中删掉article
			sql="delete from user_article where articleId = ?";
			runner.update(sql, articleId);

			//4.删除硬盘中相应的图片
			String delpath = UserFactory.getInstance().getUri("updateArticleUri")+ articleId;
			CommonUtils.deletefile(delpath);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}

		return false;

	}

	public List<Article> getArticleListGreen(int userId) {
		System.out.println("getArticleListGreen:123");
		try {
			QueryRunner runner = new QueryRunner();
			String sql = "select * from user_article where customerId=? and flag=1 order by writeTime desc";
			List<Article> articleList = runner.query(sql, new BeanListHandler<Article>(Article.class), userId);

			String sqlDay="select * from article_day where articleId=?";
			String sqlContent="select * from article_content where articleId=? and dayId=?";
			for(Article article:articleList){
				String articleId=article.getArticleId();
				List<ArticleDay> articleDayList = runner.query(sqlDay, new BeanListHandler<ArticleDay>(ArticleDay.class), articleId);

				for(ArticleDay day:articleDayList){
					int dayId=day.getDayId();
					List<ArticleContent> articleContentList = runner.query(sqlContent, new BeanListHandler<ArticleContent>(ArticleContent.class), articleId,dayId);
					day.setContent(articleContentList);
				}

				article.setDay(articleDayList);
			}
			return articleList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public boolean changeFlagStatus(String articleId, int i) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

			String sql="update user_article set flag=? where articleId=?";
			runner.update(sql, i,articleId);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;

	}

	//	public boolean getBigType(int bigId) {
	//		System.out.println("getBigType:123");
	//		String sql="select name from article_type where bigId = ?";
	//		try {
	//			conn = super.getConnect();
	//			ps = conn.prepareStatement(sql);
	//			ps.setInt(1, bigId);
	//			rs = ps.executeQuery();
	//
	//			while (rs.next()) { //这一步很重要
	//				System.out.println("查询成功！");
	//				return true;
	//			}
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//		return false;
	//
	//	}
	//
	//	public boolean getLittleType(int bigId, int littleId) {
	//		System.out.println("getLittleType:123");
	//		String sql="select name from article_type_type where bigId=? and littleId=?";
	//		try {
	//			conn = super.getConnect();
	//			ps = conn.prepareStatement(sql);
	//			ps.setInt(1, bigId);
	//			ps.setInt(2, littleId);
	//			rs = ps.executeQuery();
	//
	//			while (rs.next()) { //这一步很重要
	//				System.out.println("查询成功！");
	//				return true;
	//			}
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//		return false;
	//	}

	public String getBigType(int bigId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

			String sql="select name from article_type where bigId=?";
			Object[] query = runner.query(sql, new ArrayHandler(), bigId);
			return query[0].toString();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public String getLittleType(int bigId, int littleId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

			String sql="select name from article_type_type where bigId=? and littleId=?";
			Object[] query = runner.query(sql, new ArrayHandler(), bigId,littleId);
			return query[0].toString();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}


	public QueryResult getAllArticle(int startindex, int pagesize) {
		System.out.println("getAllArticle:123");
		try {
			QueryResult queryResult=new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select articleId from user_article order by writeTime desc limit ?,?";

			List<Article> articleList=new LinkedList<Article>();
			List<Object[]> articleId = runner.query(sql, new ArrayListHandler(), startindex,pagesize);

			for(Object[] obj:articleId ){
				Article a=findArticle(obj[0].toString());
				articleList.add(a);
			}
			//获取数据总条数
			sql="select count(articleId) from user_article ";
			int totalrecord=((Long)runner.query(sql,new ScalarHandler())).intValue();

			queryResult.setList(articleList);
			queryResult.setTotalrecord(totalrecord);

			return queryResult;


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public QueryResult queryArticle(int startindex, int pagesize, String where,Object[] whereParams) {
		try {
			QueryResult queryResult=new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select articleId from user_article "+where+" order by writeTime desc limit ?,?";
			//加上各种条件
			Object[] parmars=new Object[whereParams.length+2];
			parmars[parmars.length-2]=startindex;
			parmars[parmars.length-1]=pagesize;
			for(int i=0;i<whereParams.length;i++){
				parmars[i]=whereParams[i];
			}

			List<Object[]> articleId = runner.query(sql, parmars,new ArrayListHandler());

			List<Article> articleList=new LinkedList<Article>();

			for(Object[] obj:articleId ){
				Article a=findArticle(obj[0].toString());
				articleList.add(a);
			}


			//获取数据总条数
			sql="select count(articleId) from user_article "+where;
			int totalrecord=((Long)runner.query(sql, whereParams,new ScalarHandler())).intValue();

			queryResult.setList(articleList);
			queryResult.setTotalrecord(totalrecord);

			return queryResult;


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public QueryResult getGoodArticle(int startindex, int pagesize) {
		try {
			QueryResult queryResult=new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select articleId from user_article where good=1 order by writeTime desc limit ?,?";

			List<Article> articleList=new LinkedList<Article>();
			List<Object[]> articleId = runner.query(sql, new ArrayListHandler(), startindex,pagesize);

			for(Object[] obj:articleId ){
				Article a=findArticle(obj[0].toString());
				articleList.add(a);
			}
			//获取数据总条数
			sql="select count(articleId) from user_article where good=1";
			int totalrecord=((Long)runner.query(sql,new ScalarHandler())).intValue();

			queryResult.setList(articleList);
			queryResult.setTotalrecord(totalrecord);

			return queryResult;


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public boolean addGoodArticle(String articleId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="update user_article set good=1 where articleId=?";

			runner.update(sql, articleId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;

	}

	public boolean deleteGoodArticle(String articleId) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="update user_article set good=0 where articleId=?";

			runner.update(sql, articleId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return false;

	}

	/******/
	public boolean updateBgImage(String articleId, String imageName) {
		System.out.println("updateBgImage:123");
		String sql="update user_article set bgImageName=? where articleId=?";
		try {
			conn = super.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, imageName);
			ps.setString(2, articleId);
			int rs = ps.executeUpdate();
			System.out.println(rs);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}


	public List<Article> getGoodArticle(int i) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="select * from user_article where good=1 and flag=1 limit 0,?";

			return runner.query(sql, new BeanListHandler<Article>(Article.class),i);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public List<Article> getTypeArticle(int i, int j) {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="select * from user_article where flag=1 and bigId=? limit 0,?";

			return runner.query(sql, new BeanListHandler<Article>(Article.class),i,j);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}

	public List<Article> getAllArticle() {
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="select * from user_article where flag=1";

			return runner.query(sql, new BeanListHandler<Article>(Article.class));


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//			throw new RuntimeException(e);
		}
		return null;
	}
	
	public boolean deleteMessage(String id){
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			//1.删除travel_message_image中该id下的信息
			runner.update("delete from travel_message_image where activityId = ?",id);
			//2.删除硬盘下的图片
			String path = UserFactory.getInstance().getUri("updateMessageUri") + id;
			CommonUtils.deletefile(path);
			//3.删除travel_message_image中message信息
			String sql = "delete from travel_message where activityId = ?";
			runner.update(sql,id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public QueryResult queryMessage(int startindex,int pagesize,String where,Object[] whereParams){
		try {
			QueryResult qr = new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = null;
			List list = null;
			//数据总数
			int totalrecord = 0;
			if(where==null){
				//不带条件
				if(startindex<0){
					//不带分页
				} else{
					//带分页
					sql = "select * from travel_message order by writeTime desc limit ?,?";
					list = runner.query(sql, new BeanListHandler<PushMessage>(PushMessage.class),startindex, pagesize);
				}
				
				//获取数据总条数
				sql = "select count(activityId) from travel_message";
				totalrecord = ((Long)runner.query(sql, new ScalarHandler())).intValue();
			}else{
				//带条件
				if(startindex<0){
					//不带分页
					sql = "select * travel_message order by writeTime desc limit ?,?" + where;
					list = runner.query(sql, new BeanListHandler<User>(User.class),whereParams);
				}else{
					//带分页
					sql = "select * from travel_message " + where + " order by writeTime desc limit ?,?";
					Object[] paramrs = new Object[whereParams.length + 2];
					paramrs[paramrs.length-2]=startindex;
					paramrs[paramrs.length-1]=pagesize;
					for(int i=0;i<whereParams.length;i++){
						paramrs[i]=whereParams[i];
					}
					list = runner.query(sql, paramrs,new BeanListHandler<PushMessage>(PushMessage.class));
					
				}
				//获取数据总条数
				sql = "select count(activityId) from travel_message " + where;
				totalrecord = ((Long)runner.query(sql, whereParams,new ScalarHandler())).intValue();
			}
			
			qr.setList(list);
			qr.setTotalrecord(totalrecord);
			return qr;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public QueryResult queryMessage(PageInfo pf){
		try {
			QueryResult qr = new QueryResult();
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = null;
			List list = null;
			sql = "select * from travel_message order by writeTime desc limit ?,?";
			list = runner.query(sql, new BeanListHandler<PushMessage>(PushMessage.class));
			qr.setList(list);
			return qr;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
