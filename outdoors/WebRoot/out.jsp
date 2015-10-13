<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
<title>户外素拓</title>	
<script src="js/js.js"></script>
<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:784px;margin:0 auto;}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	.con{background:url("images/bg3.png") no-repeat;width:1200px;height:753px;overflow:hidden;}
	.box{width:360px;height:357px;margin:150px  350px;overflow:hidden;float:left;}
	.rot{width:360px;height:714px;}
	.de{transform:rotate(180deg);-webkit-transform:rotate(180deg);}
  .box:hover .rot{transform:rotate(180deg);-webkit-transform:rotate(180deg);}
  .bc{width:261px;height:260px;float:left;margin:-550px 0 0 650px;}
  .cd{width:271px;height:264px;float:left;margin:-170px 0 0 402px;}
  .ef{width:261px;height:263px;float:left;margin:-600px 280px 0 100px;}
  .con a{width:250px;height:60px;display:block;}
  h3{width:400px;text-align:center;clear:both;margin-top:10px;}
  .loginStart{width:80px;line-height:50px;margin:0 0 0 50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .loginStart1{width:50px;line-height:50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .sub{width:50px;float:left;padding:10px 0 10px 140px;color:white;}
  .sub1{width:50px;float:left;padding:10px 0 10px 30px;color:white;}
  span{display:block;float:left;color:white;line-height:50px;}
  label{margin-left:80px;display:block;}
  .sub input,.sub1 input{width:60px;height:20px;}
  .close{cursor:pointer;}
  .lo{position:absolute;top:5px;left:100px;}
  .lo img{width:81px;height:96px;}
</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
	      <div class="login"><a  class="loginStart" href="myspace.jsp.jsp">我的空间</a><span>|</span><a class="loginStart1" href="login.html">退出</a></div>  
	</div>
  <div class="con">
  	      <div class="box">
  	      	  <div class="rot">
                <div class="ab"><img src="images/9.png"/></div>
                 <div class="de"><img src="images/12.png"/></a></div>
              </div>
          </div>
          <div class="bc"><a href="walk2.jsp"><img src="images/10.png"/></a></div>
          <div class="cd"><a href="walk3.jsp"><img src="images/11.png"/></a></div>
          
          <div class="ef"><a href="walk1.jsp"><img src="images/13.png"/></a></div>
         
  </div>
</body>
</html>
