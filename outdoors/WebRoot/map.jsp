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
<title>地图</title>	
<script src="js/js.js"></script>

<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{
	width: 1200px;
	height: 500px;
	margin: 0 auto;
	background: url("images/bg5.png") no-repeat center top;
	font-size: 14px;
	line-height: 20px;
	color: #FFF;
}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;;float:left;}
	li{float:left;text-align:center;font-size:16px;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	.main{width:1000px;height:600px;margin:50px auto; text-align:center}
	 .lo{position:absolute;top:5px;left:100px;}
  .lo img{width:81px;height:96px;} 
  h3{width:400px;text-align:center;clear:both;margin-top:10px;}
  .loginStart{width:80px;line-height:50px;margin:0 0 0 50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .loginStart1{width:50px;line-height:50px;float:left;text-align:center;font-size:16px;cursor:pointer;}
  .sub{width:50px;float:left;padding:10px 0 10px 140px;color:white;}
  .sub1{width:50px;float:left;padding:10px 0 10px 30px;color:white;}
  span{display:block;float:left;color:white;line-height:50px;}
  label{margin-left:80px;display:block;}
  .sub input,.sub1 input{width:60px;height:20px;}
  .close,area{cursor:pointer;}
  .to a{display:block;width:100px;height:30px;margin:10px auto;text-align:center;line-height:30px;border:2px solid #aaa;}
  .close1 {cursor:pointer;width:100px;height:30px;border:2px solid #aaa;background:#eee;text-align:center;line-height:30px;margin:0 auto;}
  .m11,.m22,.m33,.m44,.m55{display:none;width:996px;height:100px;text-align:center;border:2px solid #aaa;background:#383838;}
   .foot{width:1200px;height:100px;background:#383838;text-align:center}
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
		  <div class="login"><a  class="loginStart" href="myspace.jsp">我的空间</a><span>|</span><a class="loginStart1" href="login.html">退出</a></div> 
	</div>
	
	
  <div class="main">
  
  <embed src="flash/route.swf" height="500px" width="800px"><br>
  <br><br>
  <h1>路线：东湖---湖北省博物馆---黄鹤楼---昙华林---户部巷---长江大桥</h1>
       </div>
       
	  <div class="foot"><p>武汉体育学院制作</p></div>	
</body>
</html>
