<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
    String article = (String) request.getAttribute("article");
	request.setAttribute("article", article);
	String day = (String) request.getAttribute("day");
	request.setAttribute("day", day);
	String content = (String) request.getAttribute("content");
	request.setAttribute("content", content);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>记录你的足迹</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 添加图片 -->
<link rel="stylesheet" href="css/footprint/zyUpload.css" type="text/css">
<script src="js/footprint/jquery.min.js"></script>
<!-- 引用核心层插件 -->
<script src="js/footprint/zyFile.js"></script>
<!-- 引用控制层插件 -->
<script src="js/footprint/zyUpload.js"></script>
<!-- 引用初始化JS -->
<script src="js/footprint/script.js"></script>


<link rel="stylesheet" type="text/css" href="css/footprint/foot.css">
<script type="text/javascript" src="js/footprint/extend.js"></script>
<script type="text/javascript" src="js/footprint/footchangenode.js"></script>
<link rel="stylesheet" type="text/css" href="css/footprint/foot_image.css" />

<!-- script src="js/footprint/jquery-1.4.2.js" type="text/javascript"></script-->
<script src="js/footprint/uploadmessage.js" type="text/javascript"></script>
<script type="text/javascript">
	function display() {
		document.getElementById("main_box_image").style.display = "block";
	}

	function btn_close() {
		document.getElementById("main_box_image").style.display = "none";
	}

	/*
	
	function bindunbeforunload(){
	   window.onbeforeunload=perforresult;
	   //window.onbeforeunload 表示.用户关闭浏览器或者是当前网页前执行的操作.或者刷新当前页面时
	}
	function perforresult(){
	   //当页面关闭时操作的内容
	   killArticleId(null,null);
	}
	

			//用来执行关闭页面后消除ac  session
			function killArticleId(name, value) {
				var json = {
					name : name,
					value : value,
				}
				///outdoors/article.do?method=killArticle
				$.post($("#killArticle").val(), json, function(data,
						textStatus) {
				}, "xml");
			}
	 */
</script>

<link rel="stylesheet" type="text/css" href="css/footprint/foot_date.css">
<script type="text/javascript" src="js/footprint/foot_date.js"></script>
<script type="text/javascript">
	var dCurDate = new Date(); //日期对象
	fDrawCal(dCurDate.getFullYear(), dCurDate.getMonth() + 1, 30, 30, "12px","bold", 1); //函数调用，传值。getMonth返回的是0到11之间的整数
	/*var two = document.getElementById("table_two");
	two.style.marginTop = "0px";
	two.style.marginLeft = "150px";*/
</script>
<link rel="stylesheet" type="text/css" href="css/footprint/foot_content.css">
<style type="text/css">
.timeZhu {
	outline: 0;
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px
		rgba(82, 168, 236, 0.6);
	border-color: rgba(82, 168, 236, 0.8);
	background-color: #fff;
	border: solid 1px #a0b3d6;
	width: 754px;
	min-height: 148px;
	margin-bottom: 5px;
	text-align: left;
}

#left_node1 {
	background-image: url(images/footprint/15399.jpg);
	width: 100px;
	height: 279px;
	background-repeat: no-repeat;
	margin-left: 87px;
	position: relative;
	margin-top: 5px;
}

#left_node2 {
	background-image: url(images/footprint/1712.jpg);
	width: 6px;
	height: 58px;
	margin-left: 96px;
	position: relative;
}

#left_node3 {
	background-image: url(images/footprint/43878.jpg);
	width: 100px;
	height: 302px;
	background-repeat: no-repeat;
	margin-left: 74px;
	position: relative;
}

#timeHeignt1 {
	background-image: url(images/footprint/53805.jpg);
	width: 6px;
	height: 213px;
	margin-left: 95px;
}

#navigation {
	
}

body {
	margin-left: auto;
	margin-right: auto;
	margin-top: 0px;
	margin-bottom: 0px;
	background-color: #F2F2F2;
	touch-action: none;
	left: auto;
	width: 1200px;
	text-align: center;
	position: relative;
	overflow-x: hidden;
	padding: 0px;
}

<!-- foot.css -->


<!-- foot_content.css -->
.del{
	display:none;

	margin-right:0px;
	float:right;
	position:absolute;
	background-image:url(images/footprint/434878.jpg);
	height:40px;
	width:40px;
	
	
}
</style>
</head>

