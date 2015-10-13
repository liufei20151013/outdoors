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
	background: white;
	margin-top: 80px;
	line-height: 30px;
	margin-right: auto;
	margin-bottom: 0;
	margin-left: auto;
	padding-top: 20px;
	padding-right: 40px;
	padding-bottom: 20px;
	padding-left: 40px;
}
  .foot{width:1200px;text-align:center;height:100px;background:#383838;margin-top:20px;}
.1 {}
.1 {	font-weight: bold;
	text-align: center;
}
.con p {
	font-size: 16px;
	text-indent: 2em;
}
.con h1 {
	font-size: 36px;
	text-align: center;
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
    <h1 >&nbsp;</h1>
    <h1 >兼具自然美景与人文底蕴-----湖北省博物馆</h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/qx5.jpg" width="600" height="360"></h1>
          <p >&nbsp;</p>
          <p >          一、路线
　　 
          <p >省博物馆、省美术馆-听涛景区-梨园广场-沿湖路海洋馆-落雁路沙滩浴场-磨山大门-东湖东路(梅园、樱园、荷花园)-东湖南路(风光村、武大)-天鹅路(放鹰台)
　　 <p >二、沿途景点</p>
　　湖北省博物馆，湖北省美术馆，东湖听涛景区，东湖牡丹园，东湖海洋世界，九女墩，东湖疑海沙滩浴场，落雁景区，磨山景区，武汉大学，水生生物 博物馆，放鹰台。
　　 <p >三、特色</p>
　　 中国最大的城中湖东湖环湖游，可以饱览湖光山色，沿湖骑行时，清风拂面、杨柳依依，可体会到回归自然的美妙感受。
　　 东湖四季，层次丰富，冬品梅、春闻樱、夏观荷、秋赏叶，不管何时来到东湖，都会有不一样的迷人风景。东湖也是武汉人文底蕴非常丰厚的去处，九女墩、磨山、放鹰台，都流传着美丽传说，美术馆、艺术馆则汇集了优秀的历史、文化遗产和现当代艺术作品。
<p >
    四、试骑志愿者建议</p>
　 　环湖路线较长，若不间断骑完全程，大概需要一个半小时，体力较差者慎骑。沿途视野开阔，晴天阳光充足，虽许多路段有树木遮阴，还是建议骑行者提前做好防晒措施。周末、节假日沿路车辆较多，而路面很窄，骑行务必注意安全。
　　沿路自行车租借点比较少，如果需要停车游览，建议携带车锁。
　　 <p >五、周边小吃推荐</p>
<p >如果是个好天气，坐在湖边野餐是一个很好的选择，饭后还可以在树荫下、湖风中打个小盹。但是一定要记得把垃圾带走，除了脚印什么都不要留下。
  </p>
  </p>
</p>
  </div>
   <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
