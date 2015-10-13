<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息显示列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/frontdesk/space/myListMessage.css">
<script src="${pageContext.request.contextPath}/article/addArticleImage/js/jquery.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
    function gotopage(currentpage){
    	location = "${pageContext.request.contextPath }/space.do?method=messageList&currentpage=" + currentpage+"&customerId=${customerId}" ;
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
		<c:if test="${messageCount==0 }">
			<div class="noticeBox">
				<img src="${pageContext.request.contextPath }/images/frontdesk/space/051.jpg" />
				<p>TA还没有发表活动噢~</p>
			</div>
		</c:if>
		<c:if test="${messageCount!=0 }">
	<div class="footPrintListBox" id="footPrintListBox">
		<c:forEach var="message" items="${pageBean.list }">
        <div class="footPrintDisplay">
            <div class="footPrintNameOperation"><span>${message.name }</span></div>
            <div class="footPrintInfomation">
            	<c:if test="${message.image==null }">
            		<img src="${imageUri }default.jpg"/>
            	</c:if>
            	<c:if test="${message.image!=null }">
            		<img src="${imageUri }${message.id}/${message.image[0]}"/>
            	</c:if>
            </div>
            <div class="footPrintDate">
               <span>发起日期：<fmt:formatDate value="${message.writeTime }" pattern="yyyy-MM-dd" /></span>
            </div>
        </div>
        </c:forEach>
        
        <div style="font-size: 18px;float: right;margin-bottom: 40px;">
			总记录数:${pageBean.totalrecord } &nbsp;&nbsp; 
			总页数:${pageBean.totalpage } &nbsp;&nbsp; 当前页:${pageBean.currentpage }
			&nbsp;&nbsp; <a href="javascript:void(0)"
				onClick="gotopage(${pageBean.previouspage })">上一页</a>

			<c:forEach var="pagenum" items="${pageBean.pagebar}">
				<c:if test="${pageBean.currentpage==pagenum}">
					<font color="red">${pagenum }</font>
				</c:if>
				<c:if test="${pageBean.currentpage!=pagenum}">
					<a href="javascript:void(0)" onClick="gotopage(${pagenum })">${pagenum
						}</a>
				</c:if>
			</c:forEach>

			<a href="javascript:void(0)"
				onClick="gotopage(${pageBean.nextpage })">下一页</a>
		</div>
    </div>
	<iframe src="${pageContext.request.contextPath }/common/customerCenter.do?method=foot" width="100%" height="101px" frameborder="0"> 

	</iframe>
    </c:if>
</body>
</html>