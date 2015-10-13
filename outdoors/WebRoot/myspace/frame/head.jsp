<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/footprint/articleList.css">
  </head>
  
  <body>
    <!--导航栏 -->
	<div class="top">
		<div class="lo">
			<img src="images/logo.png" />
		</div>

		<div id="nav">
			<ul>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">我的空间
					<div class="list">
						<a href="myspace.jsp">我的空间</a><br /> 
						<a href="myspace/personalcenter.jsp">个人中心</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">我的足迹
					<div class="list">
						<a href="ArticleServlet?method=articleList">我的足迹</a><br /> <a
							href="ArticleServlet?method=inArticle">发表足迹</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">活动中心
					<div class="list">
						<a href="myspace/myactivity.jsp">我的活动</a><br /> <a
							href="myspace/organizeactivity.jsp">发起活动</a><br /> <a
							href="myspace/activityjoined.jsp">活动报名</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">OutDoor论坛
					<div class="list1">
						<a href="myspace/myforum.jsp">我的论坛</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="list2">
			<a href="main.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a><span>&nbsp;|&nbsp;</span><a
				href="ExitServlet">退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</div>


  </body>
</html>
