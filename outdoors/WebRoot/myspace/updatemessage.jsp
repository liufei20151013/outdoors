<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% String user=(String)request.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
<link rel="stylesheet" href="css/updatemessage.css" type="text/css" />
<script type="text/javascript" src="js/updatemessage.js"></script>
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
	<input id="page" type="hidden" value="${page }">
	<input id="url" type="hidden" value="/outdoors">
	<div class="center">
		<div class="leftNavigation">
			<div class="leftNavigationTop">
				<div class="userImage">
					<img src="${basePath}${left.headPortrait }" width="100px"
						height="100px" />
				</div>
				<div class="nickName">${left.nickName }</div>
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
							<td><a href="myspace/myfootprint.jsp">我的足迹</a></td>
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

		<!--右部信息 -->
		<div class="right">
			<div id="title">
				<img id="png" src="images/customer/shangbiao.png" />修改信息
			</div>
			<hr />
			<div class="ac">
				<form id="fm1" method="post" action="UpdateUserMessageServlet">
					<input type="hidden" name="method" value="doRegister">
					<ul>
						<li><span>&nbsp;&nbsp;用户名&nbsp;&nbsp;&nbsp;&nbsp;</span> <input
							onBlur="judgeName()" id="username" name="username" class=""
							type="text" value="" /> <span id="showName"></span></li>
						<li><span>&nbsp;&nbsp;验证邮箱&nbsp;</span> <input
							onBlur="judgeMail()" id="email" name="email" class="" type="text"
							value="" /> <span id="showMail"></span></li>
						<li><span>&nbsp;&nbsp;昵称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input onBlur="judgeNickName()" id="nickName" name="nickName"
							class="" type="text" value="" /> <span id="showNickName"></span>
						</li>
						<li><span>&nbsp;&nbsp;电话号码&nbsp;</span> <input
							onBlur="judgePhone()" id="phone" name="phone" class=""
							type="text" value="" /> <span id="showPhone"></span></li>
						<li><span>&nbsp;&nbsp;qq号码&nbsp;&nbsp;&nbsp;</span> <input
							onBlur="judgeQq()" id="qq" name="qq" class="" type="text"
							value="" /> <span id="showQq"></span></li>
						<li><div id="af">
								<span>&nbsp;性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input name="gender" type="radio" value="男" />男 <input
									name="gender" type="radio" value="女" />女
							</div></li>
						<li><div id="bc">
								<span>&nbsp;验证码&nbsp;&nbsp;&nbsp;&nbsp;</span> <input
									onBlur="judgeMa()" id="judgema" name="judgema" class="judgema"
									type="text" value="" /> <span id="showJud"></span>
							</div></li>
						<li>
							<div id="showmaid"
								style="font-size:36px; font-family:'隶书'; text-align:center;"></div>
							<input type="hidden" name="judgemaagain" value=""></li>
						<li>
							<div id="ae">
								<a href="javascript:void(0)" onClick="showMa()">看不清楚？换一张</a>
							</div></li>
					</ul>
				</form>
				<div id="sub">
					<input id="submitBut" type="button" value="保存"
						onClick="submitCheckForm()" /> <input id="resetBut" type="button"
						value="重置" onClick="resetForm()" />
				</div>
			</div>

		</div>
	</div>

	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
</body>
</html>
