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
    <h1 >徒步攀爬陵水月光滩礁石 </h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h3.jpg" width="600" height="360"></h1>
          <p > 11月14日，应驴头“老马”邀约徒步攀爬陵水月光滩礁石，本来前一天值班没做出行准备，但还是欣然参加。原因有二：一是再游陵水；二是经典徒步攀爬路线，有挑战，不容错过。15日一早，琼岛户外小队海口站队员便集结于海口人大会堂，7：30分准时出发，黄竹路口老马和3位队员上车后，15人小队正式集结完毕。</p>
                <p>海南天气好奇怪，东线高速上定安、琼海、万宁段大雨滂沱，大家都很担心陵水下雨的话，礁石湿滑，就不得不改变徒步线路了，那样的话对我们这些热爱攀爬路线的驴友来说真是好遗憾。就在这个时候，队伍中资深老驴“大毛”很沉稳的说：牛岭分界洲一带是海南气候的分界线，有可能分办洲那边的陵水没下雨呢，大家心里不免又闪过一丝希望。车车继续前行，就在过了分办洲后，奇迹出现了，这里地上地面干干，天上白云飘飘，不光没有下雨，天气还很不错，稍有点热意，一颗悬着的心终于放下了，车子直奔目的地前进。</p>
<p>  这次攀爬的路线异常险峻，但无限风光在险峰真的非常有道理，这里天高去淡海阔浪急，好美，微信好友评价了一“月光滩，会唱歌的海滩”，真的是太贴切了。有几个驴友情不自禁的对着蓝天大海吼叫，呵，对我们这些长期都市生活的人来说，真是一种放松。这次路线本就带有探险的性质，在老马的带领下，想穿过海滩到达陵水角，但遇到一处直立落差达20米的悬崖，实在无法通过，在短暂商议后计算好时间只得原路返回。在这个地方，“大毛”兄一马当先不惧危险、攀爬悬崖探路，还有“彩云飞”上山探路在前、下山断后，还为大家祈福，真是辛苦了，向他们致敬。另外，队伍中几位女将巾帼不让须眉，不惧艰险，非常勇敢，特别是两位大姐，克服一切阻力、勇往直前，更加鼓舞了士气。</p>
      <p>琼岛户外小队，一路攀爬，一路探险，一路艰辛，老驴帮新驴、男驴帮女驴，终于天黑前安全返回。在回海口的路上，大家说的最多的就是“今天一点不遗憾，今天真过瘾”。</p>
      <p>下山的路线非常险峻，大家手脚屁股并用，相机放在背包里，根本顾不上拍了，所以仅上山时拍了了几张照片，现在贴出来。    感谢老马，向各位驴友学习、致敬。</p>
</div>
   <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
