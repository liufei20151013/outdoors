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
<script src="../js/js.js"></script>
<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:900px;margin:0 auto;background:url("images/bg5.png") no-repeat center top;}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
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
  .con{
	width: 1050px;
	height: 1200px;
	margin: 0 auto;
	background: white;
	margin-top: 80px;
	line-height: 30px;
}
  .foot{width:1200px;height:100px;background:#383838;margin-top:20px; text-align:center}
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
	$(".loginStart").click(function(){$(".loginBegin").fadeIn(1000);});
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
		  <div class="login"><a  class="loginStart" href="personalcenter.jsp">我的空间</a><span>|</span><a class="loginStart1" href="login.html">退出</a></div>  	
	</div>
  <div class="con">
    <h1 >岩壁上的马拉松 探访徒手攀岩大师</h1>
    <h1 ><img src="images/h1 .jpg" width="600" height="360"></h1>
          <p > 少年智则中国智，少年强则中国强”，青少年是祖国的花朵，更是祖国的未来，他们将肩负着建设祖国未来的重任。然而，时下的中国，“奥数”、“英语培训班”、“钢琴培训班”等各种兴趣培训班把他们压得喘不过气！强身健体，拥有坚强的体魄对他们来说却成为了一种奢求！这个“六一儿童节”，何不带上您的“宝贝”跟随柳州合隆奥迪一起前往广西科技大学体育馆进行一次有意义的攀岩活动呢？告诉他们克服困难、勇攀高峰的精神才是我们这辈子所应该追求的东西!</p>
 <p >此次活动分为特殊青年组、公开组、家庭组、专业组四个小组，每个小组的前三名将获得由此次活动主办方提供的精美奖品一份，此外参与活动的每一位选手都将获得由柳州合隆奥迪4S店提供的精美水晶纪念相框一份！除此之外，此次活动还设有高科技的电子签到系统，只要拿起您的手机扫一扫我们的微信公众平台账号，您将获得一份额外的精美小礼包！不仅如此，如果您将此次活动的精彩内容分享至您的朋友圈，集够相应数量的“赞”，您将获得由柳州合隆奥迪4S店提供的大礼包一份！</p>
 <p >活动分组：</p>
 <p >特殊青年组：不按年龄，只分男女；</p>
 <p >公开组：小学组，初中组，各组分男女；</p>
 <p >家庭组：一个家长加一个小朋友（由父母与孩子组合）</p>
 <p >专业组：由组委会确定该组人员名单，不分年龄，只分男女。</p>
 <p >比赛规则：</p>
 <p >除专业组外，其他组别都采取顶绳攀登。计分方式为：按照攀登高度计算成绩，高度相同时所用时间少者成绩靠前。</p>
 <p >奖励方法：</p>
 <p >各组男女均取前三名给予奖励。</p>
 <p >活动说明：</p>
 <p >本赛事方案最终解释权归组委会所有。</p>
 <p >活动主题：“共庆六一·欢乐龙城”广西科技大学攀岩体验活动</p>
 <p >活动时间：2015年6月1日?上午9：00--12：00</p>
 <p >活动地点：广西科技大学攀岩馆（综合体育馆一楼）</p >
  </div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
