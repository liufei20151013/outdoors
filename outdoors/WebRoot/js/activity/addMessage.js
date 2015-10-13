function activeExtend(){
	var wdcta=document.getElementById('activeName').value;
    var remindInfo=document.getElementById("remindActiveName");
    if(sameFunction(wdcta,remindInfo,20,"活动名称")){
    	return true;
    }
    else{
    	return false;
    }
}

function QQrule(){
	 var qq = document.getElementById("QQname").value;
	 var qqRemind = document.getElementById("remindQQname");
		if(qq.length==""){
			qqRemind.innerHTML = "QQ号码不能为空";
			qqRemind.style.color="red";
			return false;
		}
	 var reg = /^[1-9]\d{4,9}$/;
	 var qq_Flag = reg.test(qq);
	 if(qq_Flag){
		   qqRemind.innerHTML="qq格式正确";
		   qqRemind.style.color="green";
		   qqRemind.style.fontWeight="bold";
		   return true;
	 }
	 else{
		 qqRemind.innerHTML="qq格式不正确";
		 qqRemind.style.color="red";
		 return false;
	 }
}

function telRule(){
	var strMobile = document.getElementById("telphone").value;
	var mobile_info = document.getElementById("remindtelphone");
	if(strMobile.length==""){
		mobile_info.innerHTML = "手机号码不能为空";
		mobile_info.style.color="red";
		return false;
	}
	var mobile_Flag;
	var reg0=/^1\d{10}$/;
	if(reg0.test(strMobile)){
		mobile_Flag = true;
		mobile_info.innerHTML = "手机号码输入正确";
		mobile_info.style.color="green";
		mobile_info.style.fontWeight="bold";
		return true;
	}
	else{
		mobile_Flag = false;
		mobile_info.innerHTML = "手机号码格式错误";
		mobile_info.style.color="red";
		return false;
	}
	
}

function activeContent(){
	var wdcta=document.getElementById('password').value;
    var remindInfo=document.getElementById("remindactiveContent");
    if(sameFunction(wdcta,remindInfo,2000,"活动内容")){
    	return true;
    }
    else{
    	return false;
    }
}


function submitMotto(){
	   var formSubmit=document.getElementById("form");
	   if(activeExtend()&&activeContent()&&QQrule()&&telRule()){
		   formSubmit.submit();
	   }
}