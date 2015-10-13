<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息显示列表</title>
<link rel="stylesheet" type="text/css" href="css/footprint/articleList.css">
<script src="js/footprint/jquery.min.js"></script>
<!-- 
<script src="js/footprint/jquery.min.js"></script>
 -->
<style type="text/css">

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
	}
	//ArticleServlet?method=deleteArticle
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
			<c:if test="${articleListCount==0 }">
			<div class="noticeBox">
				<img src="images/common/051.jpg" />
				<p>TA还没有发表足迹噢~</p>
			</div>
			</c:if>
	<div class="center">
		<div class="content">
			<c:if test="${articleListCount!=0 }">
			<div class="tubiao">
				<img alt="" src="images/common/foot.jpg">
			</div>
			</c:if>
			
			<c:forEach var="article" items="${articleList }">
			<c:if test="${article.flag==1 }">
			<div id="${article.id }" class="article">
				<div class="date"><fmt:formatDate value="${article.writeTime }" pattern="yyyy-MM-dd" /></div>
				<div class="articletubiao">
					<div><img style="height: 16px;width: 4px;margin-left: 16px;" alt="" src="images/common/lizhu.png"></div>
					<img alt="" src="images/common/foot.jpg">
					<div name="timeZhu"><img style="height: 556px;width: 4px;margin-left: 16px;" alt="" src="images/common/lizhu.png"></div>
				</div>
				<div class="articleContent">
					<div class="inArticleContent">
						<div>
							游记已发表
						</div>
						<div class="articleName">
							<span>
							<c:if test="${article.name==null }">
								尚未添加标题
							</c:if>
							<c:if test="${!article.name }">
								${article.name }
							</c:if>
							</span>
							<div class="button"></div>
						</div>
						<div class="articleMessage">
							<span>
							<c:if test="${article.preface==null }">
								尚未添加描述
							</c:if>
							<c:if test="${!article.preface }">
								${article.preface }
							</c:if>
							
							</span>
						</div>
						<div>
						<a href="${pageContext.request.contextPath }/space.do?method=toArticle&articleId=${article.id }" target='_parent'>
						
						<c:if test="${article.bgImageName==null }">
			       		<img id="background"  style="height: 380px;width: 620px;" src="${defaultImage }"/>
			       		</c:if>
			       		<c:if test="${article.bgImageName!=null }">
			       		<img id="background"  style="height: 380px;width: 620px;" src="${articleUri }${article.id}/${article.bgImageName }"/>
			       		</c:if>
						
						</a>
						</div>
						<div class="footPrintDate">
							<span>
							<c:if test="${article.goTime!=null }">
							<fmt:formatDate value="${article.goTime }" pattern="yyyy-MM-dd" />
							</c:if>
							<c:if test="${article.goTime==null }">
							<fmt:formatDate value="${article.writeTime }" pattern="yyyy-MM-dd" />
							</c:if>
							</span>
							<span>出发</span>
							<sapn>&nbsp;|&nbsp;共${article.dayCount }天</sapn>
							<sapn>&nbsp;|&nbsp;${article.imageCount }图</sapn>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			</c:forEach>

			
			
			
		</div>
		
	</div>
	
	
	<iframe src="${pageContext.request.contextPath }/common/customerCenter.do?method=foot" width="100%" height="101px" frameborder="0"> 
	</iframe>
</body>
</html>