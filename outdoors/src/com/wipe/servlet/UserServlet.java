package com.wipe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.UserBiz;
import com.wipe.entity.User;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
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

		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+password);
		UserBiz ub = new UserBiz();	
		boolean b = ub.login(username, password);
		System.out.println(b);
		User user = ub.findUser(username, password);
		if(user==null){
			System.out.println("该用户不存在！");
			response.sendRedirect("login.html");
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			int userId = user.getUserId();
			System.out.println(userId);
			User left = ub.findUserById(userId);
			session.setAttribute("left", left);

			if(b){
				System.out.println("123");
				System.out.println(user.getUsername() + user.getPassword()); //输出用户名
				response.sendRedirect("main.jsp");
			}else{
				response.sendRedirect("login.html");
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
