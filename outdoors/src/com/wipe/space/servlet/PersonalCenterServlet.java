package com.wipe.space.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.ActivityBiz;
import com.wipe.biz.ArticleBiz;
import com.wipe.biz.MessageBiz;
import com.wipe.biz.UserBiz;
import com.wipe.entity.PageBean;
import com.wipe.entity.PageInfo;
import com.wipe.entity.QueryResult;
import com.wipe.entity.User;
import com.wipe.entity.UserCenterLeft;
import com.wipe.entity.article.Article;
import com.wipe.tool.WebUtils;

public class PersonalCenterServlet extends HttpServlet {
//	int Pagesize = 10; // 每页显示行数
//	int totalNum; // 总行数,从biz再到dao层获取
//	int currentPage=1; // 当前页 从request获取
//	int totalPage;// 总有页数 totalNum/Pagesize+1
//	int startNum;// 开始数量 （currentPage-1）* Pagesize +1
//	int finishNum;// 届数数量 currentPage* Pagesize
//    UserBiz ub = new UserBiz();

	/**
	 * Constructor of the object.
	 */
	public PersonalCenterServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		// Servlet中用session
		HttpSession session = request.getSession();
		// ServletContext application=this.getServletContext();


		String method = request.getParameter("method");
		if (method.equalsIgnoreCase("friendlist")) {
			friendlist(request, response);
		} else if (method.equalsIgnoreCase("fanslist")) {
			fanslist(request, response);
		} else if (method.equalsIgnoreCase("articlelist")) {
			articlelist(request, response);
		} else if (method.equalsIgnoreCase("activitylist")) {
			activitylist(request, response);
		} else if (method.equalsIgnoreCase("messageList")) {
			messageList(request,response);
		}
	}

	private void messageList(HttpServletRequest request,HttpServletResponse response) {
//		PageInfo pf = WebUtils.register2Bean(request, PageInfo.class);
//		String flag = request.getParameter("flag");
//		if(flag==null){
//			//如果flag是null,说明是刚开始进入,那么给flag值3
//			flag="3";
//			
//		}
//		PageBean pb = null;
//		if(!flag.equals("3")){
//			//如果flag不为3,那就按照flag的值0、1、2进行查找
//			ArticleBiz ab = new ArticleBiz();
//			pb = ab.queryMessage(pf,"where flag=?", new Object[]{flag});
//		}else{
//			pb = ab
//		}
		
	}

	private void activitylist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = (User) request.getSession(false).getAttribute("user");
		int userId = user.getUserId();
		PageInfo pf = WebUtils.register2Bean(request, PageInfo.class);
		pf.setPagesize(5);
		ActivityBiz ab = new ActivityBiz();
		QueryResult pb = ab.myMessageList(pf, userId);
		request.setAttribute("pageBean", pb);
		request.setAttribute("messageCount",pb.getList().size());
		response.sendRedirect("myspace/myfootprint.jsp");
	}

	private void articlelist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = (User) request.getSession(false).getAttribute("user");
		int userId = user.getUserId();
		ArticleBiz ab = new ArticleBiz();

		List<Article> articleList = ab.getArticleListGreen(userId);
		request.setAttribute("articleList", articleList);

		String imageUri = (String) request.getSession().getAttribute("articleUri")+"/file/headportrait.jpg";
		request.setAttribute("imageUri", imageUri);

		user = (User) request.getSession(false).getAttribute("user");
		response.sendRedirect("ArticleServlet?method=articleList");
		
	}

	private void fanslist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
//		try {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//			if(currentPage==0){
//				currentPage=1;
//			}
//			totalNum = ub.getFriendList().size();
//			totalPage = totalNum / Pagesize + 1;
//			startNum = (currentPage - 1) * Pagesize + 1;
//			finishNum = currentPage* Pagesize;
//			List<User> fansList = new ArrayList<User>();
//			fansList = ub.getFriendList(currentPage, Pagesize);
//			request.setAttribute("fansList", fansList);
//			System.out.println(currentPage);
//			request.setAttribute("currentPage", currentPage);
//			request.getRequestDispatcher("friendList.jsp").forward(request, response);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		int userId = Integer.parseInt(request.getParameter("userId"));
		UserBiz ub = new UserBiz();
		User user = ub.findUserById(userId);
		
		//获得当前登录的人
		User username = (User) request.getSession(false).getAttribute("user");
				
		//用来之后页面上下一页的时候有ID
		request.setAttribute("userId", userId);
		PageInfo pf = WebUtils.register2Bean(request, PageInfo.class);
		MessageBiz mb = new MessageBiz();
		QueryResult pb = mb.queryFans(userId);
		List<User> list = pb.getList();
		LinkedHashMap<UserCenterLeft,Boolean> map = new LinkedHashMap<UserCenterLeft,Boolean>();
		
		
		for(User friend:list){
			UserCenterLeft message = new UserCenterLeft();
			message.setUser(friend);
			//获得好友数量
			int friendCount = mb.getFriendCount(friend.getUserId());
			message.setFriendCount(friendCount);
			//获得粉丝数量
			int fansCount = mb.getFansCount(user.getUserId());
			message.setFansCount(fansCount);
			//获得通过审核游记数量
			int articleCount = mb.getArticleCount(user.getUserId());
			message.setArticleCount(articleCount);
			//获得通过审核活动数量
			int activityCount = mb.getActivityCount(user.getUserId());
			message.setActivityCount(activityCount);
			
			//用来判断是否已经关注
			boolean flag = mb.chargeFans(userId, user.getFriendId());
			
			if(flag)
				//已经关注
				map.put(message, true);
			else
				//还没关注
				map.put(message, false);
			//如果这两个人是一个UserId,就显示已关注
			if(username.getUserId().equals(friend.getUserId())){
				map.put(message, true);
			}
			
			request.setAttribute("fansCount", pb.getList().size());
			request.setAttribute("pageBean", pb);
			request.setAttribute("map", map);
			
			response.sendRedirect("myspace/center/fansList.jsp");
		}
	}

	private void friendlist(HttpServletRequest request,
			HttpServletResponse response) {
//		try {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//			if(currentPage==0){
//				currentPage=1;
//			}
//			totalNum = ub.getFriendList().size();
//			totalPage = totalNum / Pagesize + 1;
//			startNum = (currentPage - 1) * Pagesize + 1;
//			finishNum = currentPage* Pagesize;
//			List<User> friendList = new ArrayList<User>();
//			friendList = ub.getFriendList(currentPage, Pagesize);
//			request.setAttribute("friendList", friendList);
//			System.out.println(currentPage);
//			request.setAttribute("currentPage", currentPage);
//			request.getRequestDispatcher("friendList.jsp").forward(request, response);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
