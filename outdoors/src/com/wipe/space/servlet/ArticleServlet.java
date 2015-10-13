package com.wipe.space.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.wipe.biz.ArticleBiz;
import com.wipe.biz.MessageBiz;
import com.wipe.biz.UserBiz;
import com.wipe.entity.PageBean;
import com.wipe.entity.PageInfo;
import com.wipe.entity.QueryResult;
import com.wipe.entity.User;
import com.wipe.entity.UserCenterLeft;
import com.wipe.entity.article.Article;
import com.wipe.entity.article.ArticleDay;
import com.wipe.entity.article.ArticleType;
import com.wipe.entity.article.ArticleTypeType;
import com.wipe.tool.JSONUtil;
import com.wipe.tool.UserFactory;



public class ArticleServlet extends HttpServlet {

	//	//临时文件存储的位置
	//	private String tempPath;
	//	//真实文件存储的位置
	//	private String uploadPath;
	/**
	 * Constructor of the object.
	 */
	public ArticleServlet() {
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
		if (method.equalsIgnoreCase("inArticle")) {
			inArticle(request, response);
		} else if (method.equalsIgnoreCase("showType")) {
			showType(request, response);
		} else if (method.equalsIgnoreCase("showLittleType")) {
			showLittleType(request, response);
		} else if (method.equalsIgnoreCase("addPreface")) {
			addPreface(request, response);
		} else if (method.equalsIgnoreCase("addContent")) {
			addContent(request, response);
		} else if (method.equalsIgnoreCase("delContent")) {
			delContent(request, response);
		} else if (method.equalsIgnoreCase("delDay")) {
			delDay(request, response);
		} else if (method.equalsIgnoreCase("addMessage")) {
			addMessage(request, response);
		} else if (method.equalsIgnoreCase("addImage")) {
			addImage(request, response);
		} else if (method.equalsIgnoreCase("showArticle")) {
			showArticle(request, response);
		} else if (method.equalsIgnoreCase("submit")) {
			submit(request, response);
		} else if (method.equalsIgnoreCase("articleList")) {
			articleList(request, response);
		} else if (method.equalsIgnoreCase("deleteArticle")) {
			deleteArticle(request, response);
		} else if (method.equalsIgnoreCase("changeArticle")) {
			changeArticle(request, response);
		} else if (method.equalsIgnoreCase("updateBgImage")) {
			updateBgImage(request, response);
		} else if (method.equalsIgnoreCase("articleListGreen")) {
			articleListGreen(request, response);
		} else if (method.equalsIgnoreCase("toArticle")) {
			toArticle(request, response);
		} else if (method.equalsIgnoreCase("deleteMessage")){
			deleteMessage(request,response);
		}
	}



	private void deleteMessage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String[] ids = request.getParameterValues("id");
		//		if(ids==null){
		//			//用来防止删除报空指针异常
		//			request.getRequestDispatcher("PersonalCenterServlet?method=messageList").forward(request, response);
		//			return;
		//		}
		for(String id:ids){
			ArticleBiz ab = new ArticleBiz();
			ab.deleteMessage(id);
		}
		//String flag = (String)request.getSession().getAttribute("flag");

