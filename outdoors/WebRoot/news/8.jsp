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
    <h1 >野外生存技巧--如何寻找正确路程 </h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h8.jpg" width="600" height="360"></h1>
          <p >  寻找正确路程的技巧必须通过平时的野外活动去积累。例如：平时就养成随时参考地图和指南针的习惯，同时积极地观察周围的地形以及身边的植物来判断正确的位置。　　</p><p >太阳从东方出，西方落，这是最基本的辨识方向的方法。还可用木棒成影法来测量，在太阳足以成影的时候，在平地上竖一根直棍（1米以上），在木棍影子的顶端放一块石头（或作其他标记），木棍的影子会随着太阳的移动而移动。30--60分钟后，再次在木棍的影子顶端放另一块石头。然后在两个石头之间划一条直线，在这条线的中间划一条与之垂直相交的直线。然后左脚踩在第一标记点上，右脚踩在第二标记点上。这时站立者的正面即是正北方，背面为正南方，右手是东方，左手为西面。　</p><p >若在阴天迷了路，可以靠树木或石头上的苔藓的生长状态来获知方位。在北半球以树木而言，树叶生长茂盛的一方即是南方。若切开树木，年轮幅度较宽的一方湿长着苔藓的一方即是北方。　　</p><p >利用星宿：在北半球通常以北极星为目标。夜晚利用北极星辨认方向的关键在于在茫茫星海中，准确地找到北极星。认识北极星的方法有许多种，这里介绍简单且有效的一种:　　</p><p >首先找寻杓状的北斗七星（a），以杓柄上的两颗星的间隔延长五倍，就能在此直线上找到北极星（d）。一般特别地称呼此两颗构柄上的星为要点星球。如看不到北斗七星时，就找寻相反方向的仙后星座（b），仙后星座由五颗星形成，它们看起来像英文字母的M或W倾向一方的形状。从仙后星座中的一颗星画直线，就在几乎和北斗七星到北极星的同样距离处就可找到北极星。北极星所在的方向就是正北方。　</p><p >以手表看方位：想获知方位手上却没有指南针。遇此情况，只要有太阳就可使用手表探知方位。　　</p><p >将火柴棒竖立在地面，接着把手表水平地放在地面，将火柴棒的影子和短针重叠起来，表面十二点的方向和短针所指刻度的中间是南方，相反的一边是北方。　　</p><p >若身上没有火柴，也可改用小树枝，尽量使影子更准确。若从事挑战性的生存活动，记住戴上手表，这时普通表比数字表就更有价值。因普通表上的时针分针，在必要时会成为求生存的重要工具。</p >
  </div>
   <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
