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
    <h1 >成都湿地探险 </h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h2.jpg" width="600" height="360"></h1>
          <p >          近日，从媒体报道的《成都市绿地系统规划（2013-2020）》获知，成都将新建9处大型湿地：中心城区环城生态区湿地、彭州湔江湿地、崇州双河湿地、崇州羊马湿地、温江金马湿地、新津兴义湿地、龙泉驿西河湿地、新都毗河湿地，扩建青白江凤凰湿地因水而兴的成都，将在更多水系的交错环绕中，延续水兴城盛的梦想。 </p>
            <p >一段时期以来，在人们一眼看得见的GDP数字催促之下，在人们急迫提升的居住和食物需求催逼之下，在各种看似迫在眉睫的现实利益引诱之下，湿地的意义和价值曾一度被低估甚至忽视。就像人们喜欢将坏脾气发泄给自己最亲的人那样，我们忽视了湿地的意义和价值，忽视了它的默默奉献，忽视了对它的回馈与保护。而因为这一切付出的代价，也是显而易见的，包括水系被损而形成的内涝，污染，热岛效应，空气质量下降，生物多样性被破坏等一系列问题。这并不是哪一个城市的问题，而是几乎所有城市都面临的一个可怕的问题。被喻为城市之肾的湿地受到忽视甚至破坏的后果，那便是城市患上了肾衰甚至尿毒症，那样的城市，是很难奢谈健康和宜居的。 </p>
          <p >成都是一个在这方面有着先知先觉的城市。近年来，历届政府和成都市民一起，共同打造的包括府南河-沙河整治工程以及活水公园等涉水民生项目，无论在外界还是在民众心中，都留下了良好的印象。笔者本人作为一个热爱成都的人，时常向外地朋友们炫耀和引以为自豪的成都惬意生活元素中，就包括这些工程造就的一天比一天清凉的水和一年比一年茂盛的植被。在活水公园就着绿色的空气喝杯清茶，已是我多年生活的一部分。许多成都市民，对此也是有同感的。 </p>
          <p >正是基于这样的原因，当我听闻成都一系列新的湿地保护和建设项目出台时，发自内心地表示欢迎和支持。在成都的湿地中，有我到过现场并亲眼目睹过的开满芙蓉的清水河公园，有能够听闻古佛寺晨钟的江安河生态湿地；有鸟语喧哗的青龙湖生态湿地，有宁静古雅的锦城湖生态湿地。也有我耳闻朋友们夸赞的新都香城生态湿地，白鹭湾生态湿地，东湖公园，南湖公园，沙河湿地公园等。一些人已慕名迁居到它们的附近，以此开启一种生态和健康的生活方式，而最诱人之处就在于，这种生活，离他们所热爱的现代城市生活并不遥远。 </p>
  </div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
