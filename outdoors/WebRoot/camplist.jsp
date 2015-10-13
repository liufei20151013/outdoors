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
    
    <title>露营天地</title>
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
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">武汉张公山寨 </div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao1" ><a href="ProjectServlet?method=ApplyCamp&PjId=25&PjName=武汉张公山寨 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close1"><a href="ProjectServlet?method=DeleteCamp&PjId=25">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/1.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">2</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">武汉九宫山</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao2" ><a href="ProjectServlet?method=ApplyCamp&PjId=26&PjName=武汉九宫山">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close2"><a href="ProjectServlet?method=DeleteCamp&PjId=26">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/2.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">3</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">崇明岛东滩露营地</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao3" ><a href="ProjectServlet?method=ApplyCamp&PjId=27&PjName=崇明岛东滩露营地 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close3"><a href="ProjectServlet?method=DeleteCamp&PjId=27">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/3.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">4</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">上海天马山深坑露营点</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao4" ><a href="ProjectServlet?method=ApplyCamp&PjId=28&PjName=上海天马山深坑露营点 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close4"><a href="ProjectServlet?method=DeleteCamp&PjId=28">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/4.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">5</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">浦东三甲港海滨乐园露营地</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao5" ><a href="ProjectServlet?method=ApplyCamp&PjId=29&PjName=浦东三甲港海滨乐园露营地">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close5"><a href="ProjectServlet?method=DeleteCamp&PjId=29">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/5.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">6</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">青浦区淀山湖露营地</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao6" ><a href="ProjectServlet?method=ApplyCamp&PjId=30&PjName=青浦区淀山湖露营地">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close6"><a href="ProjectServlet?method=DeleteCamp&PjId=30">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/6.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">7</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">佘山国家森林公园露营点</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao7" ><a href="ProjectServlet?method=ApplyCamp&PjId=31&PjName=佘山国家森林公园露营点">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close7"><a href="ProjectServlet?method=DeleteCamp&PjId=31">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/7.jsp">活动介绍</a></div></td>
        </tr>
        <tr>
        <td width="5%" height="26" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">8</div></td>
        <td width="30%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1">海湾国家森林公园露营点</div></td>
        <td width="15%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2 STYLE1"></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="bao8" ><a href="ProjectServlet?method=ApplyCamp&PjId=32&PjName=海湾国家森林公园露营点 ">报名</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2" id="close8"><a href="ProjectServlet?method=DeleteCamp&PjId=32">取消</a></div></td>
        <td width="12%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3.jsp">返回</a></div></td>
        <td width="14%" height="18" bgcolor="#FFFFFF" class="STYLE1"><div align="center" class="STYLE2"><a href="walk3/8.jsp">活动介绍</a></div></td>
        </tr>
        
    </table>
    </td>
  </tr>
</table>
</body>
</html>
