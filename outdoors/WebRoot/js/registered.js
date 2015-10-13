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
//判断名字
function judgeName(){
	var reg=new RegExp("^[a-z]{3,10}$","i");
	return judgeAll("username",reg,"showName","用户名格式为3-10位英文字母！！！");
}
//判断邮箱
function judgeMail(){
	var reg=/^\w+@+\w+(\.\w+)$/i;
	return judgeAll("email",reg,"showMail","邮箱格式不正确！！！");
}
//判断密码
function judgePsd(){
	var reg=/^\d{6,16}$/;
	return judgeAll("password",reg,"showPsd","密码格式为6-16位数字！！！");
}
//判断重复密码
function judgePsdA(){
	var oPsdNode=document.getElementById("password");
	var oPsdANode=document.getElementById("confirmpassword");
	if(oPsdANode.value==oPsdNode.value){
		document.getElementById("showPsdA").innerHTML="";
		document.getElementById("confirmpassword").style.borderColor="";
		return true;		
	}else if(oPsdANode.value==""){
		document.getElementById("showPsdA").innerHTML="密码不能为空！！！".fontcolor("red");
		document.getElementById("confirmpassword").style.borderColor="red";
		return false;
	}else if(oPsdANode.value!=oPsdNode.value){
		document.getElementById("showPsdA").innerHTML="两次密码输入不一致！！！".fontcolor("red");
		document.getElementById("confirmpassword").style.borderColor="red";	
		return false;
	}		
}

//判断昵称
function judgeNickName(){
	var reg=/^[\u4E00-\u9FA5]{1,6}$/;
	return judgeAll("nickName",reg,"showNickName","昵称格式1-6位汉字！！！");
}
//判断电话
function judgePhone(){
	var reg=/^\d{11}$/;
	return judgeAll("phone",reg,"showPhone","电话号码格式不正确！！！");
}
//判断qq
function judgeQq(){
	var reg=/^\d{6,12}$/;
	return judgeAll("qq",reg,"showQq","qq号码格式不正确！！！");
}

//为页面的双击事件绑定处理函数
document.ondblclick=showMa;

//生成验证码
function showMa(){
	ma="";
	for(var i=0;i<4;i++){
		ma+=""+Math.round(Math.random()*9);	
	}
	document.getElementById("showmaid").innerHTML=ma;
	var judgemaagain=document.getElementsByName("judgemaagain")[0];
	judgemaagain.value=ma;
}


//判断验证码
function judgeMa(){
	var oJudge=document.getElementById("judgema");
	if(oJudge.value!=ma){
		document.getElementById("showJud").innerHTML="验证码不正确！！！".fontcolor("red");
		document.getElementById("judgema").style.borderColor="red";
		return false;	
	}else{
		document.getElementById("showJud").innerHTML="";
		document.getElementById("judgema").style.borderColor="";
		return true;	
	}	
}





//表单提交方法
function submitCheckForm(){
	//judgeName()&&judgeMail()&&judgePsd()&&judgePsdA()
	if(judgeName()&&judgeMail()&&judgePsd()&&judgePsdA()&&judgeNickName()&&judgePhone()&&judgeQq()&&judgeMa()){
		var form=document.getElementById("fm1");
		form.submit();
		
	}
}
//表单重置   
function resetForm(){
	var form=document.getElementById("fm1");
	form.reset();	
}