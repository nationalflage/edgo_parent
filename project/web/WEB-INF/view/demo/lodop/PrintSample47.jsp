﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例四十七:演示Lodop嵌套自身</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示Lodop嵌套自身：</font></h2>
<p>由于Lodop提供的条码、图形和图表等功能除了输出打印之外，还可以用SHOW_CHART语句在页面内显示（<a href="PrintSample11.html"  target="_blank">参考样例11</a>）。</p> 
<p>我们利用这一特点，把LODOP对象嵌套在一段要输出的超文本中，就让这些本来孤立的图形对象与超文本密切融合。</p>  
<h3><font color="#009999">演示：</font></h3>
<p>一、现在<a href="javascript:MyPreview();">打印预览</a>如下表格的内容，其中包含Lodop实现的条码。<p>二、也可以<a href="javascript:OutToFile();">导出如下表格</a>到Excel文件，内容里包含该条码。</p>

<div id='div1'>
<style> table,td,th {border: 1px solid black;border-collapse: collapse}</style>
<table border=1 width="571" height="281">

<thead>
<tr><th width="146" bgcolor="#C0C0C0" height="16"><font color="#0000FF">作者</font></th>
<th width="220" bgcolor="#C0C0C0" colspan="2" height="16"><font color="#0000FF">歌曲题目</font></th>
<th width="71" bgcolor="#C0C0C0" height="16"><font color="#0000FF">国籍</font></th>
<th width="98" bgcolor="#C0C0C0" height="16"><font color="#0000FF">日期(收益)</font></th></tr>
</thead>

<tr>
<td width="146" height="16"></td>                 
<td width="143" height="16"><span dataFld=TITLE>Empire Burlesque</span></td>
<td width="71" height="54" rowspan="3"><span dataFld=COUNtrY>Pop</span></td>
<td width="71" height="16"><span dataFld=COUNtrY>USA</span></td>
<td width="98" height="16"><span dataFld=COUNtrY>1950-?-?</span></td>
</tr>

<tr>
<td width="146" height="16"><span dataFld=ARTIST>Bonnie Tyler</span></td>
<td width="143" height="16"><span dataFld=TITLE>Hide your heart</span></td>
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>
<td width="98" height="16"><span dataFld=COUNtrY>1968-?-?</span></td>
</tr>

<tr>
<td width="146" height="16"><span dataFld=ARTIST>Dolly Parton</span></td> 
<td width="143" height="16"><span dataFld=TITLE>Greatest Hits</span></td>
<td width="71" height="16"><span dataFld=COUNtrY>USA</span></td>
<td width="98" height="16" xformat="yyyy/mm/dd"><span dataFld=COUNtrY><b>1968-04-27</b></span></td>
</tr>

<tr>
<td width="146" rowspan="3" height="60"><span dataFld=ARTIST>
<br>Gary Moore</span></td>    
<td width="143" height="32" rowspan="2"><span dataFld=TITLE>Still got the <br>blues</span> 
  <p><span dataFld=TITLE>Eros</span></p> 
</td>   
<td width="71" rowspan="4" height="92">Classic</td>   
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>   
<td width="98" height="16"><span dataFld=COUNtrY>1968-12-10</span></td>   
</tr>   
   
<tr>   
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>   
<td width="98" height="16"><span dataFld=COUNtrY>1980-09-13</span></td>   
</tr>   
   
<tr>   
<td width="143" height="16"><span dataFld=TITLE>One night only</span></td>   
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>   
<td width="98" height="16"><span dataFld=COUNtrY>1983-12-05</span></td>   
</tr>   
   
<tr>   
<td width="146" height="16"><span dataFld=ARTIST>Dr.Hook</span></td>   
<td width="143" height="16"><span dataFld=TITLE>Sylvias Mother</span></td>   
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>   
<td width="98" height="16" xformat="0.00%"><span dataFld=COUNtrY><b>0.845</b></span></td>   
</tr>   
   
<tr>   
<td width="146" height="16"><span dataFld=ARTIST>Rod Stewart</span></td>   
<td width="220" colspan="2" height="32" rowspan="2">
<object id="LODOP_O1" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width="200" height="40"> 
<param name="Color" value="white"> 
</object> </td>   
<td width="71" height="16"><span dataFld=COUNtrY>UK</span></td>   
<td width="98" height="16" xformat="#,##0.00"><span dataFld=COUNtrY><b>34545.07</b></span></td>   
</tr>   
   
<tr>   
<td width="146" height="16"><span dataFld=ARTIST>Andrea Bocelli</span></td>   
<td width="71" rowspan="2" height="11"><span dataFld=COUNtrY>EU</span></td>   
<td width="98" rowspan="2" height="11" xformat="￥#,##0.00"><span dataFld=COUNtrY><b>12588.76</b></span></td>   
</tr>   
   
<tr>   
<td width="366" colspan="3" height="1" xformat="##0.0E+0">   
  <p align="center"><b>370104196802231516</b></td>   
</tr>   
   
<tr>   
<td width="146" height="16"><span dataFld=ARTIST>Percy Sledge</span></td>   
<td width="220" colspan="2" height="16" xformat="@"><span dataFld=TITLE><b>370104196802231516</b></span></td>   
<td width="71" height="16"><span dataFld=COUNtrY>USA</span></td>   
<td width="98" height="16"><span dataFld=COUNtrY>2005-08-01</span></td>   
</tr>   
   
<tr>   
<td width="146" height="16"><span dataFld=ARTIST>Savage Rose</span></td>   
<td width="220" colspan="2" height="16"><span dataFld=TITLE>Black angel</span></td>   
<td width="71" height="16"><span dataFld=COUNtrY>EU</span></td>   
<td width="98" height="16"><span dataFld=COUNtrY>2004-12-19</span></td>   
</tr>   
   
<tfoot>   
<tr>   
<th width="146" bgcolor="#C0C0C0" height="16"><font color="#008080">歌曲作者</font></th>   
<th bgcolor="#C0C0C0" width="220" colspan="2" height="16"><font color="#008080">曲目名称</font></th>   
<th bgcolor="#C0C0C0" width="183" height="16" colspan="2"><font color="#008080">作者国籍</font></th>   
</tr>   
</tfoot>   
   
</table>  
<script language="javascript" type="text/javascript">   
		var LODOP01=document.getElementById("LODOP_O1"); 
		LODOP01.PRINT_INIT("");
		LODOP01.ADD_PRINT_BARCODE(3,10,150,35,"128Auto","123456789012");
		LODOP01.SHOW_CHART();
</script>  
  
</div>   
<p>注:为了避免对象混淆，一定给内嵌Object起不同ID（例:LODOP_01），也别与JS变量重名。</p> 
<a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>  
  
<script language="javascript" type="text/javascript">   
	function MyPreview(){  
		var LODOP=getLodop();   
		LODOP.PRINT_INIT("");  
		LODOP.ADD_PRINT_HTM(100,20,500,"100%",document.getElementById("div1").innerHTML); 
		//LODOP.SET_PRINT_STYLEA(0,"HtmWaitMilSecs",1000); //如果内容包含复杂的运行脚本或第三方插件，延迟1000毫秒
		LODOP.PREVIEW();		  
	};  
	function OutToFile(){  
		var LODOP=getLodop();   
		LODOP.PRINT_INIT("");  
		LODOP.ADD_PRINT_TABLE(100,20,500,"100%",document.getElementById("div1").innerHTML);  
		LODOP.SAVE_TO_FILE("新文件名.xls");  
	};					  
</script>  
  
</body>  
