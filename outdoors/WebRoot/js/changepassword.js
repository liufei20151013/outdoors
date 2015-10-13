// JavaScript Document
//全局变量验证
var ma="";
//综合判断
function judgeAll(textId,reg,spanId,errorText){
	var val=document.getElementById(textId).value;
	if(reg.test(val)){
		document.getElementById(spanId).innerHTML="";
		document.getElementById(textId).style.borderColor="";
		return true;	
	}else{
		document.getElementById(spanId).innerHTML=errorText.fontcolor("red");
		document.getElementById(textId).style.borderColor="red";
		return false;
	}	
}

//判断当前密码
function judgeOldPsd(){
	var reg=/^\d{6,16}$/;
	return judgeAll("oldPassword",reg,"showOldPsd","密码格式为6-16位数字！");
}
//判断新密码
function judgePsd(){
	var reg=/^\d{6,16}$/;
	return judgeAll("newPassword",reg,"showPsd","密码格式为6-16位数字！");
}
//确定新密码
function judgePsdA(){
	var oPsdNode=document.getElementById("newPassword");
	var oPsdANode=document.getElementById("confirmPassword");
	if(oPsdANode.value==oPsdNode.value){
		document.getElementById("showPsdA").innerHTML="";
		document.getElementById("confirmPassword").style.borderColor="";
		return true;		
	}else if(oPsdANode.value==""){
		document.getElementById("showPsdA").innerHTML="密码不能为空！".fontcolor("red");
		document.getElementById("confirmPassword").style.borderColor="red";
		return false;
	}else if(oPsdANode.value!=oPsdNode.value){
		document.getElementById("showPsdA").innerHTML="两次密码输入不一致！".fontcolor("red");
		document.getElementById("confirmPassword").style.borderColor="red";	
		return false;
	}		
}


//表单提交方法
function submitCheckForm(){
	//judgeOldPsd()&&judgePsd()&&judgePsdA()
	if(judgeOldPsd()&&judgePsd()&&judgePsdA()){
		var form=document.getElementById("fm1");
		form.submit();
		
	}
}
//表单重置   
function resetForm(){
	var form=document.getElementById("fm1");
	form.reset();	
}