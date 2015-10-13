<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	String left = (String) request.getAttribute("left");
	request.setAttribute("left", left);
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>${left.nickName }的空间 </title>
<link rel="stylesheet" type="text/css" href="css/center/space.css">
<!-- 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/frontdesk/space/space.js"></script>
 -->
</head>
<style>
.userInformationBox{
	width:100%;
	height:200px;
	background:url(images/common/head_bg1.jpg) 0 0 no-repeat;
	position:relative;
}
</style>
<script type="text/javascript">
//iframe高度自适应
 	function IFrameReSize(){
 		var pTar = document.getElementById("friendExposeFootPrint");
 		if (pTar) {  
 			//ff　　
 			if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
 				pTar.height = pTar.contentDocument.body.offsetHeight;
 			} 
 			//ie　　
 			else if (pTar.Document && pTar.Document.body.scrollHeight) {
 				pTar.height = pTar.Document.body.scrollHeight;
 			}
  }
 	}
</script>
<body>
  <div class="UserSpaceBigBox">
		<div class="userInformationBox">
			<div class="simpleInfo">
				<div class="yourImage">
					<a href="myspace.jsp"><img src="${basePath}${left.headPortrait }" /></a>
				</div>
				<div class="friendInformation">
					<div class="userNickName">${left.nickName }</div>
					<c:if test="${flag=='关注' }">
						<div class="addCareBox">
							<a href="#">+关注</a>
						</div>
					</c:if>
					<c:if test="${flag=='已关注' }">
						<div class="addCareBox">
							<a href="#">已关注</a>
						</div>
					</c:if>
				</div>
             <div class="countActiveFootFriendFans">
                <div class="friendCount"><a href="PersonalCenterServlet?method=friendlist&userId=${user.userId }" target="friendExposeFootPrint">${left.friendCount }</a><br/><span>关注</span></div>
	            <div class="fansCount"><a href="PersonalCenterServlet?method=fanslist&userId=${user.userId }" target="friendExposeFootPrint">${left.fansCount}</a><br/><span>粉丝</span></div>
                <div class="articleCount"><a href="PersonalCenterServlet?method=articlelist&userId=${user.userId }" target="friendExposeFootPrint">${left.articleCount }</a><br/><span>足迹</span></div>
	            <div class="activityCount"><a href="PersonalCenterServlet?method=activitylist&userId=${user.userId }" target="friendExposeFootPrint">${left.activityCount }</a><br/><span>活动</span></div> 
             </div>
          </div>
       </div>
   </div>
  
  		<iframe
		src="PersonalCenterServlet?method=friendlist&userId=${user.userId }"
		scrolling="no" frameborder="0" height="" id="friendExposeFootPrint"
		name="friendExposeFootPrint" width="100%" onload="IFrameReSize()"></iframe>

</body>


</html>
