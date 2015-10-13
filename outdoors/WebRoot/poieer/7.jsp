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
    <h1 >最原生态的老汉口——黎黄陂路</h1>
    <p >&nbsp;</p>
          <h1 ><img src="images/qx7.jpg" width="600" height="360"></h1>
          <p >&nbsp;</p>
          <p >        一、线路
　　 <p > 沿江大道武汉关-兰陵路-洞庭街-鄱阳街-珞珈山街-黎黄陂路-车站路-京汉大道-芦沟桥路</p>
　　二、沿途景点
　　 
<p > 沿江大道武汉关-武汉关钟楼-武汉港-南京路口诸多老建筑-武汉江滩正门-兰陵路与洞庭街交汇口詹天佑故居-兰陵路与鄱阳街交会口往东八七会议会址-珞珈山街老房子-黎黄陂路街头博物馆-沿鄱阳街或洞庭街骑行至车站路一直骑行到轻轨站点京汉火车站旧址-芦沟桥路汉口新四军旧址</p>
　　三、特色
　　 <p > 这里是老汉口的原租界区，建筑较有特色，同时会有铭牌说明，尤其是黎黄陂路的街头博物馆。沿途会有一些武汉的老里份，感兴趣的游客可以推车进去走一走，这里记录着原生态的老汉口模样。如果你在这里看到背靠竹椅、摇着扇子打瞌睡的老人，请轻轻走过，不要惊扰。在汉口老街巷中，感觉很像到了青岛著名的八大关，不同的是这里的感觉更为原生态。最妙的是，在这里，你永远不用担心会走进死胡同，哪怕小巷再陌生，转悠着转悠着，你会发现又转到了大道上，这就是小街小巷的魅力。</p>
　　四、试骑志愿者建议
　 
<p > 如果只是小范围转一转，步行完全可以；但要是想把整个片区看完整，不妨拿一份地图、骑上一辆单车慢慢游。所经之处多为背街小巷，道路并不宽，虽然很多都是单行线，机动车也不多，但骑行时还是多留意比较好。借车、还车的站亭比较多，遇到自己感兴趣的地方，大可放心把车还了，漫步一下。</p>
　　五、周边小吃推荐
　　 
<p > 沿线的美食实在太多，南京路上的美庐在原吴佩孚公馆上修建，颇有情调，靠少儿图书馆一侧，一家饲养有孔雀的餐厅同样在武汉有不小的名气，再往江边去，烧烤店也是一大美食。　　 </p><p > 拐到珞珈山街上，有美食圈内出了名的川菜馆——渝家小馆。穿过珞珈山街就是黎黄陂路，每一家小咖啡馆都有自己的特色。再往二桥方向，一元路上的四川鲜鱼馆能让你吃鱼吃个够，附近海寿街上的烧烤更是一绝，胜利街上还有圈内有名的情调餐厅莉莉周。这些地方名气虽大，可消费绝对在你 可以接受的范围内。　　 </p><p > 也可从梅园北门处拐向鲁磨路，那里有许多农家饭庄可供骑行之后大快朵颐。风光村一带的饭馆，臭鳜鱼是很不错的推荐。 </p>
 
  </div>
  <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
