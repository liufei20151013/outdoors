package com.wipe.space.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.MessageBiz;
import com.wipe.biz.UserBiz;
import com.wipe.entity.User;

public class UpdateUserMessageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateUserMessageServlet() {
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
		System.out.println("修改用户信息:");
		response.setContentType("text/html");
//		PrintWriter writer = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String nickName = request.getParameter("nickName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String qq = request.getParameter("qq");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setUsername(username);
		user.setNickName(nickName);
		user.setGender(gender);
		user.setPhone(phone);
		user.setQq(qq);
		user.setEmail(email);
		
		int userId = user.getUserId();
		System.out.println(userId);
		MessageBiz mb = new MessageBiz();
		boolean a = mb.findUserById(userId);
		System.out.println(a+"11111111");
        boolean c = mb.updateUserMessage(userId,user);
        System.out.println(c);
        if(c){
        	response.sendRedirect("myspace.jsp");
            System.out.println("用户信息修改成功！");
        }else{
        	System.out.println("亲，没有修改成功哦！");
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
