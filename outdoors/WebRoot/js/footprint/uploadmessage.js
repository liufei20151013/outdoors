
function footNameExtend(){
	var node=document.getElementById("footName");
	var name=node.name;
	var value=node.value;
	var footNameLength=value.length;
	if(footNameLength==0){
		alert("足迹名字不能为空");
		return false;
	}
	else if(footNameLength>15){
		alert("足迹名字字数超出限制");
		return false;
	}
	else{
		send(name,value);
		return true;
	}
}


function timeExtend(){
	var node=document.getElementById("asdf");
	var name=node.name;
	var value=node.value;
	var timeLength=value.length;
	if(timeLength==0){
		alert("时间不能为空");
		return false;
	}
	else{
		send(name,value);
		return true;
	}
}

function footPLaceExtend(){
	var node=document.getElementById("footPlace");
	var name=node.name;
	var value=node.value;
	var footPLaceLength=value.length;
	if(footPLaceLength==0){
		alert("地点不能为空");
		return false;
	}
	else if(footPLaceLength>10){
		alert("地点字数超出限制");
		return false;
	}
	else{
		send(name,value);
		return true;
	}
}

function peopleExtend(){
	var node=document.getElementById("people");
	var name=node.name;
	var value=node.value;
	var peopleLength=value.length;
	if(peopleLength==0){
		alert("人数不能为空");
		return false;
	}
	else if(peopleLength>20){
		alert("人数字数超出限制");
		return false;
	}
	else{
		send(name,value);
		return true;
	}
}

function expenseExtend(){
	var node=document.getElementById("expense");
	var name=node.name;
	var value=node.value;
	var expenseLength=value.length;
	if(expenseLength==0){
		alert("花费不能为空");
		return false;
	}
	else if(expenseLength>10){
		alert("花费字数超出限制");
		return false;
	}
	else{
		send(name,value);
		return true;
	}
}

//对节点进行审核和异步传送费
function dothing(node){
	var name=node.name;
	var value=node.value;

	alert(value);
	if(charge()){
		send(name,value);
	}
	
	
}


//利用Ajax异步发送信息
function send(name,value){
	var json={
		name:name,
		value:value,
	};
	//ArticleServlet?method=addMessage
	$.post($("#sendMessageAddress").val(),json,function(data,textStatus){
	},"xml");
}


//
function chargeSelectBig(){
	var node=document.getElementById("selId");
	var value=node.value;
	if(value=="选择户外项目"){
		alert("户外项目不能为空");
		return false;
	}
	else{
		return true;
	}
	
}
function chargeSelectLittle(){
	var node=document.getElementById("SubSelid");
	var value=node.value;
	if(value=="选择类型"){
		alert("请选择类型");
		return false;
	}
	else{
		return true;
	}
	
}


//用来获取大类型下拉框数据，提交并拿到小类型的下拉框数据
function selectType(node){
	var name=node.name;
	var value=node.value;

//	上传大类型，放到数据库中
	send(name,value);
	
	var json={
		name:name,
		value:value,
	};
	
	//向数据库要小类型数据
	//ArticleServlet?method=showLittleType
	$.post($("#showLittleTypeAddress").val(),json,function(data,textStatus){
			
			
		var $SubSelid = $("#SubSelid");
		var SubSelid=$SubSelid.get(0);
	    
		//将小类型的下拉框清空
	    for (var i = 1; i < SubSelid.options.length;) {
	    	SubSelid.options[i].remove();
	    }
	    
		
		for(var i=0;i<data.length;i++){
			var $option=$("<option value="+data[i].littleId+">"+data[i].name+"</option>");
			$SubSelid.append($option);
		}
				
	},"json");
}

