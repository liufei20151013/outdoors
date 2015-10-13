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
<title>露营天地</title>	
<script src="js/js.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/button.js"></script>
<style tydive="text/css">
   *{margin:0;padding:0;font-family="微软雅黑";}
	body{width:1200px;height:2065px;margin:0 auto;background:url("images/bg5.png") no-repeat center top;}
	.top{background:#383838;width:1200px;height:50px;position:relative;}
	ul{list-style:none;width:750px;height:50px;margin-left:225px;;float:left;}
	li{float:left;text-align:center;}
	a{text-decoration:none;color:white;display:block;width:150px;line-height:50px;}
	li a:hover{background:#999;}
	.main{width:1050px;height:1000px;margin:50px auto;}
	.box{width:500px;height:350px;overflow:hidden;margin-top:20px;float:left;}
	.box1{float:right;}
	.rot{width:500px;height:700px;}
	.cap{transform:rotate(180deg);-webkit-transform:rotate(180deg);position:relative;}
	.im{width:200px;height:40px;position:absolute;bottom:20px;left:150px;}
	.im a{float:left;display:block;width:95px;height:40px;}
	.im .bao,.im .bao1{float:right;width:95px;height:40px;}
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
   .btn .current{background-image:url(images/ctrl_01.png);} 
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
       		 <img src="images/q7.png"/>
       		 <div class="cap">
       		 	<img src="images/q77.png"/>
       		 	<div class="im">
       		 		<a href="walk3/1.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/q8.png"/>
       		 <div class="cap">
       		 	<img src="images/q88.png"/>
       		 	<div class="im">
       		 		<a href="walk3/2.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/q9.png"/>
       		 <div class="cap">
       		 	<img src="images/q99.png"/>
       		 	<div class="im">
       		 		<a href="walk3/3.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/qa.png"/>
       		 <div class="cap">
       		 	<img src="images/qaa.png"/>
       		 	<div class="im">
       		 		<a href="walk3/4.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/qw.png"/>
       		 <div class="cap">
       		 	<img src="images/qww.png"/>
       		 	<div class="im">
       		 		<a href="walk3/5.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao1"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/qz.png"/>
       		 <div class="cap">
       		 	<img src="images/qzz.png"/>
       		 	<div class="im">
       		 		<a href="walk3/6.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao1"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box">
       	<div class="rot">
       		 <img src="images/v.png"/>
       		 <div class="cap">
       		 	<img src="images/vv.png"/>
       		 	<div class="im">
       		 		<a href="walk3/7.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao1"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
       	
       	<div class="box box1">
       	<div class="rot">
       		 <img src="images/z.png"/>
       		 <div class="cap">
       		 	<img src="images/zz.png"/>
       		 	<div class="im">
       		 		<a href="walk3/8.jsp"><img src="images/jie.png"/></a>
       		 		<div class="bao1"><a href="camplist.jsp"><img src="images/bao.png"/></a></div>
       		 		</div>
       		 	</div>
       		</div>       	
       	</div>
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
