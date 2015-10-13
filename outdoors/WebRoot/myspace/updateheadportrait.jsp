<%@ page language="java"
	import="java.util.*,com.wipe.biz.MessageBiz,com.wipe.dao.MessageDao,com.wipe.entity.User"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String imagePath = basePath + "file/2.jpg";
	request.setAttribute("basePath", basePath);
%>
<!-- 
<%=path%><br>
<%=basePath%><br>
<%=imagePath%><br>
 -->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/changeheadportrait.css">
<script type="text/javascript" src="js/changeheadportrait.js"></script>
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


	<!--左部菜单-->
	<input id="page" type="hidden" value="">
	<input id="url" type="hidden" value="/outdoors">
	<div class="center">
		<div class="leftNavigation">
			<div class="leftNavigationTop">
				<div class="userImage">
					<img src="${basePath}${left.headPortrait }" width="100px"
						height="100px" />
				</div>
				<div class="userNickName">${left.nickName }</div>
				<div class="userSimpleInfo">
					<div class="friendCount">
						<span>${left.friendCount }</span><br /> <span>关注</span>
					</div>
					<div class="fansCount">
						<span>${left.fansCount }</span><br /> <span>粉丝</span>
					</div>
					<div class="articleCount">
						<span>${left.articleCount }</span><br /> <span>足迹</span>
					</div>
					<div class="activityCount">
						<span>${left.activityCount }</span><br /> <span>活动</span>
					</div>
				</div>
			</div>
			<div class="leftNavigationBottom">
				<div class="personalInfomation">
					<img src="images/customer/user.png" />
					<p class="noticeInformation">个人资料</p>
					<table class="ab">
						<tr>
							<td><a href="myspace.jsp" target="change">基本信息</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/updatemessage.jsp" target="change">修改信息</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/updatesecret.jsp" target="change">修改密码</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/updateheadportrait.jsp" target="change">修改头像</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="personalInfomation">
					<img src="images/customer/left.png" />
					<p class="noticeInformation">足迹</p>
					<table class="ab">
						<tr>
							<td><a href="myspace/myfootprint.jsp">我的足迹</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/publishfootprint.jsp">发表足迹</a>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
				<div class="personalInfomation">
					<img src="images/customer/friend.png" />
					<p class="noticeInformation">关注</p>
					<table class="ab">
						<tr>
							<td><a href="myspace/myattention.jsp" target="change">我的关注</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/myfans.jsp" target="change">我的粉丝</a>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
				<div class="personalInfomation">
					<img src="images/customer/left.png" />
					<p class="noticeInformation">活动</p>
					<table class="ab">
						<tr>
							<td><a href="myspace/myactivity.jsp">我的活动</a>
							</td>
						</tr>

						<tr>
							<td><a href="myspace/organizeactivity.jsp">发起活动</a>
							</td>
						</tr>
						<tr>
							<td><a href="myspace/activityjoined.jsp">活动报名</a>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!--右部信息 -->
	<div id="right">
		<form class="imageBox" action="UpdateHeadPortraitServlet"
			method="post" enctype="multipart/form-data">
			<div class="leftChange">
				<p>当前头像</p>
				<img id="headPortrait" name="headPortrait"
					src="${basePath}${left.headPortrait }" width="200px;"
					height="200px;" />
				<div class="buttonEvent" id="msg">
					<input class="submit2" id="submit2" type="file" name="file1"
						value="修改头像" /> <input class="submit" id="submit" type="submit"
						value="保存" onClick="javascript:CheckFileType();" />
				</div>
			</div>
			<div class="rightNotice">
				<span>修改头像须知：</span>
				<p>1、仅支持PNG、GIF、JPG格式的图片文件；</p>
				<p>2、图片文件大小不超过10M；</p>
				<p>3、请选择尺寸合适的图片，避免选择宽度太大或者高度太大的图片；</p>
				<p>4、为了您的安全，请最好不要上传您的真实头像。</p>
			</div>
		</form>
	</div>

	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
</body>
</html>
