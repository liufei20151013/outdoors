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
    <h1 >跳伞渐成西班牙华人热门新运动 释放压力挑战自我</h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h5.jpg" width="600" height="360"></h1>
    <p > 据西班牙欧浪网报道，近两年，跳伞运动开始走进旅西华人的生活，逐渐热门起来。</p >
<p >侨胞李小姐通过西班牙本土的一个团购网站了解到跳伞这项活动。“我是做教师的，平时工作压力倒不是很大，但是生活过于平淡也需要一剂强心针来调剂调剂，同时也想挑战一下自己的勇气，”她说。</p >
<p >记者联系到马德里首家同时也是独家组织华人跳伞的“西游帮”客服叶小姐，她告诉记者，从去年开始，跳伞就已经在华人圈中慢慢热门起来。</p >
　　跳伞越来越热门。据叶小姐说，跳伞运动在旅西华人圈中已经开展了有一年多的时间，目前来咨询和报名的人依旧络绎不绝，他们平均每月会组织2到3次的跳伞活动。近期随着天气的转暖变好，咨询的人也开始增多。据悉，以往前来报名跳伞的主要以年轻人为主，其中有一部分是学生群体，这个群体比较容易能接受新事物。另一个部分是在西班牙做生意的华人或者是普通上班族，这个群体平时工作压力相对较大，他们需要一种方式来完全释放压力。“从去年开始到现在，我们已经接待了超过40名华人来跳伞，其中还有三个是刚超过了14岁的“小朋友”，另外还有客人是跳过一次又来报名的。”吴小姐说。　　
<p>跳伞是什么感觉？记者采访了一名前不久刚刚体验过跳伞的侨胞小王。她说：“跳伞的前一天是开始紧张，心慌，那天上午紧张的不行，心跳加速，兴奋；脚踏上飞机时，突然不紧张了，期待跳下时会是怎么样；开机舱门那一刹那，还没来得急说什么已经跳下去了；漂浮在高空，不是害怕而是全程在享。”　　</p >
<p >当记者问及跳伞有多可怕时，“跳伞的惊险程度还不如蹦极的千分之一，”小王解释道，当你在高空时，飞机时速是140km左右，跳伞时人是以200km左右的时速自由落体下落，差距并不大，也就是说你本来就在动的状态，只不过掉落后加快了动的速度，而蹦极是从静的状态一瞬间变成自由落体，从时速0km一下子加速到200km，因此这种情况下才会出现人们常说的失重感。</p >
<p>仍旧属小众运动.尽管目前跳伞这项顶级的极限运动开始慢慢趋于平民化，但是想要去尝试的人还是受到一些实际因素的影响。首先就是价格，跳伞不同于其他的极限运动，其基本运作成本和安全技术含量相比较其他户外运动高，因此，仅仅是体验一次的价格也不是走平民化路线，除此之外，跳伞还受到心理因素、自身健康条件以及年龄的限制影响。综合而来，这项运动尽管被越来越多人所接触到，但仍旧无法一下成为大众广为参与的运动。</p>
</div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
