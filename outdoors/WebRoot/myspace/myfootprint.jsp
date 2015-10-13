<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的足迹</title>
<link rel="stylesheet" type="text/css" href="css/footprint/articleList.css">
<script src="js/footprint/jquery.min.js"></script>
<style type="text/css">
.noticeBox {
	width: 40%;
	height: 300px;
	margin-left: 280px;
	margin-right: auto;
	margin-top: 15%;
	margin-bottom: 200px;
}

.noticeBox img {
	width: 200px;
	height: 200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.noticeBox p {
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 20px;
}
</style>
<script type="text/javascript">
//删除游记
function deleteArticle(articleId){
	//操作页面
	var article=document.getElementById(articleId);
	article.parentNode.removeChild(article);
	
	//操作数据库
	send(null,articleId);
	
}

//利用Ajax异步发送信息
function send(name,value){
	var json={
		name:name,
		value:value,
	};
	//${pageContext.request.contextPath }/article.do?method=deleteArticle
	$.post($("#deleteArticle").val(),json,function(data,textStatus){
	},"xml");
}

//页面完全加载后运行的函数
window.onload=function(){
	deleteLastZhu();
};

//删除最后一个时间柱
function deleteLastZhu(){
	var timeZhu=document.getElementsByName("timeZhu");
	timeZhu[timeZhu.length-1].style.display='none';
}

//修改游记
function changeArticle(articleId){
	//${pageContext.request.contextPath }/article.do?method=changeArticle
	var address=$("#changeArticle").val()+"&articleId="+articleId;
	location.href=address;
}
</script>
</head>
<body>
	<input id="deleteArticle" type="hidden" value="ArticleServlet?method=deleteArticle">
	<input id="deleteMessage" type="hidden" value="ArticleServlet?method=deleteMessage">
	<input id="changeArticle" type="hidden" value="ArticleServlet?method=changeArticle">
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


<!-- 主体部分 -->
	<div class="center">
		<div class="content">
			<c:if test="${articleCount==0 }">
				<div class="noticeBox">
					<img src="images/common/051.jpg" />
					<p>还没有发表足迹~</p>
				</div>
			</c:if>
			<c:if test="${articleCount!=0 }">
				<div class="tubiao">
					<img alt="" src="images/footprint/foottubiao.png">
				</div>
			</c:if>

			<!--  
			<div class="article">
				<div class="date">2015/05/03</div>
				<div class="articletubiao">
					<div><img style="height: 16px;width: 4px;margin-left: 16px;" alt="" src="${pageContext.request.contextPath }/article/images/articleList/lizhu.png"></div>
					<img alt="" src="${pageContext.request.contextPath }/article/images/articleList/foottubiao.png">
					<div><img style="height: 555px;width: 4px;margin-left: 16px;" alt="" src="${pageContext.request.contextPath }/article/images/articleList/lizhu.png"></div>
				</div>
				<div class="articleContent">
					<div class="inArticleContent">
						<div>他发表了游记</div>
						<div class="articleName"><span>游记的名字</span></div>
						<div class="articleMessage"><span>游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容游记的内容</span></div>
						<div><img style="height: 380px;width: 620px;" alt="" src="${pageContext.request.contextPath }/article/images/articleList/hello.jpg"></div>
						<div class="footPrintDate">
							<span>2015/4/21</span><span>出发</span>
							<sapn>&nbsp;|&nbsp;共6天</sapn>
							<sapn>&nbsp;|&nbsp;23图</sapn>
						</div>
					</div>
				</div>
			</div>
			-->


			<c:forEach var="article" items="${articleList }">
				<div id="${article.articleId }" class="article">

					<div class="date">
						<fmt:formatDate value="${article.writeTime }" pattern="yyyy-MM-dd" />
					</div> 

					<div class="articletubiao">
						<div>
							<img style="height: 16px;width: 4px;margin-left: 16px;" alt=""
								src="images/common/lizhu.png">
						</div>
						<img alt=""
							src="images/footprint/foottubiao.png">
						<div name="timeZhu">
							<img style="height: 556px;width: 4px;margin-left: 16px;" alt=""
								src="images/common/lizhu.png">
						</div>
					</div>
					<div class="articleContent">
						<div class="inArticleContent">
							<!-- <div>
								
								<c:if test="${article.flag==0 }">游记正在审核中</c:if>
								<c:if test="${article.flag==1 }">游记已发表</c:if>
								<c:if test="${article.flag==2 }">游记未通过审核</c:if>
								<c:if test="${article.flag==3 }">我正在写游记</c:if>
								
							</div> -->
							<div class="articleName">
								<span> <c:if test="${article.name==null }">
								尚未添加标题
							</c:if> <c:if test="${!article.name }">
								${article.name }
							</c:if> </span>
								<div class="button">
									<button onclick="changeArticle('${article.articleId}')"
										id="editFootPrint">编辑</button>
									<button id="deleteFootPrint"
										onclick="deleteArticle('${article.articleId}')">删除</button>
								</div>
							</div>
							<div class="articleMessage">
								<span> <c:if test="${article.preface==null }">
								尚未添加描述
							</c:if> <c:if test="${!article.preface }">
								${article.preface }
							</c:if> </span>
							</div>
							<div>
								<a href="ArticleServlet?method=toArticle&articleId=${article.articleId }">
									<c:if test="${article.bgImageName==null }">
										<img id="background" style="height: 380px;width: 620px;"
											src="${defaultImage }" />
									</c:if> <c:if test="${article.bgImageName!=null }">
										<img id="background" style="height: 380px;width: 620px;"
											src="${articleUri }${article.articleId}/${article.bgImageName }" />
									</c:if> </a>
							</div>
							<div class="footPrintDate">
								<span> <c:if test="${article.goTime!=null }">
										<fmt:formatDate value="${article.goTime }"
											pattern="yyyy-MM-dd" />
									</c:if> <c:if test="${article.goTime==null }">
										<fmt:formatDate value="${article.writeTime }"
											pattern="yyyy-MM-dd" />
									</c:if> </span> <span>出发</span>
								<span>&nbsp;|&nbsp;共${article.dayCount }天</span>
								<span>&nbsp;|&nbsp;${article.imageCount }张图</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>




		</div>

	</div>


	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
</body>
</html>