// JavaScript Document

//用于控制新生成的天数节点的天数

function creatnode(){
	
	//获取外框newnodes节点
	var newnode=document.getElementById("newnodes");
	//创建daynode节点
	var daynode=createnode("div","daynode");
	daynode.onkeyup=function(){
		showTimeZhu2(daynode);
	};
	newnode.appendChild(daynode);
	
	//创建timenode节点
	creattimenode(daynode);
	//创建creatdays2节点
	var dayCount=creatdays2(daynode);
	//创建daystwo_write节点
	creatdaystwo_write(daynode,dayCount);
	
	
	
}


//创建timenode节点
function creattimenode(daynode){
	var timenode=createnode("div","time_node2");
	daynode.appendChild(timenode);
	
	//添加jiannode
	var img1=createnode("img","jianjianode");
	img1.src="images/footprint/jianjian.png";
	
	var i=document.getElementsByClassName("daynode").length+1;
	img1.onclick=function(){
		var a = confirm("你确定要删除第"+i+"天吗？");
		
		if(a){
			delDay(i);
			document.getElementById("newnodes").removeChild(daynode);
		}
	};
	timenode.appendChild(img1);
	
	//添加timelizhu
	var a=createnode("div","timelizhu");
	timenode.appendChild(a);	
	
	//添加jianode
	var img2=createnode("img","jianjianode");
	img2.src="images/footprint/jiajia.png";
	img2.onclick=function(){
		creatnode();	

	};
	timenode.appendChild(img2);	
}
//创建creatdays2节点
function creatdays2(daynode){
	var day=["","","二","三","四","五","六","七","八","九","十"];
	
	var days=createnode("div","days_two");
	daynode.appendChild(days);	
	
	var daytwo=createnode("div","daystwo");
	days.appendChild(daytwo);
	
	var p=createnode("p","two_p");
	//用来指定下一次生成的天数节点的天数
	var i=document.getElementsByClassName("daynode").length+1;
	p.innerHTML="Day"+i;
	daytwo.appendChild(p);
	
	//说明是第二天的添加图片
	var imagePostUrl =document.getElementById("imagePostUrl");
	imagePostUrl.value="/ArticleServlet?method=addImage&dayId="+i;
	
	//返回创建的是第几天
	return i;
}


//创建daystwo_write节点
function creatdaystwo_write(dayndoe,count){
	var daystwo_write=createnode("div","daystwo_write");
	dayndoe.appendChild(daystwo_write);

		var foot_write=createnode("div","foot_write");
		daystwo_write.appendChild(foot_write);
		
			var write_day2=createnode("div","timeZhu");
			write_day2.style.marginLeft="198px";
			//开启可编辑状态
			write_day2.contentEditable=true;
			write_day2.onblur = function(){
				//用来异步上传preface方法在uploadmessage.js中
				sendPreface(write_day2);
			};
			foot_write.appendChild(write_day2);
			
			//生成用来存放dayId的input 
			var dayId=createnode("input","1");
			dayId.type="hidden";
			dayId.value=count;
			foot_write.appendChild(dayId);
			
		
		var img_upload_day2=createnode("div","img_upload_day2");
		daystwo_write.appendChild(img_upload_day2);

			//上传图片button
			var img_upload2=createnode("input","img_upload2");
			img_upload2.type="button";
			img_upload2.marginLeft="800px";
			img_upload2.value="+上传照片";

			img_upload2.onclick = function(){
				display();
				var url=document.getElementById("url");
				var day=img_upload2.nextSibling;
				//获得图片提交的form的节点
				var a=document.getElementById("uploadForm");
				//将正确的地址（天数）附到action上
				a.action=url.value+"/ArticleServlet?method=addImage&dayId="+day.value;
			};
				
			img_upload_day2.appendChild(img_upload2);
			
			//记录是第几天的hidden
			var dayCount=createnode("input","1");
			dayCount.type="hidden";
			dayCount.value=count;
			img_upload_day2.appendChild(dayCount);
			
			//用来创建前言异步上传的dayId
			
			
}

