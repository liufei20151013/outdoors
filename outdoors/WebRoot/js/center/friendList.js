
//删除好友
function addFriend(customerId,friendId){

	// 操作页面
	var pFriend1=document.getElementsByName(friendId)[0];
	pFriend1.style.display='';
	
	var pFriend2=document.getElementsByName(friendId)[1];
	pFriend2.style.display='none';
	
	
	// 操作数据库
	send(customerId, friendId);
		
	
}

//利用Ajax异步发送信息
function send(customerId,friendId){
	var json={
		customerId:customerId,
		friendId:friendId,
	}
	//${pageContext.request.contextPath}/customer/friend.do?method=addFriend
	$.post($("#addFriend").val(),json,function(data,textStatus){
	},"xml");
}