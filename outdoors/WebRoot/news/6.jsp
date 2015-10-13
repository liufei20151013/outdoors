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
    <h1 >岩壁上的马拉松 探访徒手攀岩大师 </h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h6.jpg" width="600" height="360"></h1>
          <p > 阿利克斯擅长于运动攀登和徒手攀登，曾一天之内完攀三座著名大岩壁—El Capitan、Half Dome和Mt.Watkins，仅用时21小时15分钟，创有史以来最快纪录。但现在回顾这些令人惊叹的成就时，他总是轻描淡写，简单得好像只是去外面吃了个午餐一样。
2007年秋，他一天之内无保护徒手攀登了两条位于优胜美地(Yosemite)国家公园难度极高的多段线路Rostrum 5.11和Astroman 5.11；接着在2008年春，他又首次徒手攀登了位于Zion国家公园的Moonlight Buttress路线—难度级别为5.12的长线路。要知道，当时他年仅21岁。</p >
    　　他是那种只要有时间就用来攀岩的狂热小子，从来都是。然而他对这些成就给他带来的荣耀避而不谈，而是滔滔不绝地谈起自己徒手攀登酋长岩(El Capitan)Salathe Wall路线的经历—这条路线极少有人攀登，难度级别为5.13，高度足有3000英尺。他与同伴花了3天时间才完成攀登。此次攀岩鲜有媒体报道，但对阿利克斯而言却更有意义。
　　<p >完成Rostrum和Astroman路线是很“轻松的”，他坦言道。“攀登完Rostrum后我下来吃了个午餐，然后又出去独自攀登Astroman。完成每条线路只要一个小时。”</p >
　　而对于难度更高的Moonlight Buttress路线，他只是轻描淡写地带过，说自己在以前的攀岩过程中已经练习过那些动作。这个路线沿途都是手指宽的裂缝，海拔高达2000英尺。“我不怕危险，”当谈及无保护徒手攀登时一旦脱落就会丧命的现实时阿利克斯这样说道。“如果你知道你不会掉落，那你自然就不会害怕了。”
　　<p >阿利克斯.霍诺德出生在加利福尼亚州的萨克拉门托，在他11岁时，父母把他带到当地的一个攀岩馆，从此之后他便迷上了这项运动。“他们觉得既然我一直那么喜欢爬树，那我一定会喜欢攀岩。”他回忆道。“不久之后，我每周有5天需要骑车7英里去攀岩馆。每次我在攀岩墙上至少要爬2个小时才会下来，从未中断。”</p >

　　美国当地时间2012年5月18~19日，阿利克斯.霍诺德和搭档Tommy Caldwell在加利福尼亚州优胜美地国家公园计划一口气相继完攀三座著名岩壁—El Capitan、Half Dome和Mt.Watkins。他们来到Watkins峰脚下，活动下筋骨，抬头仰望了下高不见顶的岩壁便开始整理好装备，开始攀登。他们的攀爬次序分别是Watkins南壁路线，酋长岩(El Capitan)的Free Rider路线，最后选择西北壁路线登顶Half Dome。Watkins南壁路线是一条19段绳距的长路线，难度大部分在5.10+左右或者更低些，但其中2段难度达5.13a，包括一个很难的动态Dyno，还有3段5.12难度的线路，他们二人用时2小时40分一次性完攀，中途没有坠落。
他对这些成就给他带来的荣耀避而不谈，而是滔滔不绝地谈起自己徒手攀登酋长岩(El Capitan)Salathe Wall路线的经历—这条路线极少有人攀登，难度级别为5.13，高度足有3000英尺。他与同伴花了3天时间才完成攀登。<p >
</div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
