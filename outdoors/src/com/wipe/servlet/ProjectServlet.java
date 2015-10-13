package com.wipe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipe.biz.ProjectBiz;
import com.wipe.entity.Project;
import com.wipe.entity.User;

public class ProjectServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProjectServlet() {
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
		if (method.equalsIgnoreCase("ApplyPoieer")) {
			ApplyPoieer(request, response);
		} else if (method.equalsIgnoreCase("DeletePoieer")) {
			DeletePoieer(request, response);
		} else if (method.equalsIgnoreCase("ApplyCamp")) {
			ApplyCamp(request, response);
		}else if (method.equalsIgnoreCase("DeleteCamp")) {
			DeleteCamp(request, response);
		} else if (method.equalsIgnoreCase("ApplyClimb")) {
			ApplyClimb(request, response);
		} else if (method.equalsIgnoreCase("DeleteClimb")) {
			DeleteClimb(request, response);
		} else if (method.equalsIgnoreCase("ApplyPersonCS")) {
			ApplyPersonCS(request, response);
		} else if (method.equalsIgnoreCase("DeletePersonCS")) {
			DeletePersonCS(request, response);
		} else if (method.equalsIgnoreCase("ApplyWalk")) {
			ApplyWalk(request, response);
		} else if (method.equalsIgnoreCase("DeleteWalk")) {
			DeleteWalk(request, response);
		} else if (method.equalsIgnoreCase("findProject")) {
			findProject(request, response);
		}
	}

	private void findProject(HttpServletRequest request,
			HttpServletResponse response) {
		
	}

	private void DeleteWalk(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("DeleteWalkServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				boolean b = pb.delete(PjId, userId);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("walklist.jsp");
					System.out.println("取消报名成功！");
				}
			}else{
				response.sendRedirect("walklist.jsp");
				System.out.println("您还没有报名！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void ApplyWalk(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("ApplyWalkServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				response.sendRedirect("walklist.jsp");
				System.out.println("您已经成功报名过此活动！");
			}else{
				System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId);
				String PjName = new String(request.getParameter("PjName").getBytes("ISO-8859-1"), "UTF-8");
				System.out.println("a="+PjId+"~"+PjName);

				Project pj = new Project();
				pj.setUserId(userId);
				pj.setPjId(PjId);
				pj.setPjName(PjName);
				boolean b = pb.apply(pj);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("walklist.jsp");
					System.out.println("报名成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void DeletePersonCS(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("DeletePersonCSServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				boolean b = pb.delete(PjId, userId);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("personcslist.jsp");
					System.out.println("取消报名成功！");
				}
			}else{
				response.sendRedirect("personcslist.jsp");
				System.out.println("您还没有报名！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void ApplyPersonCS(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("ApplyPersonCSServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				response.sendRedirect("personcslist.jsp");
				System.out.println("您已经成功报名过此活动！");
			}else{
				System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId);
				String PjName = new String(request.getParameter("PjName").getBytes("ISO-8859-1"), "UTF-8");
				System.out.println("a="+PjId+"~"+PjName);

				Project pj = new Project();
				pj.setUserId(userId);
				pj.setPjId(PjId);
				pj.setPjName(PjName);
				boolean b = pb.apply(pj);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("personcslist.jsp");
					System.out.println("报名成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void DeleteClimb(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("DeleteClimbServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				boolean b = pb.delete(PjId, userId);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("climblist.jsp");
					System.out.println("取消报名成功！");
				}
			}else{
				response.sendRedirect("climblist.jsp");
				System.out.println("您还没有报名！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void ApplyClimb(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("ApplyClimbServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				response.sendRedirect("climblist.jsp");
				System.out.println("您已经成功报名过此活动！");
			}else{
				System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId);
				String PjName = new String(request.getParameter("PjName").getBytes("ISO-8859-1"), "UTF-8");
				System.out.println("a="+PjId+"~"+PjName);

				Project pj = new Project();
				pj.setUserId(userId);
				pj.setPjId(PjId);
				pj.setPjName(PjName);
				boolean b = pb.apply(pj);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("climblist.jsp");
					System.out.println("报名成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void DeleteCamp(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("DeleteCampServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				boolean b = pb.delete(PjId, userId);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("camplist.jsp");
					System.out.println("取消报名成功！");
				}
			}else{
				response.sendRedirect("camplist.jsp");
				System.out.println("您还没有报名！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void ApplyCamp(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("ApplySCampervlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				response.sendRedirect("camplist.jsp");
				System.out.println("您已经成功报名过此活动！");
			}else{
				System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId);
				String PjName = new String(request.getParameter("PjName").getBytes("ISO-8859-1"), "UTF-8");
				System.out.println("a="+PjId+"~"+PjName);

				Project pj = new Project();
				pj.setUserId(userId);
				pj.setPjId(PjId);
				pj.setPjName(PjName);
				boolean b = pb.apply(pj);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("camplist.jsp");
					System.out.println("报名成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void DeletePoieer(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("DeletePoieerServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				boolean b = pb.delete(PjId, userId);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("poieerlist.jsp");
					System.out.println("取消报名成功！");
				}
			}else{
				response.sendRedirect("poieerlist.jsp");
				System.out.println("您还没有报名！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void ApplyPoieer(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("ApplyPoieerServlet");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			int PjId = Integer.parseInt(request.getParameter("PjId"));
			System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId );
			ProjectBiz pb = new ProjectBiz();
			boolean a = pb.findProjectById(PjId, userId);
			System.out.println("a=" + a);
			if(a){
				response.sendRedirect("poieerlist.jsp");
				System.out.println("您已经成功报名过此活动！");
			}else{
				System.out.println("poieer:"+"userId="+userId+"  "+"PjId=" + PjId);
				String PjName = new String(request.getParameter("PjName").getBytes("ISO-8859-1"), "UTF-8");
				System.out.println("a="+PjId+"~"+PjName);

				Project pj = new Project();
				pj.setUserId(userId);
				pj.setPjId(PjId);
				pj.setPjName(PjName);
				boolean b = pb.apply(pj);
				System.out.println("b="+b);
				if(b){
					response.sendRedirect("poieerlist.jsp");
					System.out.println("报名成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
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
