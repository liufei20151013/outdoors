	var dDate = new Date();  //日期对象dDate
	var dCurMonth = dDate.getMonth();  //表示月份
	var dCurDayOfMonth = dDate.getDate();  //表示每月中的某一天
	var dCurYear = dDate.getFullYear();   //表示年份
	var objPrevElement = new Object();  //object对象，包含其他对象通用的功能

	var t_year="2008";
	var t_month="1";
	var t_day;

   //fToggleColor的功能，当鼠标经过时，变另一种颜色
	function fToggleColor(myElement) {
		var toggleColor = "#1e90ff";  //给toggleColor颜色设置为#1e90ff
		if (myElement.id == "calDateText") { //calDateText是显示天数的列的id
		    if (myElement.color == toggleColor) { //鼠标经过，显示#1e90ff色
		        myElement.color = "";  //鼠标离开，恢复为原来的颜色
		    } 
		    else {
		        myElement.color = toggleColor;
		    }
		} 
		else if (myElement.id == "calCell") {
		        for (var i in myElement.children) { //children,子节点选取不包括空白节点
		           if (myElement.children[i].id == "calDateText") {
		                if (myElement.children[i].color == toggleColor) {
		                myElement.children[i].color = "";
		           } 
		           else {
		                myElement.children[i].color = toggleColor;
		            }
		         }
		      }
		   }
		}

	function fSetSelectedDay(myElement){  //选中日期之后的变化
	    if (myElement.id == "calCell") {
	    if (!isNaN(parseInt(myElement.children["calDateText"].innerText))) {
	         myElement.bgColor = "#ff00ff";  //选中某个日期，点击，显示的颜色
	         objPrevElement.bgColor = "";
	      document.all.calSelectedDate.value = parseInt(myElement.children["calDateText"].innerText);
	          objPrevElement = myElement;
	      }
	   }
	   //alert(myElement.bgColor);//#ff00ff
	   //return myElement.children["calDateText"].innerText;
	   t_day = myElement.children["calDateText"].innerText;//1~31
	   //alert(t_year);
	   //alert(t_month);
	   //alert(t_day);
	   var choose_time = document.getElementsByName("goTime")[0];
	   //alert(choose_time.id);
	   //document.write(t_year + "-" + t_month + "-" + t_day);
	   //alert(choose_time[0].nodeName);//input
	   choose_time.value = t_year + "-" + t_month + "-" + t_day;

	   //异步提交时间数据
	   send(choose_time.name,choose_time.value);
	
	
	}

	function fGetDaysInMonth(iMonth, iYear) {    
	    var dPrevDate = new Date(iYear, iMonth, 0);
	           return dPrevDate.getDate(); 
	}

	function fBuildCal(iYear, iMonth, iDayStyle) {
		var aMonth = new Array();  //数组对象，二维数组
		aMonth[0] = new Array(7);   //数组长度为7
		aMonth[1] = new Array(7);
		aMonth[2] = new Array(7);
		aMonth[3] = new Array(7);
		aMonth[4] = new Array(7);
		aMonth[5] = new Array(7);
		aMonth[6] = new Array(7);

		var dCalDate = new Date(iYear, iMonth-1, 1); //日期对象
		var iDayOfFirst = dCalDate.getDay(); //表示一周中的星期几
		var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);
		var iVarDate = 1;
		var i, d, w;
		if (iDayStyle == 2) {
			aMonth[0][0] = "Sunday";
			aMonth[0][1] = "Monday";
			aMonth[0][2] = "Tuesday";
			aMonth[0][3] = "Wednesday";
			aMonth[0][4] = "Thursday";
			aMonth[0][5] = "Friday";
			aMonth[0][6] = "Saturday";
		} 
		else if (iDayStyle == 1) {
			aMonth[0][0] = "Sun";
			aMonth[0][1] = "Mon";
			aMonth[0][2] = "Tue";
			aMonth[0][3] = "Wed";
			aMonth[0][4] = "Thu";
			aMonth[0][5] = "Fri";
			aMonth[0][6] = "Sat";
		} 
		else {
			aMonth[0][0] = "Su";
			aMonth[0][1] = "Mo";
			aMonth[0][2] = "Tu";
			aMonth[0][3] = "We";
			aMonth[0][4] = "Th";
			aMonth[0][5] = "Fr";
			aMonth[0][6] = "Sa";
		}
		for (d = iDayOfFirst; d < 7; d++) {
			aMonth[1][d] = iVarDate;
			iVarDate++;
		}
		for (w = 2; w < 7; w++) {
		   for (d = 0; d < 7; d++) {
		      if (iVarDate <= iDaysInMonth) {
		        aMonth[w][d] = iVarDate;
		        iVarDate++;
		      }
		   }
		}
		return aMonth;
		}


   
   	//显示日历
   	function showdate(){
		//显示日历头
		document.getElementById("date_box").style.visibility="visible";
		//显示日历身
		document.getElementById("date").style.visibility="visible";
	}
	function fDrawCal(iYear, iMonth, iCellWidth, iCellHeight, sDateTextSize, sDateTextWeight, iDayStyle) {
		
		var myMonth;
	    myMonth = fBuildCal(iYear, iMonth, iDayStyle);
		document.write("<div id='date'>");
		document.write("<table id='table_two' border='1px' cellpadding='0' cellspacing='0'>");

		document.write("<tr>");  //生成行，第一行
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][0] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][1] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][2] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][3] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][4] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][5] + "</td>");
		document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][6] + "</td>");
		document.write("</tr>");
		for (w = 1; w < 7; w++) {
			document.write("<tr>");   //生成6行
			for (d = 0; d < 7; d++) {   //生成7列
				document.write("<td align='left' valign='top' width='" + iCellWidth + "' height='" + iCellHeight + "' id=calCell style='CURSOR:Hand' onMouseOver='fToggleColor(this)' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>");
				if (!isNaN(myMonth[w][d])) {
					document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>" + myMonth[w][d] + "</font>");
				} 
				else {
					document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>&nbsp;</font>");
				}
				document.write("</td>");
			}
			document.write("</tr>");
		}
		document.write("</table>");
		document.write("</div>");
	}

	function fUpdateCal(iYear, iMonth) { //更新日历表
	    myMonth = fBuildCal(iYear, iMonth);
	   objPrevElement.bgColor = "";
	   document.all.calSelectedDate.value = "";
		for (w = 1; w < 7; w++) {
		   for (d = 0; d < 7; d++) {
		      if (!isNaN(myMonth[w][d])) {
		         calDateText[((7*w)+d)-7].innerText = myMonth[w][d];
		      } 
		      else {
		         calDateText[((7*w)+d)-7].innerText = "";
		         }
		      }
		   }


 /*获取选择的日期，并由时间input得到其值*/
     
     /*1、获取年份 */

		  //获取select节点
          var yNode = document.getElementById("second_year");
         //alert(yNode.nodeName);//select
         
         //获取option的value值（不是innerHTML），选择多少，就是多少
         t_year = yNode.options[yNode.selectedIndex].value;
         //alert(t_year);//2008~2016

     /*2、获取月份*/
         //获取select节点
         var mNode = document.getElementById("first_month");
         //alert(mNode.nodeName);//select
         t_month = mNode.options[mNode.selectedIndex].value;
        // alert(t_month);//1~12

        document.getElementsByName("goTime")[0].value = "";

	}



	
    