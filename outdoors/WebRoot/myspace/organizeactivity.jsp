<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发起活动</title>
</head>
	<link rel="stylesheet" type="text/css" href="css/activity/addMessage.css">
	<script type="text/javascript" src="js/activity/addMessage.js"></script>
	<script src="js/activity/extend.js"></script>
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
						<a href="myspace/myfootprint.jsp">我的足迹</a><br /> <a
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
	<div class="center">
		<form  id="form" action="ActivityServlet?method=doAddMessage" class="myInformationBox" method="post"
			enctype="multipart/form-data">
			<table class="information" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2" style="font-weight:bold;">记下你想发起的活动，邀请好友们参与吧</td>
				</tr>
				<tr>
					<td class="labelTD">活动名称：</td>
					<td class="inputWrite"><input id="activeName" type="text" name="name" onblur="activeExtend();"/>
					<span id="remindActiveName" style="color:gray;font-size: 14px;">输入活动名称，最多20字</span></td>
				</tr>
				<tr>
					<td class="labelTD">上传图片：</td>
					<td><input type="file" name="img1" multiple /><input type="file" name="img2" multiple /></td>
				</tr>
				<tr>
					<td class="labelTD">活动详情</td>
					<td class="inputWrite"><textarea id="password" type="text" name="message" onblur="activeContent();"/></textarea>
					<span id="remindactiveContent" style="color:gray;font-size: 14px;">输入活动内容，最多2000字</span></td>
				</tr>
				<tr>
					<td class="labelTD">QQ:</td>
					<td class="inputWrite"><input id="QQname" type="text" name="qq" onblur="QQrule();"/><span id="remindQQname" style="color:gray;font-size: 14px;">输入QQ号码</span></td>
				</tr>
				<tr>
					<td class="labelTD">联系电话：</td>
					<td class="inputWrite"><input id="telphone" type="text" name="cellphone" onblur="telRule();"/>
					<span id="remindtelphone" style="color:gray;font-size: 14px;">输入联系电话</span>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" name="SYS_SET"
						value="发表" onclick="submitMotto();"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
</body>
</html>