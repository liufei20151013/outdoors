// JavaScript Document
function mouseOverImg(image){
	image.src="images/customer/down.png";	
}
function mouseOutImg(image){
	image.src="images/customer/up.png";	
}
function submit1(){
	var form=document.getElementById("fml");
	form.submit();	
}

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
	return judgeAll("username",reg,"showName","用户名格式为3-10位英文字母！");
}
//判断密码
function judgePsd(){
	var reg=/^\d{6,16}$/;
	return judgeAll("password",reg,"showPsd","密码格式为6-16位数字！");
}

//表单提交方法
function submit1CheckForm(){
	//judgeName()&&judgeMail()&&judgePsd()&&judgePsdA()
	if(judgeName()&&judgePsd()){
		var form=document.getElementById("fml");
		form.submit();
		
	}
}
