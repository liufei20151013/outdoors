package com.wipe.space.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.MessageBiz;
import com.wipe.biz.UserBiz;
import com.wipe.entity.User;

public class UpdatePasswordServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdatePasswordServlet() {
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

		System.out.println("修改用户密码:");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String password = request.getParameter("newPassword");//获得的初始值name要和jsp里面的一致
		System.out.println(password);
		if(password==null){
			response.sendRedirect("myspace/updatesecret.jsp");
        	System.out.println("密码修改成功！");
		}else{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			user.setPassword(password);
			
			int userId = user.getUserId();
			System.out.println(userId);
			MessageBiz mb = new MessageBiz();
			boolean a = mb.findUserById(userId);
			System.out.println(a+"11111111");
			boolean c = mb.updatePassword(userId,user);
			if(c){
				System.out.println("123");
	        	response.sendRedirect("myspace/updatesecret.jsp");
	        	System.out.println("密码修改成功！");
	        }else{
	        	System.out.println("亲，没有修改成功哦！");
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