		PageInfo pf = new PageInfo();
		QueryResult pb = null;
		//		if(!flag.equals("3")){
		//			ArticleBiz ab = new ArticleBiz();
		//			pb = ab.queryMessage(pf);
		//		}
		ArticleBiz ab = new ArticleBiz();
		pb = ab.queryMessage(pf);
		request.setAttribute("pageBean", pb);
		request.getRequestDispatcher("myspace/myfootprint.jsp").forward(request, response);
	}

	private void toArticle(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("toArticle:");
		User u = (User) request.getSession(false).getAttribute("user");
		if(u==null){
			response.sendRedirect("login.html");
			return;
		}

		String articleId = request.getParameter("articleId");
		if(articleId==null){
			articleId = (String) request.getAttribute("articleId");
		}

		ArticleBiz ab = new ArticleBiz();
		Article article = ab.findArticle(articleId);

		UserBiz ub = new UserBiz();
		User user = ub.findUserById(article.getUserId());
		//取走大小类型
		if(article.getBigId()!=0&&article.getLittleId()!=0){
			String bigType = ab.getBigType(article.getBigId());
			String littleType = ab.getLittleType(article.getBigId(), article.getLittleId());
			request.setAttribute("bigType", bigType);
			request.setAttribute("littleType", littleType);

		}
		//取走出发时间
		Date date = article.getGoTime();
		Calendar c = new GregorianCalendar();
		if(date!=null){
			c.setTime(date);
			c.add(c.DATE, -1);//把日期往后增加一天，整数往后推，负数往前移动
			date = c.getTime();//这个时间就是日期往后推一天的结果

			for(ArticleDay day:article.getDay()){
				Calendar c1 = new GregorianCalendar();
				c1.setTime(date);
				c1.add(c1.DATE, -1);//把日期往后增加一天，整数往后推，负数往前移动
				date = c1.getTime();
				day.setThisTime(date);
			}

		}

		UserCenterLeft head = new UserCenterLeft();
		head.setUser(user);
		MessageBiz mb = new MessageBiz();
		int userId = user.getUserId();
		//获得好友数量
		int friendCount = mb.getFriendCount(userId);
		head.setFriendCount(friendCount);
		//获得粉丝数量
		int fansCount = mb.getFansCount(userId);
		head.setFansCount(fansCount);
		//获得通过审核游记数量

		String isFriend="";
		if(c!=null||!u.getUserId().equals(user.getUserId())){
			//只有登录后，或者两人不是同一人时，才有资格判断是否已经是好友
			boolean flag = mb.chargeFans(u.getUserId(),user.getUserId());
			if(flag)
				isFriend = "已关注";
			else if(!u.getUserId().equals(user.getUserId()))
				isFriend="+关注";

		}
		request.setAttribute("isFriend", isFriend);
		request.setAttribute("bgImageUri", UserFactory.getInstance().getUri("articleUri"));
		request.setAttribute("headImageUri", UserFactory.getInstance().getUri("headPortrait"));
		request.setAttribute("articleImageUri", UserFactory.getInstance().getUri("articleUri"));
		request.setAttribute("article", article);
		request.setAttribute("head", head);
		request.setAttribute("user", user);

		request.getRequestDispatcher("myspace/publishfootprint.jsp").forward(request, response);

	}

	private void updateBgImage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("updateBgImage:");
		// 创建工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 利用工厂创建上传工具类
		ServletFileUpload upload = new ServletFileUpload(factory);

		/**
		 * 用来设置上传图片大小限制之后取消掉 upload.setFileSizeMax(1024 * 200);
		 */
		// 10兆缓冲
		upload.setFileSizeMax(1024 * 1024 * 10);
		try {

			// 利用核心类解析request
			List<FileItem> list = upload.parseRequest(request);
			String articleId=null;
			// 遍历集合，获取所有FileItem
			for (FileItem item : list) {
				// 找到上传的文件信息
				if (!item.isFormField()) {
					// String fileName = item.getName();// 获取上传文件名称
					String mimeType = item.getContentType();
					// 判断上传的文件类型，只允许上传图片
					if (mimeType.startsWith("image")) {
						// 获得图片名
						String imageName = articleId + ".jpg";

						InputStream in = item.getInputStream();// 获取上传文件内容流

						// 一级文件夹e\:/travel/articleImage/
						//						String path = ("http://localhost:9000/outdoors/Upload/" + articleId); ///
						String path = UserFactory.getInstance().getUri("updateArticleUri");
						File dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}

						// 二级文件夹e\:/travel/articleImage/articleId/
						path = path + articleId + "//";
						dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}



						FileOutputStream out = new FileOutputStream(path + imageName);

						int i = 0;
						while ((i = in.read()) != -1) {
							out.write(i);
						}

						in.close();
						out.close();

						item.delete();

						ArticleBiz ab = new ArticleBiz();
						ab.updateBgImage(articleId, imageName);
					}
				} else {
					// 获得普通表单数据
					String name = item.getFieldName();
					if ("articleId".equals(name)) {

						articleId = item.getString();
						request.setAttribute("articleId", articleId);
					}
				}

			}
		} catch (FileSizeLimitExceededException e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("message", "文件过大");//
			request.getRequestDispatcher("myspace/updateheadportrait.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		toArticle(request,response);

	}	


	/**
	 *  显示space页面游记
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void articleListGreen(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("articleListGreen:");
		User user = (User) request.getSession(false).getAttribute("user");
		int userId = user.getUserId();
		ArticleBiz ab = new ArticleBiz();

		List<Article> articleList = ab.getArticleListGreen(userId);
		request.setAttribute("articleList", articleList);

		String imageUri = UserFactory.getInstance().getUri("articleUri");//+"/headportrait.jpg"
		request.setAttribute("imageUri", imageUri);

		//		user = (User) request.getSession(false).getAttribute("user");
		request.getRequestDispatcher("myspace/myfootprint.jsp").forward(request, response);
	}

	/**
	 * 进入前台修改游记页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changeArticle(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("changeArticle:");
		response.setContentType("text/html;charset=utf-8");
		String articleId=request.getParameter("articleId");
		request.getSession(false).setAttribute("articleId", articleId);
		ArticleBiz ab = new ArticleBiz();

		//将update给request,用来标记是从编辑接口进入游记页面
		request.setAttribute("update", "update");

		//只要一点编辑按钮，就将游记状态变为未提交
		ab.changeFlagStatus(articleId,3);

		//显示游记信息

		//获得article
		Article article = ab.findArticle(articleId);

		// 获得大类型
		List<ArticleType> bigType = ab.showBigType();

		// 获得小类型
		List<ArticleTypeType> littleType = ab.showLittleType(article.getBigId() + "");

		request.setAttribute("article", article);
		request.setAttribute("bigType", bigType);
		request.setAttribute("littleType", littleType);

		String articleImageUri  = (String) request.getSession().getAttribute("articleUri");
		request.setAttribute("articleImageUri", articleImageUri);
		String headImageUri =UserFactory.getInstance().getUri("headPortrait");
		request.setAttribute("headImageUri", headImageUri);
		request.getRequestDispatcher("myspace/publishfootprint.jsp").forward(request, response);
		//		response.sendRedirect("myspace/publishfootprint.jsp");
	}

	/**
	 * 前台删除游记
	 * @param request
	 * @param response
	 */
	private void deleteArticle(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("deleteArticle:");
		String articleId = request.getParameter("value");
		ArticleBiz ab = new ArticleBiz();
		ab.deleteArticle(articleId);
	}

	/**
	 * 显示游记
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void articleList(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("articleList:");
		response.setContentType("text/html;charset=utf-8");
		User user = (User) request.getSession(false).getAttribute("user");
		int userId = user.getUserId();
		System.out.println("user="+user+"    "+"userId="+userId);
		ArticleBiz ab = new ArticleBiz();
		List<Article> articleList = ab.getAllArticle(userId);
		System.out.println("articleList="+articleList);

		request.setAttribute("articleList", articleList);
		request.setAttribute("articleCount", articleList.size());
		String imageUri = (String) request.getSession().getAttribute("articleUri");
		System.out.println("imageUri="+imageUri);

		request.setAttribute("articleUri", imageUri);
		request.setAttribute("defaultImage", imageUri+"/headportrait.jpg");

		imageUri = (String) request.getSession().getAttribute("imageUri");
		request.getRequestDispatcher("myspace/myfootprint.jsp").forward(request, response);
		System.out.println("添加成功！");
	}

	/**
	 * 提交游记（就是更新了一下writeTime）
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void submit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("submit:");
		response.setContentType("text/html;charset=utf-8");
		//用来标志是否是从编辑接口进入的游记界面 
		String update = (String) request.getParameter("update");
		String articleId = (String) request.getSession(false).getAttribute("articleId");
		System.out.println("update="+update+"       "+"articleId="+articleId);
		ArticleBiz ab = new ArticleBiz();
		if(!update.equals("update"))
			ab.updateWriteTime(articleId);
		//提交游记后，就将游记状态变为未审核
		ab.changeFlagStatus(articleId, 0);

		request.getSession(false).removeAttribute("articleId");

		articleList(request,response);
	}

	/**
	 * 显示游记
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void showArticle(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("showArticle:");
		response.setContentType("text/html;charset=utf-8");
		String articleId=(String) request.getSession(false).getAttribute("articleId");
		System.out.println("articleId="+articleId);
		if(articleId==null){
			articleId=(String) request.getAttribute("articleId");
		}
		System.out.println("11111111111");
		//获得article
		ArticleBiz ab = new ArticleBiz();
		Article article = ab.findArticle(articleId);
		System.out.println("123article="+article);
		//获得大类型
		List<ArticleType> bigType = ab.showBigType();

		System.out.println("bigType="+bigType);
		//获得小类型
		List<ArticleTypeType> littleType = ab.showLittleType(article.getBigId() +"");
		System.out.println("littleType="+littleType);

		HttpSession session=request.getSession();
		session.setAttribute("article", article);
		//		request.setAttribute("article", article);
		request.setAttribute("bigType", bigType);
		request.setAttribute("littleType", littleType);

		String articleImageUri = UserFactory.getInstance().getUri("articleUri");
		request.setAttribute("articleImageUri", articleImageUri);
		request.setAttribute("headImageUri", UserFactory.getInstance().getUri("headPortrait"));

		//		session.setAttribute("article", article);//
		request.getRequestDispatcher("myspace/publishfootprint.jsp").forward(request, response);
		//		response.sendRedirect("myspace/publishfootprint.jsp");
		System.out.println("77777777");

	}

	/**
	 * 添加图片
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void addImage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("addImage:");
		// 创建工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		System.out.println("1111111111");
		// 利用工厂创建上传工具类
		ServletFileUpload upload = new ServletFileUpload(factory);

		System.out.println("22222222222");
		/**
		 * 用来设置上传图片大小限制之后取消掉   upload.setFileSizeMax(1024 * 200);
		 */
		// 10兆缓冲
		upload.setFileSizeMax(1024 * 1024 * 10);
		try {
			System.out.println("3333333333333");
			// 利用核心类解析request
			List<FileItem> list = upload.parseRequest(request);
			int dayId = Integer.parseInt(request.getParameter("dayId"));
			String articleId=(String) request.getSession(false).getAttribute("articleId");
			System.out.println("dayId="+dayId+"    "+"articleId="+articleId);
			// 遍历集合，获取所有FileItem
			for (FileItem item : list) {
				// 找到上传的文件信息
				if (!item.isFormField()) {
					// String fileName = item.getName();// 获取上传文件名称
					String mimeType = item.getContentType();
					System.out.println("mime="+mimeType);
					// 判断上传的文件类型，只允许上传图片
					if (mimeType.startsWith("image")) {
						// 获得图片名
						String imageName = UUID.randomUUID().toString() + ".jpg";

						InputStream in = item.getInputStream();// 获取上传文件内容流

						// 一级文件夹http://localhost/outdoors
						String path = UserFactory.getInstance().getUri("updateArticleUri");
						//						//找到web.xml里面两个文件名称
						//						String dir = this.getServletConfig().getInitParameter("dir");
						//						String tmp = this.getServletConfig().getInitParameter("tmp");
						//						System.out.println("真实文件夹名称：" + dir);
						//						System.out.println("临时文件夹名称：" + tmp);

						//						//拼接路径
						//						//真实路径
						//						uploadPath = realPath + dir;
						//http://localhost:9000/outdoors/Upload
						System.out.println("uploadPath:"+path);
						File dir= new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}

						// 二级文件夹e\:/travel/articleImage/articleId/
						path = path + "/" + articleId + "//";
						System.out.println("uploadPath:"+path);
						dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}

						// 三级文件夹e\:/travel/articleImage/articleId/dayId
						path = path + dayId+"//";
						dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}

						System.out.println("uploadPath:"+path);
						FileOutputStream out = new FileOutputStream(path + imageName);

						int i = 0;
						while ((i = in.read()) != -1) {
							out.write(i);
						}

						in.close();
						out.close();

						item.delete();

						System.out.println("111111111111");
						ArticleBiz ab = new ArticleBiz();
						ab.addArticleImage(articleId, dayId, imageName);
					}
				} else {
					// 获得普通表单数据
					String name = item.getFieldName();
					System.out.println("name="+name);
					if ("dayId".equals(name)) {

						dayId = item.hashCode();
					}
				}

			}
		} catch (FileSizeLimitExceededException e) {
			// TODO: handle exception
			e.printStackTrace();
			//			request.setAttribute("message", "文件过大");
			request.getRequestDispatcher("myspace/updateheadportrait.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("4444444444444444");
		showArticle(request,response);

	}



	//删除天
	private void delDay(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("delDay:");
		response.setContentType("text/html;charset=utf-8");
		int dayId = Integer.parseInt(request.getParameter("dayId"));
		System.out.println("dayId="+dayId);
		String articleId=(String) request.getSession(false).getAttribute("articleId");
		System.out.println("articleId="+articleId);
		ArticleBiz ab = new ArticleBiz();
		ab.delDay(articleId, dayId);
	}

	/**
	 * 删除每个图片下的content
	 * @param request
	 * @param response
	 */
	private void delContent(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("delContent");
		response.setContentType("text/html;charset=utf-8");
		String articleId=(String) request.getSession(false).getAttribute("articleId");
		int dayId = Integer.parseInt(request.getParameter("dayId"));
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		ArticleBiz ab = new ArticleBiz();
		ab.delContent(articleId, dayId, contentId);

	}

	/**
	 * 上传每个图片下的content
	 * @param request
	 * @param response
	 */
	private void addContent(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("addContent:");
		response.setContentType("text/html;charset=utf-8");
		String imageName = request.getParameter("imageName");
		String content=request.getParameter("content");
		ArticleBiz ab = new ArticleBiz();
		ab.addContent(imageName, content);
	}

	/**
	 * 上传每一天的前言
	 * @param request
	 * @param response
	 */
	private void addPreface(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("addPreface");
		response.setContentType("text/html;charset=utf-8");
		String articleId=(String) request.getSession(false).getAttribute("articleId");
		int dayId = Integer.parseInt(request.getParameter("dayId"));
		String preface = request.getParameter("preface");
		System.out.println("addPreface:123"+articleId+"   "+dayId+"   "+preface);
		ArticleBiz ab = new ArticleBiz();
		ab.addPreface(articleId, dayId, preface);
		//		articleId=(String) request.getSession(false).getAttribute("articleId");//

	}

	/**
	 * 拿到大类型数据项对应的小类型数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void showLittleType(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("showLittleType:");
		response.setContentType("text/html;charset=utf-8");
		String value = request.getParameter("value");
		System.out.println("value="+value);
		ArticleBiz ab = new ArticleBiz();
		List<ArticleTypeType> list = ab.showLittleType(value);
		System.out.println("list="+list);
		String list2json = JSONUtil.list2json(list);

		System.out.println("list2json="+list2json);
		PrintWriter out = response.getWriter();
		out.println(list2json);
	}

	/**
	 * 进入页面时，显示大的游记类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void showType(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("showType:");
		response.setContentType("text/html;charset=utf-8");
		String bigType = (String)request.getAttribute("bigType");
		ArticleBiz ab = new ArticleBiz();
		List<ArticleType> list = ab.showBigType();
		System.out.println(list);
		String list2json = JSONUtil.list2json(list);

		System.out.println("list2json="+list2json);
		PrintWriter out = response.getWriter();
		out.println(list2json);
		bigType = (String)request.getAttribute("bigType");
	}

	/**
	 * 接受异步上传的信息
	 * @param request
	 * @param response
	 */
	private void addMessage(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("addMessage:");
		response.setContentType("text/html;charset=utf-8");
		String articleId=(String) request.getSession(false).getAttribute("articleId");
		//			String article=(String) request.getSession(false).getAttribute("article");//
		System.out.println("articleId="+articleId);

		String name = request.getParameter("name");
		String value = request.getParameter("value");
		System.out.println("name="+name+"  "+"value="+value);
		ArticleBiz ab = new ArticleBiz();
		ab.addMessage(articleId, name,value);
	}

	/**
	 * 进入游记编写页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void inArticle(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.println("inArticle:");
		response.setContentType("text/html;charset=utf-8");
		String articleId=(String) request.getSession().getAttribute("articleId");
		System.out.println("articleId="+articleId);
		User user = (User) request.getSession().getAttribute("user");
		System.out.println("user="+user);
		int userId = user.getUserId();
		System.out.println("userId="+userId);
		//判断如果是第一次进的话，创建游记
		if(articleId==null){
			articleId=UUID.randomUUID().toString();
			System.out.println("articleId="+articleId);
			ArticleBiz ab = new ArticleBiz();
			ab.createArticle(articleId, userId);
			request.getSession(false).setAttribute("articleId", articleId);
			//				request.getSession(false).getAttribute("article");//
			System.out.println("articleId="+articleId+" "+"userId="+userId);
		}
		request.setAttribute("headImageUri", UserFactory.getInstance().getUri("headPortrait"));
		request.getRequestDispatcher("myspace/publishfootprint.jsp").forward(request, response);
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
