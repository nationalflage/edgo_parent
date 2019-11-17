﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十七:导出数据到Excel或图片文件</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示导出数据到Excel或图片文件：</font></h2>
<p>如果超文本对象中有表格(table元素)数据,可用如下函数导出电子表格(Excel)文件，<br>
也可把打印内容整体导成图片文件(emf、wmf、jpg、jpeg、bmp、png等)：</p>  
<p><font color="#0000FF">SAVE_TO_FILE(strFileName);<br>
SET_SAVE_MODE(varModeName,varModeValue);</font><br>

<br>
参数说明：<br>
<font color="#0000FF">strFileName</font>:要保存的文件名，扩展名为“xls”导出电子表格，“emf”等导出图片。<br>
<font color="#0000FF">varModeName</font>:保存模式，有“FILE_PROMPT”“PAGE_TYPE”等可以设置。<br>
<font color="#0000FF">varModeValue</font>:模式值，其中“PAGE_TYPE”导出Excel用，值为数字，含义如下：<br>
0-不分页；&nbsp;&nbsp;<br>
1-保存到同一个Sheet中，但会加入分页符（PageBreak）；<br>
2-分页到不同Sheet中；<h3><font color="#009999">演示：</font></h3>
<p>一、弹出对话框把如下表格数据<a href="javascript:SaveAsFile();">另存为</a>Excel件。  </p>

<p>二、直接<a href="javascript:OutToFileOneSheet();">导出数据</a>到文件:<input type="text" id="T1" size="15" value="C:\Test.xls"></p>

<p>三、<a href="javascript:OutToFileMoreSheet();">导出数据</a>到Excel文件时每页保存到不同Sheet中,并设置页眉页脚等,<br>
同时返回所保存的目标文件名称为：<input type="text" id="T2" size="45" value="">
</p>
<p>四、弹出对话框<a href="javascript:SaveAsEmfFile();">把本页内容导出</a>为EMF图文件，图片大小与当前纸张大小一致。</p>

<div id='div1'>
<table border=1 width="571" height="281" style="border:solid 1px black;border-collapse:collapse;">

<thead>
<tr><th width="146" bgcolor="#C0C0C0" height="16" style="border:solid 1px"><font color="#0000FF" face="黑体">作者</font></th>
<th width="220" bgcolor="#C0C0C0" colspan="2" height="16" style="border:solid 1px"><font color="#0000FF">歌曲题目</font></th>
<th width="71" bgcolor="#C0C0C0" height="16" style="border:solid 1px"><font color="#0000FF">国籍</font></th>
<th width="98" bgcolor="#C0C0C0" height="16" style="border:solid 1px"><font color="#0000FF">日期(收益)</font></th></tr>
</thead>

<tr>
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST><input value="Input Dylan"></span></td>                 
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Empire Burlesque</span></td>
<td width="71" height="54" rowspan="3" style="border:solid 1px"><span dataFld=COUNtrY>Pop</span></td>
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>USA</span></td>
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>1950-?-?</span></td>
</tr>

<tr>
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Bonnie Tyler</span></td>
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Hide your heart</span></td>
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>1968-?-?</span></td>
</tr>

<tr>
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Dolly Parton</span></td> 
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Greatest Hits</span></td>
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>USA</span></td>
<td width="98" height="16" xformat="yyyy/mm/dd" style="border:solid 1px"><span dataFld=COUNtrY><b>1968-04-27</b></span></td>
</tr>

<tr>
<td width="146" rowspan="3" height="60" style="border:solid 1px"><span dataFld=ARTIST>
<textarea rows="2" cols="20" style="border:solid 1px">TextArea_Content</textarea><br>Gary Moore</span></td>   
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Still got the <br>blues</span></td>  
<td width="71" rowspan="4" height="92" style="border:solid 1px">Classic</td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>  
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>1968-12-10</span></td>  
</tr>  
  
<tr>  
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Eros</span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>  
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>1980-09-13</span></td>  
</tr>  
  
<tr>  
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>One night only</span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>  
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>1983-12-05</span></td>  
</tr>  
  
<tr>  
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Dr.Hook</span></td>  
<td width="143" height="16" style="border:solid 1px"><span dataFld=TITLE>Sylvias Mother</span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>  
<td width="98" height="16" xformat="0.00%" style="border:solid 1px"><span dataFld=COUNtrY><b>0.845</b></span></td>  
</tr>  
  
<tr>  
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Rod Stewart</span></td>  
<td width="220" colspan="2" height="32" rowspan="2" style="border:solid 1px"><span dataFld=TITLE>  
<img border="0" src="http://s1.sinaimg.cn/middle/4fe4ba17hb5afe2caa990&690" width=150 height=40 />  
</span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>UK</span></td>  
<td width="98" height="16" xformat="#,##0.00" style="border:solid 1px"><span dataFld=COUNtrY><b>34545.07</b></span></td>  
</tr>  
  
<tr>  
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Andrea Bocelli</span></td>  
<td width="71" rowspan="2" height="11" style="border:solid 1px"><span dataFld=COUNtrY>EU</span></td>  
<td width="98" rowspan="2" height="11" xformat="￥#,##0.00" style="border:solid 1px"><span dataFld=COUNtrY><b>12588.76</b></span></td>  
</tr>  
  
