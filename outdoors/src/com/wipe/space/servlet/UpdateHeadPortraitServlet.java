package com.wipe.space.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.wipe.biz.MessageBiz;
import com.wipe.biz.UserBiz;
import com.wipe.entity.User;

public class UpdateHeadPortraitServlet extends HttpServlet {

	/**
	 * Constructor of  the object.
	 */
	public UpdateHeadPortraitServlet() {
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

	//临时文件存储的位置
	private String tempPath;
	//真实文件存储的位置
	private String uploadPath;
	private String fileName;
	private String[] fileType = new String[] { ".jpg", ".gif", ".bmp", ".png",
			".jpeg", ".ico" };

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// 获取到服务端项目的位置
		String realPath = this.getServletConfig().getServletContext().getRealPath("/");
		//http://localhost:9000/outdoors/
		System.out.println("获取到服务端项目的位置：" + realPath);

		//找到web.xml里面两个文件名称
		String dir = this.getServletConfig().getInitParameter("dir");
		String tmp = this.getServletConfig().getInitParameter("tmp");
		System.out.println("真实文件夹名称：" + dir);
		System.out.println("临时文件夹名称：" + tmp);

		//拼接路径
		//真实路径
		uploadPath = realPath + dir;
		//http://localhost:9000/outdoors/file
		File f1 = new File(uploadPath);
		if(!f1.exists()){
			f1.mkdir();
		}

		//临时路径
		tempPath = realPath + tmp;
		File f2 = new File(tempPath);
		if(!f2.exists()){
			f2.mkdir();
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("修改用户头像:");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		//Servlet中用session
		HttpSession session = request.getSession();
		//ServletContext application = this.getServletContext();
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		UserBiz ub = new UserBiz();
		User left = ub.findUserById(userId);
		session.setAttribute("left", left);

		try {
			//文件名称
			List fileItems;
			//调用第三方的插件来进行上传
			DiskFileUpload dfu = new DiskFileUpload();
			//设置文件上传的大小
			dfu.setSizeMax(1024 * 1024 * 10);
			//设置上传的缓存
			dfu.setSizeThreshold(1024 * 1024);
			//如果文件没有上传完毕就保存在临时文件夹中
			dfu.setRepositoryPath(tempPath);
			//设置上传的普通字段的名称和文件字段的文件名所采用的字符集编码
			dfu.setHeaderEncoding("UTF-8");

			try{
				//接收客户端发送过来的数据（文件或图片）
				fileItems = dfu.parseRequest(request);
				Iterator it = fileItems.iterator();
				while(it.hasNext()){
					//返回fileitem对象，通过这个对象来判断接收的数据是不是文件
					FileItem fi = (FileItem) it.next();
					//					if(fi.isFormField()){
					//						System.out.println("处理表单内容...");
					//						String name = fi.getFieldName();
					//						System.out.println(name);
					//						String value = fi.getString();
					//						System.out.println("Name:"+value);
					//						if(value.equalsIgnoreCase("username")){
					//							user.setUsername(name);
					//						}else if(name.equalsIgnoreCase("password")){
					//							user.setPassword(name);
					//						}
					//										}else{
					//判断文件的大小和判断文件的路径是否存在
					if(fi.getName() != null && fi.getSize() != 0){
						//						if(isIn(fi.getFieldName().toLowerCase(),fileType)){

						//首先找到文件的名称（客户端上传的文件的名称）
						fileName = fi.getName().substring((fi.getName().lastIndexOf("\\")) + 1,fi.getName().length());
						System.out.println(fileName);
					
						//将图片名称转变为时间格式
						Date currTime = new Date();
						SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMddhhmmssS", Locale.US);
						fileName = new String((formatter2.format(currTime)).getBytes("iso-8859-1"));
						fileName = fileName + ".jpg";
						
						System.out.println("客户端上传的文件的名称：" + fi.getName().lastIndexOf("\\"));
						System.out.println("客户端上传的文件的名称：" + fi.getName().length());
						//开始上传 真实的服务端路径 + 上传后的文件的名称
						fi.write(new File(uploadPath + "\\" + fileName));
						//						}
					}
				}
				//把路径存到数据库中
				MessageBiz mb = new MessageBiz();

				String path = "file" + "/" + fileName;
				System.out.println("路径为：" + path);
				user.setHeadPortrait(path);
				boolean flag = mb.updateHeadPortrait(userId,user);
				if(flag){
					//更新头像后，信息没有存到session中，所以要再次查询
					//一旦更新头像，就再次查询userId的信息，实时无刷新更新用户信息，将用户信息存到session中
					boolean b = mb.findUserById(userId);
					if(b){
						left = ub.findUserById(userId);
						session.setAttribute("left", left);
					}
					
					request.getRequestDispatcher("myspace/updateheadportrait.jsp").forward(request, response);
					System.out.println("修改成功！");
				}else{
					response.sendRedirect("404.jsp");
					System.out.println("出错了！！！");
				}

			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	//	public static boolean isIn(String substring, String[] source) {
	//		if (source == null || source.length == 0) {
	//			return false;
	//		}
	//		for (int i = 0; i < source.length; i++) {
	//			String aSource = source[i];
	//			if (aSource.equals(substring)) {
	//				return true;
	//			}
	//		}
	//		return false;
	//	}

}

