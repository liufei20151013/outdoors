package com.wipe.space.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExitServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ExitServlet() {
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

		System.out.println("退出:");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setHeader("cache-control","no-cache"); //forces caches to obtain a new copy of the page from the origin server
		response.setHeader("cache-control","no-store"); //directs caches not to store the page under any circumstance
		response.addDateHeader("expires", 0); //causes the proxy cache to see the page as "stale"
		response.setHeader("pragma","no-cache"); //http 1.0 backward compatibility
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		if (username == null) {
			System.out.println(username);
			request.setAttribute("error", "session has ended. please login.");
			request.getRequestDispatcher("login.html").forward(request, response);
		}
		//		HttpSession session = request.getSession();
		//		session.removeAttribute("user");
		//		request.getSession(false).removeAttribute("user");
		//
		//		String username = (String) session.getAttribute("user");
		//		System.out.println(username);
		//		if (null == username) {
		//			request.setAttribute("error", "session has ended, please login!");
		//			request.getRequestDispatcher("login.html").forward(request, response);
		//			session.invalidate();
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
