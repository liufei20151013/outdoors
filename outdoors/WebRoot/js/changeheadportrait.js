setInterval("getReadAsDataURL()",100); 
//显示图片
function getReadAsDataURL() {

	//得到图片
	var file = document.getElementsByName("file1")[0].files[0];

	//判断文件是否为空
	if(file){

		var reader = new FileReader();

		reader.readAsDataURL(file);

		reader.onload = function () {

			var data = reader.result;
			//<img  src="asdsa.jpg" />
			document.getElementById("headPortrait").src = data;
		};

	}
}


