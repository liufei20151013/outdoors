function displayUserInformation(){
	var userImage=document.getElementsByClassName("userInformation")[0];
	userImage.style.display="block";
	onmouseout=function(){
		userImage.style.display="none";
	}
}


setInterval("getReadAsDataURL()",100); 
//显示图片
function getReadAsDataURL() {
	
	var a=document.getElementsByName("myfile")[0];
	//得到图片
	if(a)
		var file = a.files[0];
	
	
	//判断文件是否为空
	if(file){
		
		var reader = new FileReader();
		
		reader.readAsDataURL(file);
		
		reader.onload = function () {
			
			var data = reader.result;
			//<img  src="asdsa.jpg" />
			document.getElementById("background").src = data;
		}
		
	}
}