//页面完全加载后运行的函数
window.onload=function() 
{ 
	//第一天生成的图片下面的文本框与图片大小相适应
	var daysone_image=document.getElementById("daysone_image");
	if(daysone_image!=null){
		//调用文本框自适应方法
		adaptText1(daysone_image);
	}
	//其余天生成的图片下面的文本框与图片大小相适应
	var daystwo_image=document.getElementsByName("daystwo_image");
	if(daystwo_image!=null){
		for(var i=0;i<daystwo_image.length;i++){
			//调用文本框自适应方法
			adaptText1(daystwo_image[i]);
			
		}
	}
	
	//游记描述旁边的高度自适应的时间轴长度自适应
	showDescribeTimeZhu(document.getElementById("describe"));
	//第一天旁边的高度自适应的时间轴长度自适应
	var aday=document.getElementById("aday");
	showTimeZhu1(aday);
	//生成的其余天数旁边的高度自适应的时间轴长度自适应
	//先获得所有的daynode
	var daynode=document.getElementById("newnodes").childNodes;
	for(var i=0;i<daynode.length;i++){
		showTimeZhu2(daynode[i]);
	}
	
};
//第一天中的图片的文本框自适应
function adaptText1(daysone_image){
	
	var imageItems=daysone_image.childNodes;
	for(var i=0;i<imageItems.length;i++){
		if(imageItems[i].className=="imageItem"){
			var imageItem=imageItems[i];
			var imageItemChilds=imageItem.childNodes;
			for(var j=0;j<imageItemChilds.length;j++){
				//找到图片
				if(imageItemChilds[j].className=="footImage"){
					var footImage=imageItemChilds[j];
					var footImageChilds=footImage.childNodes;
					for(var k=0;k<footImageChilds.length;k++){
						if(footImageChilds[k].className=="imageSRC"){
							var imageSRC=footImageChilds[k];
//							console.log("imageSRC"+imageSRC.offsetWidth);
						}
					}
				}
				
			}
			//只需改两个地方，1.imageSRC的宽；2.imageItem的宽
			//先进行判断
			if(imageSRC.offsetWidth<200){
				imageSRC.style.width=200+"px";
				imageItem.style.width=200+"px";
			}else if(imageSRC.offsetWidth>650){
				imageSRC.style.width=650+"px";
				imageItem.style.width=650+"px";
			}else{
				imageSRC.style.width=imageSRC.offsetWidth;
				imageItem.style.width=imageSRC.offsetWidth;
				
			}
		}
	}
}
//描述旁边的高度自适应时间轴
function showDescribeTimeZhu(node){
	var left_node2=document.getElementById("left_node2");
	
	left_node2.style.height=node.offsetHeight-92+"px";
}

//第一天旁边的高度自适应的时间轴
function showTimeZhu1(node){
	var timeHeignt1=document.getElementById("timeHeignt1");
	
	timeHeignt1.style.height=node.offsetHeight-92+"px";
} 

//从数据库中生成的天数节点旁边的高度自适应的时间轴
function showTimeZhu2(node){
	var childNodes=node.childNodes; 
	//第一层遍历找到time_node2时间大轴
	for(var i=0;i<childNodes.length;i++){
		
		if(childNodes[i].className=="time_node2"){
			var time_node2=childNodes[i];
			var childTimeNode2=time_node2.childNodes;
			//第二次遍历找到timelizhu时间小竖轴
			for(var j=0;j<childTimeNode2.length;j++){
				
				if(childTimeNode2[j].className=="timelizhu"){
					var timelizhu=childTimeNode2[j];
					timelizhu.style.height=node.offsetHeight-81+"px";
				}
			}
		}
	}
} 

//点击上传图片方法(从后台拿到数据前台显示时forEach遍历之后加上方法)
function clickImage(img_upload2){
	display();
	var url=document.getElementById("url");
	var day=img_upload2.nextSibling;
	if(day.type==undefined){
		var day=img_upload2.nextSibling.nextSibling;
	}

	//获得图片提交的form的节点
	var a=document.getElementById("uploadForm");
	//将正确的地址（天数）附到action上
	a.action=url.value+"/ArticleServlet?method=addImage&dayId="+day.value;
}
//点击删除天数方法(从后台拿到数据前台显示时forEach遍历之后加上方法)
function jiantian(node){
	
	var n=node.nextSibling;
	if(n.type==undefined){
		var n=node.nextSibling.nextSibling;
		
	}	
	var a = confirm("你确定要删除第"+n.value+"天吗？");
	
	//如果删除的话，调用异步删除
	if(a){
		delDay(n.value);
		document.getElementById("newnodes").removeChild(node.parentNode.parentNode);
	}
	
}

//用来显示每张图片上的删除按钮
function showDel(node) {
	var childNodes=node.childNodes;
	for(var i=0;i<childNodes.length;i++){
		if(childNodes[i].className=='del'){
			var del=childNodes[i];	
			del.style.display ='block';
		}	
	}
}
//用来消除每张图片上的删除按钮
function disappearDel(node) {
	var childNodes=node.childNodes;
	for(var i=0;i<childNodes.length;i++){
		if(childNodes[i].className=='del'){
			var del=childNodes[i];	
			del.style.display ='none';
		}	
	}
	
	
}
//用来隐藏图片下面文本框中提示信息
function disappearText(node){
	var p=node.getElementsByTagName("p")[0];
	if(p!=null)
		p.style.display ='none';
}
//用来显示图片下面文本框中提示信息
function showText(node){
	var p=node.getElementsByTagName("p")[0];
	if(p!=null){
		
		var imageDescriptionBox=node.getElementsByTagName("div")[0];
		if(imageDescriptionBox.innerHTML=="")
			p.style.display ='block';
		if(imageDescriptionBox.innerHTML!="")
			p.style.display ='none';
	}
}
//用来显示图片下面文本框中内容数量
function showTextNum(node){
	var parent=node.parentNode;
	var div=parent.getElementsByTagName("div")[1];
	div.innerHTML=node.innerHTML.length+"/200";
}


//创建节点并赋予class工具类
function createnode(type,classname){
	var node=document.createElement(type);
	node.className=classname;
	return node;	
}
function test(){
	alert("s");	
}