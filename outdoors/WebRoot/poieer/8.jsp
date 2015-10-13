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
    <h1 >饕餮美食---户部巷</h1>
    <p >&nbsp;</p>
                   <h1 ><img src="images/qx8.jpg" width="600" height="360"> </h1>
                   <p >&nbsp;</p>
          <p >    一、路线</p>
　　 户部巷-长江大桥-首义广场-辛亥革命起义纪念馆-黄鹤楼公园-古楼洞-胭脂路-昙华林-得胜桥-中华路码头-武昌江滩
　　 <p >二、沿途景点</p>
　　从户部巷出来，可以先上长江大桥桥头堡眺望长江，下桥后沿途经过辛亥革命起义纪念馆、黄鹤楼，这都是武汉经典的景点。古楼洞、胭脂路、昙华林这些老武昌文化氛围浓厚的地方更是一步一景，有不少天主教堂、辛亥革命旧址、名人故居等。在武昌江滩中华路码头还可坐游船游览两江。　 
<p >三、特色</p>
　　沿途有不少武汉著名的景点，户部巷过早、首义园的小吃、司门口夜市等美食聚集地，也是来武汉不能错过的体验过早文化和夜市文化的地方。
　　若是有多的空闲时间，可花上一整天时间沿路逛逛走走停停，走进这些老武昌的背街小巷，会发现不少比著名景点更有意思的惊喜。夏日日头最毒的时候，下午去昙华林找家小小咖啡馆发上一会呆，到了晚上，吃过夜宵，坐在武昌江滩边吹吹江风，最惬意不过。
　　 
<p >四、试骑志愿者建议　　 </p><p >这条线路较长，慢游需花上一天。临江大道路况好，借车、还车的站点多。司门口、粮道街、胭脂路都比较窄，车流量也很大，骑行需避让行人和车辆。昙华林可以选择步行慢游，沿街有许多有意思的小店和景点可以逛。</p>
　　五、周边小吃推荐
　　 
<p >在这条路线上骑行，最不用担心没好吃的。早上在武汉最有名的户部巷过早，不过面对琳琅满目的美食，可不要贪多吃撑了；中午骑到首义广场，可以去首义园小吃街寻觅美食；下午在昙华林里逛到一家叫大水的店可进去坐坐，店主手绘的武汉地图在微博上很火，店内吃食饮料一般，但环境绝对别致；到了晚上，可到生意红火的司门口夜市粮道街上，点上一份绝对够味的腰子粉、牛骨头，青龙巷里的建建枯豆丝和烧烤也不能错过。 </p>
 
  </div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
