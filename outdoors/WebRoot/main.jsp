<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String user=(String)request.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>首页</title>
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/js.js"></script>

<style tydive="text/css">
  *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:784px;margin:0 auto;}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	.con{background:url("images/bg1.png") no-repeat;width:1200px;
		height:737px;font-size:46px;color:white;}
  .ab{margin-left:900px;margin-bottom:100px;padding-top:80px;}
  .bc{margin-left:780px;margin-bottom:100px;}
  .cd{margin-left:660px;margin-bottom:100px;}
  .de{margin-left:540px;margin-bottom:100px;}
  .con a{width:250px;height:60px;display:block;}
  h3{width:400px;text-align:center;clear:both;margin-top:10px;}
  .loginStart{width:80px;line-height:50px;margin:0 0 0 50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .loginStart1{width:50px;line-height:50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .sub{width:50px;float:left;padding:10px 0 10px 140px;color:white;}
  .sub1{width:50px;float:left;padding:10px 0 10px 30px;color:white;}
  span{display:block;float:left;color:white;line-height:50px;}
  .close{cursor:pointer;}
  .lo{position:absolute;top:5px;left:100px;}
  .lo img{width:81px;height:96px;}
</style>
  </head>
  
  <body>
	<div class="top">
		<div class="lo"><img src="images/logo.png"/></div>
		<ul>
		  <li><a  href="main.jsp">首页</a></li>
		  <li><a  href="physical.jsp">体育旅游</a></li>
		  <li><a  href="out.jsp">户外素拓</a></li>        
		  <li><a  href="private.jsp">私人定制</a></li>        
		  <li><a  href="news.jsp">户外资讯</a></li>		
		</ul>
		  <div class="login"><a  class="loginStart" href="myspace.jsp">我的空间</a><span>|</span><a class="loginStart1" href="login.html">退出</a></div>  	
	</div>  
  <div class="con">
  	<div class="ab"><a  href="physical.jsp"><img src="images/6.png"/>体育旅游</a></div>
  	<div class="bc"><a  href="out.jsp"><img src="images/6.png"/>户外素拓</a></div>
  	<div class="cd"><a  href="private.jsp"><img src="images/6.png"/>私人定制</a></div>
  	<div class="de"><a  href="news.jsp"><img src="images/6.png"/>户外资讯</a></div>
  	
  	</div>
</body>
</html>