<tr>  
<td width="366" colspan="3" height="1" xformat="@" style="border:solid 1px">  
  <p align="center"><b>370104196802231516</b></td>  
</tr>  
  
<tr>  
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Percy Sledge</span></td>  
<td width="220" colspan="2" height="16" xformat="@" style="border:solid 1px"><span dataFld=TITLE><b>370104196802231516</b></span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>USA</span></td>  
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>2005-08-01</span></td>  
</tr>  
  
<tr>  
<td width="146" height="16" style="border:solid 1px"><span dataFld=ARTIST>Savage Rose</span></td>  
<td width="220" colspan="2" height="16" style="border:solid 1px"><span dataFld=TITLE>Black angel</span></td>  
<td width="71" height="16" style="border:solid 1px"><span dataFld=COUNtrY>EU</span></td>  
<td width="98" height="16" style="border:solid 1px"><span dataFld=COUNtrY>2004-12-19</span></td>  
</tr>  
  
<tfoot>  
<tr>  
<th width="146" bgcolor="#C0C0C0" height="16" style="border:solid 1px"><font color="#008080">歌曲作者</font></th>  
<th bgcolor="#C0C0C0" width="220" colspan="2" height="16" style="border:solid 1px"><font color="#008080">曲目名称</font></th>  
<th bgcolor="#C0C0C0" width="183" height="16" colspan="2" style="border:solid 1px"><font color="#008080">作者国籍</font></th>  
</tr>  
</tfoot>  
  
</table>  
</div>  
<br><i>注：每个单元格的数据用元素td(或th)的</i>xformat<i>属性值来设置其类型格式，</i> 
&nbsp;<br>
&nbsp;&nbsp; <i>请注意观察以上粗体单元格的数据导出后的格式变化。</i> 
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p> 
 
<script language="javascript" type="text/javascript">  
	var LODOP; //声明为全局变量   
	function SaveAsFile(){ 
		LODOP=getLodop();   
		LODOP.PRINT_INIT(""); 
		LODOP.ADD_PRINT_TABLE(100,20,500,80,document.documentElement.innerHTML); 
		LODOP.SET_SAVE_MODE("Orientation",2); //Excel文件的页面设置：横向打印   1-纵向,2-横向;
		LODOP.SET_SAVE_MODE("PaperSize",9);  //Excel文件的页面设置：纸张大小   9-对应A4
		LODOP.SET_SAVE_MODE("Zoom",90);       //Excel文件的页面设置：缩放比例
		LODOP.SET_SAVE_MODE("CenterHorizontally",true);//Excel文件的页面设置：页面水平居中
		LODOP.SET_SAVE_MODE("CenterVertically",true); //Excel文件的页面设置：页面垂直居中
//		LODOP.SET_SAVE_MODE("QUICK_SAVE",true);//快速生成（无表格样式,数据量较大时或许用到） 
		LODOP.SAVE_TO_FILE("新文件名.xls"); 
	};	 
	function OutToFileOneSheet(){ 
		LODOP=getLodop();   
		LODOP.PRINT_INIT(""); 
		LODOP.ADD_PRINT_TABLE(100,20,500,60,document.getElementById("div1").innerHTML); 
		LODOP.SET_SAVE_MODE("FILE_PROMPT",false); 
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){if(Value) alert("导出成功！");};
			LODOP.SAVE_TO_FILE(document.getElementById("T1").value);
		} else if (LODOP.SAVE_TO_FILE(document.getElementById("T1").value)) alert("导出成功！");		 
	}; 
	function OutToFileMoreSheet(){ 
		LODOP=getLodop();   
		LODOP.PRINT_INIT(""); 
		LODOP.ADD_PRINT_TABLE(100,20,500,60,document.documentElement.innerHTML); 
		LODOP.SET_SAVE_MODE("PAGE_TYPE",2); 
		LODOP.SET_SAVE_MODE("CenterHeader","页眉"); //Excel文件的页面设置
		LODOP.SET_SAVE_MODE("CenterFooter","第&P页"); //Excel文件的页面设置
		LODOP.SET_SAVE_MODE("Caption","我的标题栏");//Excel文件的页面设置					 
		LODOP.SET_SAVE_MODE("RETURN_FILE_NAME",1); 
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){document.getElementById("T2").value=Value;};
			LODOP.SAVE_TO_FILE("多个Sheet的文件.xls");
			document.getElementById("T2").value="请等待结果...";
		} else document.getElementById("T2").value=LODOP.SAVE_TO_FILE("多个Sheet的文件.xls");		 
	};	
	function SaveAsEmfFile(){ 
		LODOP=getLodop();   
		LODOP.PRINT_INIT(""); 
		LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.documentElement.innerHTML); 
		LODOP.SET_SAVE_MODE("SAVEAS_IMGFILE_EXENAME",".emf");
		LODOP.SAVE_TO_FILE("新的矢量图片文件.emf"); 
	};	
</script> 
 
</body> 
