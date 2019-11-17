﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例三十四:百分比(%)和满页打印演示</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示使用百分比(%)和满页打印：</font></h2>
<table cellpadding="0" cellspacing="0" border="0" class="numberedList" width="572">
  <tr id="eCE2" vAlignment="top" class>
    <td Alignment="right" class="dropCapQ" nowrap width="6"></td>
    <td width="812">
      <table name="tiba" class="tiba" width="769">
        <tr>
          <td>Lodop函数的许多参数可声明使用<font color="#0000FF">in(英寸)、cm(厘米)、mm(毫米)、pt(磅)</font><font color="#0000FF">、px(1/96英寸)</font>等绝对长度单位，</td>
        </tr>
        <tr>
          <td>

          其中部分函数（数据区域）的计量单位还可以使用<font color="#0000FF">百分比%</font>，这类值是相对于纸张宽或高的比率。例如：

          </td>
        </tr>
        <tr>
          <td>

          <font color="#0000FF" size="2">ADD_PRINT_RECT(</font><font color="#FF0000" size="2">&quot;0%&quot;,&quot;0%&quot;,&quot;100%&quot;,&quot;100%&quot;,</font><font color="#0000FF" size="2">0,1);</font>

          </td>
        </tr>
        <tr style="padding:0px 0px 7px 0px;border:inset 1px #f00;">
          <td  style="vertical-Alignment: top" width="739">
          这行语句的参数含义是：矩形的上边距和左边距是0，其宽高与纸张的宽高100%一致。
          </td>
        </tr>
        <tr style="padding:0px 0px 7px 0px;border:inset 1px #f00;">
          <td  style="vertical-Alignment: top" width="739">
          </td>
        </tr>
        <tr style="padding:0px 0px 7px 0px;border:inset 1px #f00;">
          <td  style="vertical-Alignment: top" width="739">
          如下是相关函数清单(红色参数部分):
          </td>
        </tr>
        <tr style="padding:0px 0px 7px 0px;border:inset 1px #f00;">
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_TEXT(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strContent:);</font></td>                         
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"><font color="#0000FF" size="2">ADD_PRINT_HTM(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strHtml);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"><font color="#0000FF" size="2">ADD_PRINT_TABLE(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strHtml);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_URL(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strURL);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_IMAGE(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strHtml);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"><font color="#0000FF" size="2">ADD_PRINT_TBURL(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strURL);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"><font color="#0000FF" size="2">ADD_PRINT_HTML(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strHtml);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"><font color="#0000FF" size="2">ADD_PRINT_LINE(</font><font color="#FF0000" size="2">Top1,Left1,Top2,Left2,</font><font color="#0000FF" size="2">intLineStyle,intLineWidth);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_RECT(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">intLineStyle,intLineWidth);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_ELLIPSE(</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">intLineStyle,intLineWidth);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_SHAPE(intShapeType,</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">intLineStyle,intLineWidth);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          <font color="#0000FF" size="2">ADD_PRINT_TEXTA(strItemName,</font><font color="#FF0000" size="2">Top,Left,Width,Height,</font><font color="#0000FF" size="2">strContent);</font></td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">
          &nbsp;
          </td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739">现在演示在纸张的上半部画一个<b>贴边</b>椭圆，在下半部<b>贴边</b>打印如下表格，注意table的width和height也是百分比（100%），先进入<a href="javascript:myDesign()"><b>打印设计</b></a>看看，<a href="javascript:myPreview()">打印预览</a>时选一下其它纸张观察一下变化。</td>
        </tr>
        <tr>
          <td  style="vertical-Alignment: top" width="739"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<div id="table02">

<table border="1" width="100%" height="100%" style="border-collapse:collapse;border:1px solid black;"border-collapse:collapse>
  <tr>
    <td width="11%" align="center" style="border:1px solid">A1</td>
    <td width="9%" align="center" style="border:1px solid">B1</td>
    <td width="11%" align="center" style="border:1px solid">C1</td>
    <td width="9%" align="center" style="border:1px solid">D1</td>
    <td width="10%" align="center" style="border:1px solid">E1</td>
  </tr>
  <tr>
    <td width="11%" align="center" style="border:1px solid">A2</td>
    <td width="9%" align="center" style="border:1px solid">B2</td>
    <td width="11%" align="center" style="border:1px solid">C2</td>
    <td width="9%" align="center" style="border:1px solid">D2</td>
    <td width="10%" align="center" style="border:1px solid">E2</td>
  </tr>
  <tr>
    <td width="11%" align="center" style="border:1px solid">A3</td>
    <td width="9%" align="center" style="border:1px solid">B3</td>
    <td width="11%" align="center" style="border:1px solid">C3</td>
    <td width="9%" align="center" style="border:1px solid">D3</td>
    <td width="10%" align="center" style="border:1px solid">E3</td>
  </tr>
</table>
</div>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>

<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量 
	function myCreatePage() {		
		LODOP=getLodop(); 		
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_百分比单位演示");	
		LODOP.ADD_PRINT_ELLIPSE("0%","0%","100%","50%",0,1);
		LODOP.ADD_PRINT_TABLE("50%",1,"100%","49%","<body style='margin:0'>"+document.getElementById("table02").innerHTML+"</body>");
	};
	function myDesign() {		
		myCreatePage();
		LODOP.PRINT_DESIGN();		
	};		
	function myPreview() {		
		myCreatePage();
		LODOP.PREVIEW();		
	};		
</script>
</body>
</html>