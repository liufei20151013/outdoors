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
    <h1 >沿江而行　赏汉江与长江交汇</h1>
    <p >&nbsp;</p>
    <h1 ><img src="images/qx6.jpg" width="600" height="360"></h1>
    <p >&nbsp;</p>
         
    <p>一、线路
汉口沿河大道龙王庙-沿江大道武汉关-沿江大道直到长江二桥</p>
    <p>二、沿途景点</p>
　　龙王庙-武汉关钟楼-武汉港-南京路口诸多老建筑旧址(汉口横滨正金银行大楼旧址、汉口花旗银行大楼旧址、汉口汇丰银行大楼旧址)-武汉江滩正门-黎黄陂路口宋庆龄汉口旧居-合作路口汉口美国领事馆旧址-沿江武汉防汛纪念碑-长江二桥
　<p>三、线路特色</p>
　　这一段均沿江而行，可欣赏到江景，也可见到沿江建筑特色。到达龙王庙时，不妨停车来到江滩内，可以清晰地看到汉江、长江交汇处，不同水色的两江相融的景致。
　　<p>四、试骑志愿者建议</p>
　　线路较长，约10公里，道路条件较好，骑行比较舒适，沿线借车、还车方便，但沿江大道没有绿荫，嫌晒可转入江滩内，到各个闸口的时候去欣赏一下沿江的建筑。对于喜欢江景的人而言，这是一条非常舒服的骑行线路，如果想到江滩内看看，各个闸口都有鑫飞达的自行车站点，可还车后进入江滩漫步。
　　<p>五、周边小吃推荐</p>
<p>龙王庙有武汉有名的金钱豹自助餐厅，不过价位较高。武汉关、武汉港附近的店家各具特色，从南京路、兰陵路路口稍微进去一点，会看到很多私家菜馆，无论是要寻觅情调还是喜欢家常菜，都不会失望。另外，这里还有不少有味道的咖啡馆和不错的酒吧。到达长江二桥附近，就来到了武汉小资一族特别喜爱的武汉天地，私房菜、冰激凌、港式茶餐厅、烘焙蛋糕坊，一应俱全，不过，这里的消费水平稍高。 
 </p>
  </div>
    <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩</h2>
  </div>
</body>
</html>
