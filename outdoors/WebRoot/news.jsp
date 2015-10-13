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
<title>户外资讯</title>	
<script src="js/js.js"></script>
<script src="js/jquery.js"></script>
<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:2065px;margin:0 auto;background:url("images/bg5.png") no-repeat center top;}
	.top{background:#383838;width:1200px;height:50px;position:absolute;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	.foot{
	text-align:center}
	.main{width:1050px;height:1000px;margin:0 auto;padding-top:100px;}
	.box{width:500px;height:350px;overflow:hidden;margin-top:20px;float:left;}
	.box1{float:right;}
	.rot{width:500px;height:700px;}
	.cap{transform:rotate(180deg);-webkit-transform:rotate(180deg);position:relative;}
	h1 a{display:block;width:500px;line-height:80px;position:absolute;bottom:0;text-align:center;color:white;}
	.box:hover .rot{transform:rotate(180deg);-webkit-transform:rotate(180deg);}
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
  .photo_box01{width:1050px;height:370px;float:right;position:relative;}
   .photo_box01 img{float:right;}
   .btn_left{width:18px;height:31px;background-image:url(images/ctrl_left.png);cursor:pointer;position:absolute;left:30px;top:165px;}
   .btn_right{width:18px;height:31px;background-image:url(images/ctrl_right.png);cursor:pointer;position:absolute;right:30px;top:165px;}
	.btn{position:absolute;right:15%;bottom:5%;margin-right:5px;}
   .photo_box01 a{width:10px;height:10px;float:left;margin:0 5px;background-image:url(images/ctrl_02.png);cursor:pointer;}
   .btn .current{background-image:url(images/ctrl_01.png);
   }   
	</style>
    
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
		  <div class="login"><a  class="loginStart" href="myspace.jsp">我的空间</a><span>|</span><a class="loginStart1" href="login.html">退出</a></div> 
	</div>
  <div class="main">
         <div class="photo_box01">  
         	  <div class="btn_left" onselectstart="return false"></div>
            <div class="btn_right" onselectstart="return false"></div>
            <img src="images/b1.png">
            <img src="images/b2.png">
            <img src="images/b3.png">
            <img src="images/b4.png">
            <img src="images/b5.png">
             <div class="btn">
                <a class="current"></a>
                <a></a>  <a></a>    <a></a>      <a></a>
        	   </div>
         </div> 
       <div class="box">
       	<div class="rot">
       		 <img src="images/a.png"/>
       		 <div class="cap">
       		 	<img src="images/aa.png"/>
       		 	<h1><a href="news/1.jsp">极限攀岩活动进程</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/b.png"/>
       		 <div class="cap">
       		 	<img src="images/bb.png"/>
       		 	<h1><a href="news/2.jsp">野外大冒险</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/c.png"/>
       		 <div class="cap">
       		 	<img src="images/cc.png"/>
       		 	<h1><a href="news/3.jsp">礁石攀爬</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/q1.png"/>
       		 <div class="cap">
       		 	<img src="images/q11.png"/>
       		 	<h1><a href="news/4.jsp">滑雪</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/q2.png"/>
       		 <div class="cap">
       		 	<img src="images/q22.png"/>
       		 	<h1><a href="news/5.jsp">跳伞</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/q3.png"/>
       		 <div class="cap">
       		 	<img src="images/q33.png"/>
       		 	<h1><a href="news/6.jsp">徒手攀岩</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/q4.png"/>
       		 <div class="cap">
       		 	<img src="images/q44.png"/>
       		 	<h1><a href="news/7.jsp">自行车竞速</a></h1>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/q5.png"/>
       		 <div class="cap">
       		 	<img src="images/q55.png"/>
       		 	<h1><a href="news/8.jsp">野外生存</a></h1>
       		 	</div>
       		</div>       	
       	</div>
  </div>
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

	    <div class="foot"><h2>Copyright@武汉体育学院</h2>
  <h2>武汉市洪山区珞瑜路461号</h2>
  <h2>made by 王朋  李璇  刘飞  谷倩 </h2>
  </div>	
</body>
<script>
/*初始化*/
$(".photo_box01 img").hide();
$(".photo_box01 img:first").show();
/*点按钮让n+1*/
var n=0;
$(".btn_right").click(function(){
	if(n<$(".photo_box01 img").length-1){
		n=n+1;
	}else{n=0;}
	$(".photo_box01 img").hide();
	$(".photo_box01 img:eq("+n+")").show()
	})
$(".btn_left").click(function(){
	if(n>0){
		n=n-1;
	}else{
		n=$(".photo_box01 img").length-1;}
	$(".photo_box01 img").hide();
	$(".photo_box01 img:eq("+n+")").show()
	})
	/*初始化*/
$(".photo_box01 img").hide();
$(".photo_box01 img:first").show();
/*点对应按钮让对应图片显示*/
$(".photo_box01 a").click(function(){
	var n=$(".photo_box01 a").index(this);/*变量n=我点击的这个a*/
	$(".photo_box01 img").hide();
	$(".photo_box01 img:eq("+n+")").show();/*显示第N*/
	$(".photo_box01 a").removeClass("current");/*拆掉当前a样式*/
	$(this).addClass("current");/*加载点击的a样式*/
	})
/*自动播放*/
function changeN(){
	if(n<$(".photo_box01 img").length-1){
	n=n+1;
	}
	else{
	n=0;
		}
	$(".photo_box01 img").hide();
	$(".photo_box01 img:eq("+n+")").show();
	$(".photo_box01 a").removeClass("current");
	$(".photo_box01 a:eq("+n+")").addClass("current");
	}
var timer = setInterval(changeN,1000);
/*控制*/

$(".photo_box01 a").hover(function(){       
	clearInterval(timer);
	},function(){
		timer = setInterval(changeN,3000);
		})
/*鼠标移动到框里时，图片暂停播放*/
	$(".photo_box01").hover(function(){
		clearInterval(timer)
		/*鼠标停留在banner上面，状态停止*/
		},function(){
		timer = setInterval(changeN,3000)	
			})
		/*鼠标移开，状态继续*		
/*大banner自动播放，点击显示，鼠标停留时停止播放*/	



</script>
</html>
