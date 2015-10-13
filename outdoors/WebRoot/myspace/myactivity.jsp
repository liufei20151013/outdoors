<%@ page language="java" import="java.util.*,com.wipe.entity.Activity,com.wipe.biz.ActivityBiz,com.wipe.dao.ActivityDao" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>我发起的活动列表</title>
<link rel="stylesheet" type="text/css" href="css/footprint/myListMessage.css">
<script src="js/footprint/jquery.min.js"></script>
<style type="text/css">
*{margin:0px; padding:0px;}
</style>
<script type="text/javascript">
    function gotopage(currentpage){
    	location = "ActivityServlet?method=messageList&currentpage=" + currentpage ;
    }
    	
	//删除发布的活动
	function deleteMessage(node){
		if(confirm("确定要删除该活动？"))
		var messageId=node.name;
		
		//操作页面
		var footPrintListBox=document.getElementById("footPrintListBox");
		footPrintListBox.removeChild(node.parentNode.parentNode);
		
		//操作数据库
		send(null,messageId);
		
	}
	
	//利用Ajax异步发送信息
	function send(name,value){
		var json={
			name:name,
			value:value,
		};
		//${pageContext.request.contextPath }/common/message.do?method=deleteMessage
		$.post($("#deleteMessage").val(),json,function(data,textStatus){
		},"xml");
	}
    </script>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Activity> list = new ArrayList<Activity>();
		Activity a = new Activity();
		list = (List<Activity>) request.getAttribute("list");
		
	%>
	<input id="deleteMessage" type="hidden" value="ActivityServlet?method=deleteMessage">
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
						<a href="myspace/myfootprint.jsp">我的足迹</a><br /> <a
							href="ArticleServlet?method=inArticle">发表足迹</a><br />
					</div>
				</li>
				<li class="menu2" onMouseOver="this.className='menu1'"
					onMouseOut="this.className='menu2'">活动中心
					<div class="list">
						<a href="ActivityServlet?method=messageList">我的活动</a><br /> <a
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
			<a href="main.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a><span>&nbsp;|&nbsp;</span><a
				href="ExitServlet">退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</div>
	

	<c:if test="${a==0 }">
			<div class="noticeBox">
				<img src="images/common/051.jpg" />
				<p>还没有发表活动~</p>
			</div>
		</c:if>
		<c:if test="${a!=0 }">
	<div class="footPrintListBox" id="footPrintListBox">
		<c:forEach var="a" items="${list }">
        <div class="footPrintDisplay">
            <div class="footPrintNameOperation"><span>${a.name }</span><button onclick="deleteMessage(this)" name="${a.activityId }" id="deleteFootPrint">删除</button></div>
            <div class="footPrintInfomation">
            	<c:if test="${a.image==null }">
            		<img src="images/common/051.jpg""/>
            	</c:if>
            	<c:if test="${a.image!=null }">
            		<img src="${imageUri }${a.activityId }/${a.image[0]}"/>
            	</c:if>
            </div>
            <div class="footPrintDate">
               <span>发起日期：<fmt:formatDate value="${a.writeTime }" pattern="yyyy-MM-dd" /></span>
            </div>
        </div>
        </c:forEach>
       
    </div>
	<!--底部 -->
	<div class="foot">
		<h2>Copyright@武汉体育学院</h2>
		<h2>武汉市洪山区珞瑜路461号</h2>
	</div>
	</c:if>
</body>
</html>