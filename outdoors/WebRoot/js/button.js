//JavaScript Document

function getRequest(){
	var xmlHttp = null;
	try{
		xmlHttp = new XMLHttpRequest();
	}catch(e){
		try{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				alert("your browser not support ajax!");
			}
		}
	}
	return xmlHttp;
}

var request = getRequest();
window.onload = function(){
	var bao1Ele = document.getElementById("bao1");
	bao1Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close1Ele = document.getElementById("close1");
	close1Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao2Ele = document.getElementById("bao2");
	bao2Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close2Ele = document.getElementById("close2");
	close2Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao3Ele = document.getElementById("bao3");
	bao3Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close3Ele = document.getElementById("close3");
	close3Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao4Ele = document.getElementById("bao4");
	bao4Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close4Ele = document.getElementById("close4");
	close4Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao5Ele = document.getElementById("bao5");
	bao5Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close5Ele = document.getElementById("close5");
	close5Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao6Ele = document.getElementById("bao6");
	bao6Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close6Ele = document.getElementById("close6");
	close6Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao7Ele = document.getElementById("bao7");
	bao7Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close7Ele = document.getElementById("close7");
	close7Ele.onclick = function(){
		alert("您已取消报名！");
	};
	
	var bao8Ele = document.getElementById("bao8");
	bao8Ele.onclick = function(){
		alert("报名成功！");
	};
	
	var close8Ele = document.getElementById("close8");
	close8Ele.onclick = function(){
		alert("您已取消报名！");
	};
};