//	var node=document.getElementById("SubSelid");
//	if(value=="选择类型"){
//		alert("请选择类型");
//		return false;
//	}
//	else{
//		return true;
//	}
function printTypeExtend(node){
	var name=node.name;
	var value=node.value;
	send(name,value);
}
//发送游记的前言
function sendArticlePreface(){
	var summaryDay=document.getElementById("describe");
	var name=summaryDay.name;
	var value=summaryDay.innerHTML;
	var describeLength=value.length;
	if(describeLength==0){
		alert("请添加感想");
		return false;
	}
	else if(describeLength>1000){
		alert("字数超过限制");
		return false;
	}
	else{
		send("preface",summaryDay.innerHTML);
		return true;
	}
}
//发送每一天的前言
function sendPreface(node){
	
	var dayId=node.nextSibling;
	if(dayId.type==undefined){
		var dayId=node.nextSibling.nextSibling;
	}
	var json={
		dayId:dayId.value,
		preface:node.innerHTML,
	}
	
	
	//ArticleServlet?method=addPreface
	$.post($("#sendPreface").val(),json,function(data,textStatus){
		
	},"json");
	
	
	
}
//发送每张图片下的content
function sendContent(node){
	//先获得图片名字，可以作为唯一标示去article-content表中数据
	var imageName=node.parentNode.getElementsByTagName("input")[0];
	//用json传数据
	var json={
			imageName:imageName.value,
			content:node.innerHTML,
		};
	
	//ArticleServlet?method=addContent
	$.post($("#sendContent").val(),json,function(data,textStatus){
		
	},"json");
	
	
}

//异步删除天数
function delDay(dayId){
	//用json传数据
	var json={
			dayId:dayId,
		};
	
	//ArticleServlet?method=delDay
	$.post($("#delDay").val(),json,function(data,textStatus){
		
	},"json");
}
//异步删除第一天的content
function delContent1(node){
	//调用删除图片方法
	delContent(node);
	//要让第一天的时间轴自适应，每删除一个图片后
	var aday=document.getElementById("aday");
	showTimeZhu1(aday);
	
	
}
//异步删除其余天的content
function delContent2(node){
	
	//让其余天的时间轴自适应
	var daynode=node.parentNode.parentNode.parentNode;
	//调用删除图片方法
	delContent(node);
	showTimeZhu2(daynode);
	//要让第一天的时间轴自适应，每删除一个图片后
	var aday=document.getElementById("aday");
	showTimeZhu1(aday);
	
	
}
function delContent(node){
	
	//标志位，用来标志图片的爸爸节点里面时候还有图片节点
	var flag=false;
	
	//从数据库中删除数据
//	if(confirm("是否删除该图片？"))
	var dad=node.parentNode;
	var childNodes=dad.childNodes;
	for(var i=0;i<childNodes.length;i++){
		if(childNodes[i].className=="dayId"){
			var dayId=childNodes[i];
		}else if(childNodes[i].className=="contentId"){
			var contentId=childNodes[i];
		}
	}
	//用json传数据
	var json={
			dayId:dayId.value,
			contentId:contentId.value,
		};
		
	//ArticleServlet?method=delContent
	$.post($("#delContent").val(),json,function(data,textStatus){
			
	},"json");
		
	
	
	
	//一定腰先获得父亲节点，因为如果删掉的话就没有这个节点了
	var daysone_image=node.parentNode.parentNode;
	//在页面上删除图片
	node.parentNode.parentNode.removeChild(node.parentNode);
	//每删除一个图片后，进行判断，还有没有图片，如果没有的话，将图片的爸爸节点删掉，
	var child=daysone_image.childNodes;
	for(var i=0;i<child.length;i++){
		if(child[i].className=="imageItem"){
			flag=true;
		}
	}
	//进行判断，还有没有图片，如果没有的话，将图片的爸爸节点删掉，
	if(!flag){
		daysone_image.parentNode.removeChild(daysone_image);
	}	
	
		
		
}


//一加载页面，就向数据库要游记类型的数据
$(document).ready(function(){
	//判断，如果大类型有值，就不向数据库要数据，反之，如果没值，就要
	if($("#bigType").val()==""){
		
		//ArticleServlet?method=showType
		$.post($("#showTypeAddress").val(),null,function(data,textStatus){
			
			var $selId = $("#selId");
			for(var i=0;i<data.length;i++){
				var $option=$("<option value="+data[i].id+">"+data[i].name+"</option>");
				$selId.append($option);
			}
			
		},"json");
	}
});


//最后发送表单数据
function submit(){
	if(footNameExtend()&&timeExtend()&&footPLaceExtend()&&peopleExtend()&&expenseExtend()&&chargeSelectBig()&&chargeSelectLittle()&&sendArticlePreface()){
		//ArticleServlet?method=submit
		var address=$('#submit').val();
		location.href=address;
	}
}
