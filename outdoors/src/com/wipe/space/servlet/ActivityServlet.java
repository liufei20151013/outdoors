package com.wipe.space.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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

import com.wipe.biz.ActivityBiz;
import com.wipe.entity.Activity;
import com.wipe.entity.User;

public class ActivityServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ActivityServlet() {
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
		if (method.equalsIgnoreCase("messageList")) {
			messageList(request, response);
		} else if (method.equalsIgnoreCase("doAddMessage")) {
			doAddMessage(request, response);
		} else if (method.equalsIgnoreCase("deleteMessage")){
			deleteMessage(request,response);
		}
	}


	private void deleteMessage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 前台添加活动	
	 * @throws ServletException 
	 */
	private void doAddMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		System.out.println("doAddMessage:");
			try {
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

					Activity a = new Activity();
					String activityId = UUID.randomUUID().toString();
					a.setActivityId(activityId);
					List messageImage=new ArrayList();


					// 利用核心类解析request
					List<FileItem> list = upload.parseRequest(request);
					// 遍历集合，获取所有FileItem,获得各种数据
					for (FileItem item : list) {
						// 找到上传的文件信息
						if (!item.isFormField()) {
							// String fileName = item.getName();// 获取上传文件名称
							String mimeType = item.getContentType();
							// 判断上传的文件类型，只允许上传图片
							if (mimeType.startsWith("image")) {
								// 获得图片名
								String imageName = UUID.randomUUID().toString() + ".jpg";

								InputStream in = item.getInputStream();// 获取上传文件内容流

								// 一级文件夹e\:/travel/messageImage/
								String path = this.getServletConfig().getServletContext().getRealPath("/");
								File dir = new File(path);
								if (!dir.exists()) {
									dir.mkdirs();
								}
								// 二级文件夹e\:/travel/messageImage/messageId/
								path = path + activityId + "//";
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
								//将图片放到bean中
								messageImage.add(imageName);

							}
						} else {
							// 获得普通表单数据
							String name = item.getFieldName();
							//放名字
							if ("name".equals(name)) {
								String messageName = new String(item.getString().getBytes("iso8859-1"), "utf-8");
								a.setName(messageName);
							}
							//放内容
							if ("message".equals(name)) {
								String message = new String(item.getString().getBytes("iso8859-1"), "utf-8");
								a.setMessage(message);
							}
							//放qq
							if ("qq".equals(name)) {
								a.setQq(item.getString());
							}
							//放电话
							if ("cellphone".equals(name)) {
								a.setPhone(item.getString());
							}
						}

					}
					//获得完前台传过来的数据后，放不是从前台获得的数据
					User user =(User) request.getSession(false).getAttribute("user");
					a.setUserId(user.getUserId());
					a.setUsername(user.getUsername());
					if(messageImage!=null){
						a.setImage(messageImage);
						a.setImageCount(a.getImage().size());
					}

					ActivityBiz ab = new ActivityBiz();
					ab.addMessage(a);


				} catch (FileSizeLimitExceededException e) {
					// TODO: handle exception
					e.printStackTrace();
					request.setAttribute("message", "文件过大");
					response.sendRedirect("myspace/updateheadportrait.jsp");
					return;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

//				response.sendRedirect("myspace/myactivity.jsp");
				request.getRequestDispatcher("myspace/myactivity.jsp").forward(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	/**
	 * 进入我的活动页面
	 */
	private void messageList(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("messageList:");
		try {
			int Pagesize = 3; // 每页显示行数
			int totalNum; // 总行数,从biz再到dao层获取
			int currentpage=1; // 当前页 从request获取
			int totalPage;// 总有页数 totalNum/Pagesize+1
			int startNum;// 开始数量 （currentPage-1）* Pagesize +1
			int finishNum;// 届数数量 currentPage* Pagesize

			currentpage = Integer.parseInt(request.getParameter("currentPage"));
			if(currentpage==0){
				currentpage=1;
			}
			ActivityBiz ab = new ActivityBiz();
			totalNum = ab.getActivityList().size();
			totalPage = totalNum / Pagesize + 1;
			startNum = (currentpage - 1) * Pagesize + 1;
			finishNum = currentpage* Pagesize;
			List<Activity> list = new ArrayList<Activity>();
			list = ab.getActivityList(currentpage, Pagesize);
			request.setAttribute("list", list);
			System.out.println(currentpage);
			request.setAttribute("currentPage", currentpage);
			response.sendRedirect("myspace/myactivity.jsp");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