<body>

	<!--导航栏 -->
	<div class="top">
		<div class="lo">
			<img src="images/logo.png" />
		</div>

		<div id="nav">
			<ul>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">我的空间
					<div class="list">
						<a href="myspace.jsp">我的空间</a><br /> 
						<a href="myspace/personalcenter.jsp">个人中心</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">我的足迹
					<div class="list">
						<a href="ArticleServlet?method=articleList">我的足迹</a><br /> <a
							href="ArticleServlet?method=inArticle">发表足迹</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">活动中心
					<div class="list">
						<a href="myspace/myactivity.jsp">我的活动</a><br /> <a
							href="myspace/organizeactivity.jsp">发起活动</a><br /> <a
							href="myspace/activityjoined.jsp">活动报名</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">OutDoor论坛
					<div class="list1">
						<a href="myspace/myforum.jsp">我的论坛</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="list2">
			<a href="main.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a><span>&nbsp;|&nbsp;</span><a
				href="ExitServlet">退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</div>


		<!-- 主体 -->
	<input type="hidden" id="url" value="/outdoors">
	<input type="hidden" id="sendMessageAddress" value="/outdoors/ArticleServlet?method=addMessage" />
	<input type="hidden" id="showTypeAddress" value="/outdoors/ArticleServlet?method=showType" />
	<input type="hidden" id="showLittleTypeAddress" value="/outdoors/ArticleServlet?method=showLittleType" />
	<input type="hidden" id="sendPreface" value="/outdoors/ArticleServlet?method=addPreface" />
	<input type="hidden" id="sendContent" value="/outdoors/ArticleServlet?method=addContent" />
	<input type="hidden" id="delContent" value="/outdoors/ArticleServlet?method=delContent" />
	<input type="hidden" id="delDay" value="/outdoors/ArticleServlet?method=delDay" />
	<input type="hidden" id="killArticle" value="/outdoors/ArticleServlet?method=killArticle" />
	<!-- 用来标志是否是从编辑接口进入的游记界面 -->
	<input type="hidden" id="submit" value="/outdoors/ArticleServlet?method=submit&update=${update}" />
	<input type="hidden" id="bigType" value="${bigType }" />
	<input type="hidden" id="userId" value="${user.userId }"/>


