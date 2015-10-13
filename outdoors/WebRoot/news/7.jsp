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
	height: 1220px;
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
    <h1 >2015第三届环巴松措国际山地自行车越野竞速赛 </h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/h7.jpg" width="600" height="360"></h1>
          <p > 西藏又到了春意盎然、繁花似锦的季节，在藏东南的神湖巴松措，在风景如画的国家级4A景区巴松措国家森林公园，令人翘首期盼的2015第三届环巴松措国际山地自行车越野竞速赛拉开帷幕。是中国海拔最高的山地自行车越野环湖赛事。</p>
 <p >2015第三届环巴松措山地自行车越野竞速赛由西藏工布江达县人民政府主办，由西藏自治区户外协会、西藏自治区体育产业和设施开发管理中心、西藏旅游股份有限公司、西藏巴松措旅游开发有限公司承办，意在充分展示巴松措区域的自然和人文多样性，为山地越野自行车爱好者开拓新资源，探索旅游、文化、体育结合的新途径。</p>
 <p >本届比赛由前两届的41公里单日赛升级为99公里两日赛，平均海拔由3600米上升到3800米，越野赛段由70%增加到90%，除10公里柏油路，其它全是林道、山路、砂石、草甸路面，赛道极其丰富，国内少有。第一天的赛道从巴松措景区大门口出发，沿传统的环湖赛道，终点为大巴松措区域的工布村庄——结巴村（赛程30公里）。第二天从结巴村向新措沟到桑通草场签到后原路折返骑向比赛总终点-景区门口（赛程69公里）。两天分别计时，最后以总时间进行排名。比赛线路是藏族百姓千百年来传统的朝圣步道，松香野花弥漫中，自然风光壮美间，一路佛塔、经幡、玛尼堆，还有求子洞、消灾洞等神迹，全都环绕在碧波荡漾、雪山倒映的藏东神湖巴松措周边。新措是大巴松措区域内的一条拥有独特丰富景观的山谷，沿路有村庄、田园、瀑布、溪流、草甸、花林和非常丰富的藏东南牧区风光。本次比赛，是一次健康和探险的旅程，是一场人文与湖景的盛宴。</p>
 <p >本届比赛首次升级为国际赛事，多名外国选手参与到比赛中，与国内选手同场竞技，展开激烈角逐。本次比赛共91名国内外自行车爱好者参加，其中男子竞赛组?58人，女子竞赛组21人，体验组12人。6名国外选手分别来自英国、美国、韩国、澳大利亚等国。国内选手则来自西藏、新疆、内蒙古等地，包括汉族、藏族、壮族、白族等多个民族。最年长的选手今年64岁，最年轻的则年仅18周岁。这将是一场多国、多民族、老中青自行车爱好者的同场竞技。同时，竞速赛增加了更多户外元素，邀请到五家户外品牌进行现场户外用品展，并在开幕式增加了自行车花式表演节目。</p>
 <p >开幕式上，首先云南TheOne极限自行车队带来了精彩的自行车花式表演，随后，西藏户外协会执行会长罗浩先生介绍了此次比赛的赛道情况及巴松措景区的优美环境，裁判员、选手及志愿者进行了宣誓。最后，工布江达县人民政府常务副县长李补照先生宣布比赛正式开始！</p>
 <p >在第二日赛程上，选手们在结巴村接受检录后发车。2时15分42秒后，第一天赛程中位列男子组一、二名的罗布与何怀松携手同时冲线，真正体现了“友谊第一，比赛第二”的精神。最终罗布以3时29分47秒的总成绩获得男子组冠军，同时获得区内男子组冠军！何怀松以11秒之差成为男子组亚军！女子组的张曦浠和胡汝则分别在2时52分58秒和2时53分00秒时冲线。张曦浠以4时28分38秒的总成绩成为本次比赛女子组冠军，来自西藏自治区的蔡广莉以5时38分18秒的总成绩获得区内女子组冠军。</p >
  </div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
