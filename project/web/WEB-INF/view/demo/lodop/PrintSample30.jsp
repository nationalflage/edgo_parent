﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例三十:分页输出页面内容</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示如何分页输出页面内容：</font>
</h2>
<div id="div1_2_3">

<div id="div1">
  <table border="1" width="300" id="tb01" bgcolor="#CCFFCC" style="border:solid 1px black"><tr><td width="133" id="mtb001" style="border:solid 1px">
  <font face="黑体" color="#FF0000" size="3">《带底色表单》</font></td></tr></table>
  <table border="1" width="300" height="106" cellspacing="0" bgcolor="#CCFFFF" style="border-collapse:collapse;border:1px solid black"><tr>
  <td width="66" height="16" style="border:1px solid black"><font color="#0000FF">A</font><font color="#0000FF">等</font></td>
<td width="51" height="16" style="border:1px solid black"><font color="#0000FF">B</font><font color="#0000FF">等</font></td>
<td width="51" height="16" style="border:1px solid black"><font color="#0000FF">C</font><font color="#0000FF">等</font></td></tr> 
  <tr><td width="66" height="12" style="border:1px solid black">A001</td><td width="51" height="12" style="border:1px solid black">B001</td><td width="51" height="12" style="border:1px solid black">C001</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">A002</td><td width="51" height="16" style="border:1px solid black">B002</td><td width="51" height="16" style="border:1px solid black">C002</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">A003</td><td width="51" height="16" style="border:1px solid black">B003</td><td width="51" height="16" style="border:1px solid black">C003</td></tr> </table>
</div>

<p style="page-break-after:always">&nbsp;分页元素不能空，可以是空格或普通内容</p>

<div id="div2">
  <table border="1" width="300" height="106" cellspacing="0" style="border-collapse: collapse; border:double 3px black;" borderthin="true"> 
  <tr><td width="168" height="12" colspan="3" style="border:1px solid black;"><font face="黑体" color="#FF0000" size="3">双细线表格</font></td></tr> 
    <tr>
  <td width="66" height="16" style="border:1px solid black"><font color="#0000FF">X等</font></td>
<td width="51" height="16" style="border:1px solid black"><font color="#0000FF">Y等</font></td>
<td width="51" height="16" style="border:1px solid black"><font color="#0000FF">Z等</font></td>
    </tr>
  <tr><td width="66" height="12" style="border:1px solid black">X001</td><td width="51" height="12" style="border:1px solid black">Y001</td><td width="51" height="12" style="border:1px solid black">Z001</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">X002</td><td width="51" height="16" style="border:1px solid black">Y002</td><td width="51" height="16" style="border:1px solid black">Z002</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">X003</td><td width="51" height="16" style="border:1px solid black">Y003</td><td width="51" height="16" style="border:1px solid black">Z003</td></tr> </table>
</div>

<div id="div3" style="page-break-before:always">
  <table border="1" width="100%" id="tb01" style="border-collapse:collapse" bordercolor="#000000">
  <tr><td colspan="3" style="border:1px solid black"><font face="黑体" color="#FF0000"  size="3">《单线表单》</font></td></tr>
  <tr>
  <td width="66" height="4" style="border:1px solid black"><font color="#0000FF">R等</font></td>
  <td width="51" height="4" style="border:1px solid black"><font color="#0000FF">S等</font></td>
  <td width="51" height="4" style="border:1px solid black"><font color="#0000FF">T等</font></td>
  </tr>
  <tr><td width="66" height="12" style="border:1px solid black">R001</td><td width="51" height="12" style="border:1px solid black">S001</td><td width="51" height="12" style="border:1px solid black">T001</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">R002</td><td width="51" height="16" style="border:1px solid black">S002</td><td width="51" height="16" style="border:1px solid black">T002</td></tr> 
  <tr><td width="66" height="16" style="border:1px solid black">R003</td><td width="51" height="16" style="border:1px solid black">S003</td><td width="51" height="16" style="border:1px solid black">T003</td></tr> 
  </table>
</div>

</div>