<!-- <div>
		<form action="ArticleServlet?method=inArticle" method="post"> -->	
			<!--主体部分-->

			<div id="main_box">
				<!-- <form style="margin-bottom:50px;">-->
				<div id="ifoot_one">
					<div id="img_node1">
						<img src="${basePath}${left.headPortrait }"
							style="border-radius:50%;" width="100px" height="100px">
					</div>
					<div id="name_box">
						<p
							style="text-align:left;font-size:24px;font-family:microsoft yahei;margin-top:0px;color:gray;">为你珍贵的足迹取一个好听的名字吧</p>
						<p id="name_p">
							<input onblur="footNameExtend()" id="footName" type="text"
								name="name" value="${article.name }"
								style="height:36px;width:380px;font-size:24px;font-family:microsoft yahei;" />
						</p>
					</div>
				</div>

				<div id="time_node">
					<div id="pre_node">
						<img src="images/footprint/xuyan.jpg">
					</div>
					<div id="left_node1"></div>
					<div id="left_node2"></div>
					<div id="left_node3"></div>
					<div id="timeHeignt1"></div>
					<div
						style=" margin-left:73px;height:50px; width:50px;background-repeat: no-repeat; margin-top:0px;">
						<img src="images/footprint/jiajia.png" width="33px" height="33px;"
							onclick="creatnode()" />
					</div>
				</div>

				<!--主体中有部分-->
				<div id="pre_language">
					<p style="font-family:microsoft yahei;font-size:20px;text-align:left;color:gray;">OutDoor，专属你的旅行，让你有一个好心情</p>
				</div>
				<div id="diary_write">
					<table style="margin-top:5px;" id="table_info">
						 <tr  style=""height="40px;">
                            <td id="w_td"><img src="images/footprint/clock.jpg"></td>
                            <td>时间</td>
                            <td style=" ">
                	            <div style="position:absolute; top:224px;">
                	            <input  id="asdf" type="text" value="<fmt:formatDate value="${article.goTime }" pattern="yyyy-MM-dd" />" name="goTime" readonly = "readonly" />
                	            </div>
                	            <div style="position:relative;"onclick="showdate()"><img src="images/footprint/date.gif"  height="30px;" style="margin-left:262px; margin-bottom:4px;"/></div>
                            </td>
                        </tr>
						<tr>
							<td id="w_td"><img src="images/footprint/leixing.JPG"></td>
							<td>地点</td>
							<td><input onblur="footPLaceExtend()" id="footPlace"
								type="text" value="${article.place }" name="place" /></td>
						</tr>
						<tr>
							<td id="w_td"><img src="images/footprint/person.JPG">
							</td>
							<td>人数</td>
							<td><input onblur="peopleExtend()" id="people" type="text"
								value="${article.people }" name="people" /></td>
						</tr>
						<tr>
							<td id="w_td"><img src="images/footprint/money.JPG">
							</td>
							<td>花费</td>
							<td><input onblur="expenseExtend(this)" id="expense"
								type="text" value="${article.money }" name="money" /></td>
						</tr>
						 <tr>
                <td id="w_td"><img src="images/footprint/leixing.JPG"></td>
                <td>户外类型</td>
                <td>
                    <select id="selId" name="bigId" onchange="selectType(this)">
                        <option>选择户外项目</option>
                        <c:if test="${article.bigId!=null }">
                        	<c:forEach var="big" items="${bigType }">
                        		<option value="${big.id }"
                        			<c:if test="${big.id==article.bigId }">selected</c:if>
                        		>${big.name }
                        		</option>
                        	
                        	</c:forEach>
                        </c:if>
                    	<!-- 
                        <option>水面运动及航海</option>
                        <option>陆地运动及单车运动</option>
                        <option>山地运动及地下运动</option>
                        <option>野营活动及猎捕</option>
                        <option>机动车船及航空运动</option>
                         -->
                    </select>
                    <select id="SubSelid" name="littleId" onchange="printTypeExtend(this)">
                        <option>选择类型</option>
                        <c:if test="${article.littleId!=null }">
                        	<c:forEach var="little" items="${littleType }">
                        		<option value="${little.littleId }"
                        			<c:if test="${little.littleId==article.littleId }">selected</c:if>
                        		>${little.name }</option>
                        	</c:forEach>
                        </c:if>
									<!-- 
                        <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                         -->
							</select></td>
						</tr>
					</table>
				</div>
				<div id="date_box" style="visibility:hidden">
					<form name="frmCalendarSample" method="post" action="">
						<input type="hidden" name="calSelectedDate" value="" />

						<table id="table_one">
							<tr>
								<td id="td_one"><select id="first_month" name="tbSelMonth"
									onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>
										<option value="1">一月</option>
										<option value="2">二月</option>
										<option value="3">三月</option>
										<option value="4">四月</option>
										<option value="5">五月</option>
										<option value="6">六月</option>
										<option value="7">七月</option>
										<option value="8">八月</option>
										<option value="9">九月</option>
										<option value="10">十月</option>
										<option value="11">十一月</option>
										<option value="12">十二月</option>
								</select>
								</td>
								<td id="td_two"><select id="second_year" name="tbSelYear"
									onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
								</select>
								</td>
							</tr>
						</table>
					</form>
				</div>


				<!-- </form> -->
				<div id="idea_travel">
					<div id="share_box" style="height:50px;">
						<p id="share">这次户外运动带给你什么收获呢？和我们分享一下吧-${update }-</p>
					</div>
				</div>

				<div class="get_write">
					<div id="describe" class="timeZhu"
						onkeyup="showDescribeTimeZhu(this)" onblur="sendArticlePreface()"
						contenteditable="true">${article.preface }</div>
				</div>
				<div id="travel_write">
					<div id="process">记录你的每一次户外旅行</div>
				</div>

				<!--天数节点-->
				<div id="aday" onkeyup="showTimeZhu1(this)">
					<div id="days_one">
						<div id="daysone" style="height:50px;">
							<p id="one_p" style="color:black;font-size:24px;">
								Day1&nbsp;&nbsp;&nbsp; <label id="get_time"></label>
							</p>
						</div>
					</div>
					<div id="daysone_write">
						<div id="foot_write">
							<!-- <img src="${pageContext.request.contextPath}/article/images/主页/3lisen.jpg" />
                   -->
							<div class="timeZhu" onblur="sendPreface(this)"
								contenteditable="true">${article.day[0].preface }</div>
							<input type="hidden" value="1"></input>
						</div>
						<div class="img_upload_day1" style="text-align:right;">
							<input onclick="display()" class="img_upload2" type="button"
								name="img" value="+上传照片" />
						</div>
					</div>
					<c:if test="${article.day[0].content[0]!=null }">
						<div id="daysone_image" class="daysone_image">
							<c:forEach var="content" items="${article.day[0].content }">

								<div class="imageItem" onmouseover="showDel(this)"
									onmouseout="disappearDel(this)">
									<div class="del" onclick="delContent1(this)"></div>
									<input type="hidden" class="dayId" value="${content.dayId }" />
									<input type="hidden" class="contentId"
										value="${content.contentId }" />
									<div class="footImage">
										<img class="imageSRC"
											src="${articleImageUri }${articleId}/${content.dayId}/${content.imageName}">
									</div>
									<div onkeyup="showText(this)" onmousemove="disappearText(this)"
										onmouseout="showText(this)" class="footImageText">
										<c:if test="${content.content==null }">
											<p>为图片添加说明...</p>
										</c:if>
										<div onkeydown="showTextNum(this)" onblur="sendContent(this)"
											class="imageDescriptionBox" contenteditable="true">${content.content}</div>
										<div style="height: 20px;text-align: right;">0/200</div>
										<input type="hidden" value="${content.imageName}"
											name="imageName">
									</div>
								</div>

							</c:forEach>
						</div>
					</c:if>
				</div>



	             <div id="newnodes">
					<c:if test="${article.dayCount>1 }">
						<c:forEach var="day" begin="1" items="${article.day }">
							<div class="daynode" onkeyup="showTimeZhu2(this)">
								<div class="time_node2">
									<img onclick="jiantian(this)" class="jianjianode" src="images/footprint/jianjian.png"> <input class="1" type="hidden" value="${day.dayId }">
									<div class="timelizhu"></div>
									<img onclick="creatnode()" class="jianjianode"
										src="images/footprint/jiajia.png">
								</div>
								<div class="days_two">
									<div class="daystwo">
										<p class="two_p">Day${day.dayId }</p>
									</div>
								</div>
								<div class="daystwo_write">
									<div class="foot_write">
										<div class="timeZhu" onblur="sendPreface(this)"
											contenteditable="true" style="margin-left: 198px;">
											${day.preface }</div>
										<input type="hidden" value="${day.dayId }"></input>
									</div>
									<div class="img_upload_day2">
										<input onclick="clickImage(this)" class="img_upload2" type="button" value="+上传照片">
										<input class="1" type="hidden" value="${day.dayId }">
									</div>
								</div>
								<c:if test="${day.content[0].imageName!=null }">
									<div id="daystwo_image" class="daystwo_image"
										name="daystwo_image">
										<c:forEach var="content" items="${day.content }">
											<div class="imageItem" onmouseover="showDel(this)"
												onmouseout="disappearDel(this)">
												<div class="del" onclick="delContent2(this)"></div>
												<input type="hidden" class="dayId" value="${content.dayId }" />
												<input type="hidden" class="contentId"
													value="${content.contentId }" />
												<div class="footImage">
													<img class="imageSRC"
														src="${articleImageUri }${articleId}/${content.dayId}/${content.imageName}">
												</div>
												<div onkeyup="showText(this)"
													onmousemove="disappearText(this)"
													onmouseout="showText(this)" class="footImageText">
													<c:if test="${content.content==null }">
														<p>为图片添加说明...</p>
													</c:if>
													<div onkeydown="showTextNum(this)"
														onblur="sendContent(this)" class="imageDescriptionBox"
														contenteditable="true">${content.content}</div>
													<div style="height: 20px;text-align: right;">0/200</div>
													<input type="hidden" value="${content.imageName}"
														name="imageName">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div id="submit_box" style="margin-bottom: 200px;">
					<input onclick="submit()" id="submit_btn" type="button"
						name="add_btn" value="提交足迹">
				</div>
			</div>


			<div id="main_box_image" class="css_main_box">
				<input type="hidden" id="imagePostUrl"
					value="ArticleServlet?method=addImage&dayId=1"> <input
					type="hidden" id="dayCount" value="0" />
				<div id="demo" class="demo" style="margin: auto;"></div>
			</div>
<!-- </form>
	</div>
 -->		
	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
</body>
</html>
