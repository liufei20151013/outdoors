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
<title>介绍</title>	
<script src="js/js.js"></script>
<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:900px;margin:0 auto;background:url("images/bg5.png") no-repeat center top;}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	
  .loginBegin,.loginBegin1{display:none;position:absolute;left:400px;top:300px;color:white; line-height:200%;width:400px;height:200px;border:2px solid #aaa;background:#383838;}
  .loginBegin1{height:300px;}
  h3{width:400px;text-align:center;clear:both;margin-top:10px;}
  .loginStart{width:50px;line-height:50px;margin:0 0 0 50px;float:left;text-align:center;font-size:14px;cursor:pointer;}
  .loginStart1{width:50px;line-height:50px;float:left;text-align:center;font-size:14px;cursor:pointer;}
  .sub{width:50px;float:left;padding:10px 0 10px 140px;color:white;}
  .sub1{width:50px;float:left;padding:10px 0 10px 30px;color:white;}
  span{display:block;float:left;color:white;line-height:50px;}
  label{margin-left:80px;display:block;}
  .sub input,.sub1 input{width:60px;height:20px;}
  .close{cursor:pointer;}
  .lo{position:absolute;top:5px;left:100px;}
  .lo img{width:81px;height:96px;}
  .con{
	width: 1050px;
	height: 1200px;
	margin: 0 auto;
	background: white;
	margin-top: 80px;
	line-height: 30px;
}
  .foot{width:1200px;text-align:center;height:100px;background:#383838;margin-top:20px;}
.1 {}
.1 {	font-weight: bold;
	text-align: center;
}
.con p {
	font-size: 16px;
	text-indent: 2em;
	padding-right: 40px;
	padding-left: 40px;
}
.con h1 {
	font-size: 36px;
	text-align: center;
	padding-top: 20px;
	padding-right: 40px;
	padding-bottom: 20px;
	padding-left: 40px;
	line-height: 30px;
}
</style>
<script>
$(document).ready(function(e) {
	$(".loginStart1").click(function(){$(".loginBegin").fadeIn(1000);});
	$(".close").click(function(){$(".loginBegin").fadeOut(1000);});
	$(".loginStart1").click(function(){$(".loginBegin1").fadeIn(1000);});
	$(".close").click(function(){$(".loginBegin1").fadeOut(1000);});
});
</script>
    
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
		<div class="login"><a  class="loginStart">${user.username}</a></div>  
		<div class="loginBegin">
				<form >
				<h3>登录账号</h3>
				<label >用户名：<input  type="text"></label> 
				<label >密　码：<input  type="password"></label> 
				<div class="sub"><input type="submit" value="登录" size="52px"></div>
				<div class="sub1"><input type="reset" value="重置"></div>				
				<h3 class="close">关闭</h3>
				</form>  				                                
	  </div>	
	  
	  <div class="loginBegin1">
				<form >
				<h3>用户注册</h3>
				<label >邮箱/手机：<input  type="text"></label> 
				<label >创建密码 ：<input  type="password"></label> 
				<label >昵　　称 ：<input  type="text"></label>
				<label >真实姓名 ：<input  type="text"></label>
				<label>性　　别  ：<input type="radio" name="sex" checked>男 <input type="radio"  name="sex">女 </label>
				<div class="sub"><input type="submit" value="登录" size="52px"></div>
				<div class="sub1"><input type="reset" value="重置"></div>				
				<h3 class="close">关闭</h3>
				</form>  				                                
	  </div>	
	</div>
  <div class="con">
    <h1 >谁是冠军 ?</h1>
    <h1 ><img src="images/h4.jpg" width="600" height="360"></h1>
          <p > 有人说，冠军是一种实力；有人说，冠军是一次爆发；也有人说，冠军是一份运气。你是否试想过，当你与冠军同台竞技，王者与勇气相遇，实力与魅力交锋，谁能登上最终的荣耀奖台？谁又将收获最终的欢呼与掌声？</p>
          <p >2015年2月7日-8日，奥迪2015滑雪冠军中国挑战赛即将在密苑?云顶乐园拉开帷幕，届时，八位冠军将各自带领团队一决高下。现阶段，各团队成员正在火热招募中。即刻报名，就可以获得与冠军们同台展现的机会，下一个站在聚光灯下的就是你！</p >
<p >她是中国滑雪史上的第一位世界冠军，15岁时就荣获世界级滑雪大赛的第一名，16岁又再次获得了世界杯自由式滑雪系列赛澳大利亚站空中技巧第一名。</p >
<p >曾多次获得世界杯冠军的她，身材小巧，笑容腼腆。在1998年长野冬奥会上，她为中国夺得了第一枚雪上项目银牌，又于2010年为中国夺得冬奥会女子自由式滑雪空中技巧比赛的金牌。</p >
<p >她是中国自由式滑雪空中技巧项目的新秀，在2008年全国冬季运动会上勇夺三冠，并于2011年在美国自由式滑雪世锦赛摘得金牌，让众多滑雪老将感叹后生可畏。</p >
 <p >他是中国内地第一个加盟欧洲方程式车队的车手，曾多次获得中国方程式冠军及亚洲雷诺方程式冠军。2013赛季中，他加盟了奥迪运动部，将他的天赋、决心和技术与奥迪在赛车运动上的优势完美结合。 </p >
 <p >她是中国花样滑冰队的主力队员，早在1998年的北京世界青少年大奖赛上，她便斩获人生首个冠军。2006年都灵冬奥会上，她在四周跳失败受伤的情况下顽强地重返赛场，顺利完成了比赛，并一举夺得了银牌，以实际行动诠释了奥运精神，令世界为之动容。 </p ><p >他从1986年开始学习射击，在1996年第46届世界射击锦标赛中，荣获首枚金牌。2000年的悉尼奥运会上，他以681.1环的优异成绩获得了男子射击10米移动靶冠军。他用行动说明了，冠军不仅是一种实力，也是坚持不懈和永无畏惧。 </p >
 <p >2000年，她荣获第六届中国模特之星大赛冠军及“最受欢迎模特奖”。她参演多部电视剧，是时下炙手可热的女明星。2013年她在明星跳水真人秀节目《中国星跳跃》中的表现展示了她的过人的勇气和运动天赋。
他是Hit FM的当家主播，也是声动中国最受欢迎的主持人。在主持界已倍享冠军荣耀的他，却对冰雪世界情有独钟。2014年3月，他登上了《SKI》杂志的封面，与冬季运动结下了不解之缘。 </p >
 <p >八位冠军共聚奥迪2015滑雪冠军中国挑战赛，期待与你一同挑战冰雪天地，创造传奇。只要你对冬季运动感兴趣，只要你敢于挑战，即可报名参加奥迪2015滑雪冠军中国挑战赛。届时，你将与冠军在同一片蓝天白雪下纵情飞舞，享受风在耳边，雪在脚下的无限自由。</p>         
</div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