<p>下面演示把以上三段内容分页输出：<p><b>方式一</b>：把三段超文本分别送给控件，用<font color="#0000FF">NewPage</font>实现分页，                     
看一下<a href="javascript:prn1_preview()">打印预览1</a>。<p><font size="2">该方式分页准确、容易理解、可多页预览，         
但需要分页内容被div提前区分开。</font><p><b>方式二</b>：三段内容分别放到一个table的不同tr中,                              
用<font color="#0000FF">ADD_PRINT_TABLE</font>自动分页，看一下<a href="javascript:prn2_preview()">打印预览2</a>
<p><font size="2">该方式不需要专门函数或分页符，但需要用table结构重组文本或提前预置，注意第4个参数要小于最小页内容(这里用1)。</font>
<p><b>方式三</b>：把一个超文本大段落送给控件，其中用<font color="#0000FF">page-break-after(before)</font>强制分页，                    
看一下<a href="javascript:prn3_preview()">打印预览3</a>&nbsp;<p><font size="2">该方式语法简单，但需要超文本中提前预置强制分页符，         
并注意只有前后都有换行符的block元素才能用来分页，<br>可以专门插入一个分页元素，也可以把一个正常元素的style设为强制分页，且必须在block元素之间进行分页。</font><p>
<b>方式四</b>：每次打印一个表，循环3次实现分页输出，看一下<a href="javascript:prn4_preview()">直接打印4</a>   
<p>            
<font size="2">该方式性能高、适合连续快速打印，但不能多页预览</font>。<p>
<b>方式五</b>：还有一个多页对象分隔指令<font color="#0000FF">NewPage</font><font color="#0000FF">A</font>，参考<a href="PrintSample43.html">样例43</a>。<p>    
<b>方式六</b>：强制分页和自动分页相结合，例如按<font color="#0000FF">每页高度160+强制分页符</font>输出本文档见<a href="javascript:prn6_design()">打印设计6</a>    
<p>    
<font size="2">为了避免自动分页切割表格的单元格，可适当提高表格行的粒度TableRowThickNess为25(默认值是20)。</font><p>    
<a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a><script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量    
	function prn1_preview() {	
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_分页输出一");
		LODOP.ADD_PRINT_HTM(88,200,350,600,document.getElementById("div1").innerHTML);
		LODOP.NewPage();
		LODOP.ADD_PRINT_HTM(88,200,350,600,document.getElementById("div2").innerHTML);
		LODOP.NewPage();
		LODOP.ADD_PRINT_HTM(88,200,350,600,document.getElementById("div3").innerHTML);
		LODOP.PREVIEW();	
	};
	function prn2_preview() {
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_分页输出二");
                strHTML="<table border='0' width='100%' >";
		strHTML=strHTML+"<tr><td>";
		strHTML=strHTML+document.getElementById("div1").innerHTML;
		strHTML=strHTML+"</td></tr>";
		strHTML=strHTML+"<tr><td>";
		strHTML=strHTML+document.getElementById("div2").innerHTML;
		strHTML=strHTML+"</td></tr>";
		strHTML=strHTML+"<tr><td>";
		strHTML=strHTML+document.getElementById("div3").innerHTML;
		strHTML=strHTML+"</td></tr>";
		LODOP.ADD_PRINT_TABLE(88,200,350,1,strHTML);
		LODOP.PREVIEW();	
	};	
	function prn3_preview() {
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_分页输出三");
		LODOP.ADD_PRINT_HTM(88,150,450,"100%",document.getElementById("div1_2_3").innerHTML);
		LODOP.PREVIEW();	
	};	
</script><script language="javascript" type="text/javascript">     
	function prn4_preview() {
		LODOP=getLodop();  	
		Prnt_Oneform("div1");	
		Prnt_Oneform("div2");	
		Prnt_Oneform("div3");			
	};
	function Prnt_Oneform(strID) {	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_分页输出四");
		LODOP.ADD_PRINT_HTM(88,200,350,600,document.getElementById(strID).innerHTML);
		LODOP.PRINT();	
	};
	function prn6_design() {
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_分页输出六");
		LODOP.ADD_PRINT_HTM(88,150,450,150,"<!DOCTYPE html>"+document.getElementsByTagName("html")[0].innerHTML);
		LODOP.SET_PRINT_STYLEA(0,"TableRowThickNess",25);
		LODOP.PRINT_DESIGN();	
	};
</script> 

</body>
</html>