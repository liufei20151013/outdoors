<%@ page language="java" import="java.util.*,com.wipe.entity.Project" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>徒步穿越</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}

-->
</style>

<script>
var  highlightcolor='#eafcd5';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=project.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (project.fromElement.contains(project.toElement)||source.contains(project.toElement)||source.id=="nc")
return
if  (project.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=project.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
<script type="text/javascript" src="js/button.js"></script>
  </head>
  
  <body>
  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">活动列表</span></td>
        <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
          
              </table></td>
            </tr>
        </table>
        </td>
        <td width="14"><img src="images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table>
    <td>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="5%" height="26" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">编号</div></td>
            <td width="30%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">活动名称</div></td>
            <td width="15%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">活动时间</div></td>
 			<td width="12%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">活动报名</div></td>
            <td width="12%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">取消报名</div></td>
            <td width="12%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">返回上一页</div></td>
            <td width="14%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">查看</div></td>
          </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">1</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">森林公园 </div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周一、周四晚18：40　</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao1" ><a href="ProjectServlet?method=ApplyWalk&PjId=9&PjName=森林公园 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close1"><a href="ProjectServlet?method=DeleteWalk&PjId=9">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/1.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">2</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">武汉理工大学 </div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周一、周四晚19：00</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao2" ><a href="ProjectServlet?method=ApplyWalk&PjId=10&PjName=武汉理工大学">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close2"><a href="ProjectServlet?method=DeleteWalk&PjId=10">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/2.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">3</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">武大樱花大道</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周一、周三晚19：15 </div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao3" ><a href="ProjectServlet?method=ApplyWalk&PjId=11&PjName=武大樱花大道 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close3"><a href="ProjectServlet?method=DeleteWalk&PjId=11">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/3.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">4</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">东湖梨园 </div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周二、周四晚19：00——20：30 </div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao4" ><a href="ProjectServlet?method=ApplyWalk&PjId=12&PjName=东湖梨园 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close4"><a href="ProjectServlet?method=DeleteWalk&PjId=12">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/4.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">5</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">武昌江滩</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周一、周三晚19：00-21：00</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao5" ><a href="ProjectServlet?method=ApplyWalk&PjId=13&PjName=武昌江滩">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close5"><a href="ProjectServlet?method=DeleteWalk&PjId=13">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/5.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">6</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">后湖</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">每周二、周四18:30</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao6" ><a href="ProjectServlet?method=ApplyWalk&PjId=14&PjName=后湖">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close6"><a href="ProjectServlet?method=DeleteWalk&PjId=14">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/6.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">7</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">汉口青少年宫 </div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">每周二、周五晚19：00</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao7" ><a href="ProjectServlet?method=ApplyWalk&PjId=15&PjName=汉口青少年宫">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close7"><a href="ProjectServlet?method=DeleteWalk&PjId=15">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/7.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">8</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">中山公园</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">周一、周四晚19：00</div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao8" ><a href="ProjectServlet?method=ApplyWalk&PjId=16&PjName=中山公园 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close8"><a href="ProjectServlet?method=DeleteWalk&PjId=16">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk/8.jsp">活动介绍</a></div></td>
        </tr>
        
    </table>
    </td>
  </tr>
</table>
</body>
</html>
