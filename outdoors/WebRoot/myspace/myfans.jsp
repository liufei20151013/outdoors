<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的粉丝</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/frontdesk/space/friendList.css">
<script src="${pageContext.request.contextPath}/article/addArticleImage/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/frontdesk/space/fanceList.js"></script>
<!-- 
<script src="${pageContext.request.contextPath}/article/addArticleImage/js/jquery.min.js"></script>
 -->
<style type="text/css">
</style>
<script type="text/javascript">
    function gotopage(currentpage){
    	location = "${pageContext.request.contextPath}/space.do?method=fanceList&currentpage=" + currentpage+"&customerId=${customerId}";
    	
    }
    

</script>
<script src="${pageContext.request.contextPath}/js/frontdesk/space/fanceList.js"></script>
</head>
<body>
	<input id="addFriend" type="hidden" value="${pageContext.request.contextPath}/customer/friend.do?method=addFriend">
   <div class="friendExposeFriendBox">
       <div class="firstFriend">TA的粉丝</div>
       <c:if test="${fanceCount==0 }">
			<div class="noticeBox">
				<img src="${pageContext.request.contextPath }/images/frontdesk/space/051.jpg" />
				<p>TA还没有粉丝噢~</p>
			</div>
		</c:if>
       <div class="exposeFriendInformation">
           <ul>
           	<c:forEach var="customer" items="${map }">
              <li>
                 <div class="friendSimpleInfoLi">
                   <div class="friendImage">
                   <a href="${pageContext.request.contextPath}/space.do?method=toSpace&customerId=${customer.key.customer.id }" target='_parent'>
                   <img src="${imageUri }${customer.key.customer.headProtrait }"/>
                   </a>
                   </div>
                   <div class="friendWriteCount">
                       <div class="friendNickName">${customer.key.customer.realname }</div>
                       <div class="friend">足迹<span class="number">${customer.key.articleCount }</span> &nbsp;活动<span class="number">${customer.key.messageCount }</span> &nbsp;驴友<span class="number">${customer.key.friendCount }</span> &nbsp;粉丝<span class="number">${customer.key.fanceCount }</span></div>
                       <div class="buttonOpeartion">
                       	  <a name="${customer.key.customer.id }" style="display: none" class="setComment" href="#">已关注</a>
                       	  <c:if test="${customer.value==true }">
                          <a class="setComment" href="#">已关注</a>
                          </c:if>
                          <c:if test="${customer.value==false }">
                          <a name="${customer.key.customer.id }" class="setComment" href="javascript:addFriend('${sessionScope.customer.id}','${customer.key.customer.id }');" >+关注</a>
                          </c:if>
                       </div>
                   </div>
                 </div>
              	</li>
              </c:forEach>
              
              
           </ul>
           <c:if test="${fanceCount!=0 }">
           <div style="font-size: 18px;float: right;margin-right: 46px;">
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
		</c:if>
       </div>
   </div>
	<iframe src="${pageContext.request.contextPath }/common/customerCenter.do?method=foot" width="100%" height="101px" frameborder="0"> 

	</iframe>
</body>
</html>