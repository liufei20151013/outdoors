package com.wipe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.UserBiz;
import com.wipe.entity.User;

public class RegisterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		
		// 1.先判断有没有该用户
		UserBiz ub = new UserBiz();
		boolean a = ub.findUserByUsername(username);
		if(a){
			// 存在的话，返回用户已经存在
			response.sendRedirect("register.html");
			System.out.println("用户名已经存在！");
			
		}else{
			String password = request.getParameter("password");
			String nickName = request.getParameter("nickName");
			String gender = request.getParameter("gender");
			String phone = request.getParameter("phone");
			String qq = request.getParameter("qq");
			String email = request.getParameter("email");
			String headPortrait = "images/common/headportrait.jpg";
			System.out.println(headPortrait);
			int friendCount  = 0;
			int fansCount = 0;
			int articleCount = 0;
			int activityCount = 0;
						
			
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setNickName(nickName);
			user.setGender(gender);
			user.setPhone(phone);
			user.setQq(qq);
			user.setEmail(email);
			user.setHeadPortrait(headPortrait);
			user.setFriendCount(friendCount);
			user.setFansCount(fansCount);
			user.setArticleCount(articleCount);
			user.setActivityCount(activityCount);
			
			boolean c = ub.register(user);
			if(c){
				
				//把用户注册的信息存在session中
				user = ub.findUser(username, password);
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				//获得用户注册的ID
				int userId = user.getUserId();
				//根据ID查询用户信息
				User left = ub.findUserById(userId);
				session.setAttribute("left", left);
				response.sendRedirect("main.jsp");
				System.out.println("注册成功！");
			}
		}
		
		
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
