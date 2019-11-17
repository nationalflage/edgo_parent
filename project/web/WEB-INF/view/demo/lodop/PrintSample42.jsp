﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例四十二:演示整页缩放打印</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示如何整页缩放打印：</font>
</h2>

<p>&nbsp;&nbsp;&nbsp;            
对整页内容进行缩放打印，可以按指定的百分比缩放，        
</p>

<p>也可以按纸张的整宽或整高来缩放，实现方式有两种：        
</p>

<p>1是操作者直接在<a href="javascript:prn_preview1();">打印预览1</a>窗口选择缩放比例；
</p>

<p>2是用语句<font color="#0000FF">SET_PRINT_MODE</font>的“<font color="#0000FF">PRINT_PAGE_PERCENT</font>”设置缩放比例；
</p>

<p><b>一、演示用函数控制缩放：</b><p>语法：<font color="#0000FF">SET_PRINT_MODE(&quot;PRINT_PAGE_PERCENT&quot;,varModeValue);</font>
<p>其中<font color="#0000FF">varModeValue</font>值及其含义如下：
<div id="div01" style="width: 515; height: 326">
<style> table,td,th {border: 1px solid black;border-collapse: collapse}</style>
<table border="1" width="493">
  <tr>
    <td width="178" align="center"><b>值</b></td>
    <td width="195" align="center"><b>说明</b></td>
    <td width="98" align="center"><b>演示</b></td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Full-Width</font></td>
    <td width="195">按整宽，即宽度缩放到与纸宽相当，高度不变，缩放后会变形。</td>
    <td width="98"><a href="javascript:prn_preview2();">打印预览2</a>
    </td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Full-Height</font></td>
    <td width="195">按整高，即高度缩放到与纸高相当，宽度不变，缩放后会变形</td>
    <td width="98"><a href="javascript:prn_preview3();">打印预览3</a>
    </td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Full-Page</font></td>
    <td width="195">按整页，既按整宽又按整高，缩放后会变形。</td>
    <td width="98"><a href="javascript:prn_preview4();">打印预览4</a>
    </td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Auto-Width</font></td>
    <td width="195">按整宽且不变形，即按整宽的同时，高度与之同比。</td>
    <td width="98"><a href="javascript:prn_preview5();">打印预览5</a>
    </td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Auto-Height</font></td>
    <td width="195">按整高且不变形，即按整高的同时，宽度与之同比。</td>
    <td width="98"><a href="javascript:prn_preview6();">打印预览6</a>
    </td>
  </tr>
  <tr>
    <td width="483" colspan="3">也可以设置缩放的具体百分比值,数据范围是<font color="#0000FF">5%-800%</font>，举例如下：</td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Width:200%</font></td>
    <td width="195">宽度放大一倍，高度不变。</td>
    <td width="98"><a href="javascript:prn_preview7();">打印预览7</a></td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Height:200%</font></td>
    <td width="195">高度放大一倍，宽度不变。</td>
    <td width="98"><a href="javascript:prn_preview8();">打印预览8</a></td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">Width:200%;Height:200%</font></td>
    <td width="195">宽度和高度都放大一倍。</td>
    <td width="98"><a href="javascript:prn_preview9();">打印预览9</a></td>
  </tr>
  <tr>
    <td width="178"><font color="#0000FF">55%</font></td>
    <td width="195">宽度和高度都缩小到原来的55%。</td>
    <td width="98"><a href="javascript:prn_preview10();">打印预览10</a>  

    </td>
  </tr>
</table>
</div>

<p><b>二、隐藏预览窗口上的缩放比例选项：</b>
</p>

<p>语法：<font color="#0000FF">SET_SHOW_MODE(&quot;HIDE_PAGE_PERCENT&quot;,true);</font>
见<a href="javascript:prn_preview11();">打印预览11</a>
</p>

<p><b>三、设置“溢出自动缩小”：</b>
</p>

<p>对于单页输出，如希望内容超出纸宽或纸高时对应缩小，用如下俩语句：</p>
<p><font color="#0000FF">SET_PRINT_MODE(&quot;FULL_WIDTH_FOR_OVERFLOW&quot;,true);</font>
</p>
<p><font color="#0000FF">SET_PRINT_MODE(&quot;FULL_HEIGHT_FOR_OVERFLOW&quot;,true);</font>
</p>
<p>见<a href="javascript:prn_preview12();">打印预览12</a>
演示。</p>

<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>
<script language="javascript" type="text/javascript">
    var LODOP; //声明为全局变量 
	function prn_preview1() {	
		CreateOnePage();
		LODOP.SET_PREVIEW_WINDOW(1,0,0,0,0,"");		
		LODOP.PREVIEW();	
	};
	function prn_preview2() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Full-Width");
		LODOP.PREVIEW();	
	};	
	function prn_preview3() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Full-Height");
		LODOP.PREVIEW();	
	};
	function prn_preview4() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Full-Page");
		LODOP.PREVIEW();	
	};		
	function prn_preview5() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Auto-Width");
		LODOP.PREVIEW();	
	};	
	function prn_preview6() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Auto-Height");
		LODOP.PREVIEW();	
	};	
	function prn_preview7() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Width:200%");
		LODOP.PREVIEW();	
	};	
	function prn_preview8() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Height:200%");
		LODOP.PREVIEW();	
	};	
	function prn_preview9() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","Width:200%;Height:200%");
		LODOP.PREVIEW();	
	};			
	function prn_preview10() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","55%");
		LODOP.PREVIEW();	
	};	
	function prn_preview11() {	
		CreateOnePage();	
		LODOP.SET_SHOW_MODE("HIDE_PAGE_PERCENT",true);
		LODOP.SET_PREVIEW_WINDOW(1,0,0,0,0,"");	
		LODOP.PREVIEW();	
	};	
	function prn_preview12() {	
		CreateOnePage();	
		LODOP.SET_PRINT_MODE("FULL_WIDTH_FOR_OVERFLOW",true);
		LODOP.SET_PRINT_MODE("FULL_HEIGHT_FOR_OVERFLOW",true);
		LODOP.SET_PREVIEW_WINDOW(1,0,0,0,0,"");
		LODOP.PREVIEW();	
	};							
	
	function CreateOnePage(){
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_整页缩放打印输出");
		LODOP.ADD_PRINT_HTM(5,5,"100%","100%","<body leftmargin=0 topmargin=0>"+document.getElementById('div01').innerHTML+"</body>");
		LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");	
	};	
</script> 





</body>
</html>