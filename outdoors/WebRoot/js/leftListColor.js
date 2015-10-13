
window.onload=displayColor;
function displayColor(){
    var liColor=document.getElementsByTagName("li");
	//alert(liColor[0].nodeName);
		   liColor.onmouseover=function(){
         alert("aaa");
              for(var i=0;i<liColor.length;i++){
		         liColor[i].style.backgroundColor="#1e90ef";
		      }
	}
		   
		   
	//判断，要让iframe跳转到哪个页面
	var page=document.getElementById("page");
	//判断是否跳转到修改密码页面
	if("changePassword"==page.value){
		window.open(document.getElementById("url").value+'/common/customerCenter.do?method=updatePassword',"change"); 
	}
	
}