﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十一:演示直接打印条形码</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="install_lodop32.exe"></embed>
</object> 
</head>
<body>

<h2><font color="#009999">演示如何打印条形码：</font>
</h2>
<p>Lodop绘制条码图功能让条码打印变得很简单，客户端不用安装专门的条码字库，该函数格式如下：<span LANG="ZH"><font color="#0000FF" size="3"><br>
ADD_PRINT_BARCODE(Top,Left,Width,Height,BarCodeType,BarCodeValue);</font></span></p>
<p>关键参数含义:</p>  
<p><span LANG="ZH"><font color="#0000FF" size="3">Width</font></span><font color="#0000FF"> </font><font color="#000000">条码的总宽度，计量单位px（1px=1/96英寸）<br>
</font><span LANG="ZH"><font color="#0000FF" size="3">Height</font></span><font color="#0000FF"> </font><font color="#000000">条码的总高度（一维条码时包括文字高度）</font><span LANG="ZH"><font color="#0000FF" size="3"><br>
BarCodeType</font></span> 条码的类型（规制）名称<span LANG="ZH"><font color="#0000FF" size="3"><br>                
BarCodeValue</font></span><font color="#0000FF"> </font><font color="#000000">条码值</font></p>   
<p><font size="3">目前控件支持的条码类型有如下26种，包含24种一维码和2种二维码： 
</font></p> 
<table border="1" width="62%" height="75"> 
  <tr> 
    <td width="20%" valign="top" height="69"><span LANG="ZH"><font color="#009999" size="3">128A<br>128B<br>128C<br> 
      128Auto<br>EAN8<br>
    EAN13</font></span></td>
    <td width="20%" valign="top" height="69"><span LANG="ZH">
    <font color="#009999" size="3">EAN128A<br>EAN128B<br>EAN128C<br>Code39<br>
    39Extended<br>
      2_5interleaved</font></span></td>
    <td width="20%" valign="top" height="69"><span LANG="ZH">
    <font color="#009999" size="3">2_5industrial<br>2_5matrix<br>UPC_A<br>
    UPC_E0<br>
      UPC_E1<br>UPCsupp2</font></span></td>
    <td width="20%" valign="top" height="69"><span LANG="ZH">
    <font color="#009999" size="3">UPCsupp5<br>Code93<br>
    93Extended<br>
      MSI<br>PostNet<br>Codabar</font></span></td>
    <td width="20%" valign="top" height="69"><span LANG="ZH"><font color="#0000FF" size="3">QRCode<br>
    PDF</font></span><font color="#0000FF">417</font></td>
  </tr>
</table>
<p><b>一、演示各种条码</b></p>    

<p>看看演示：<input type="button" value="打印预览" name="B3"  onclick="prn_Preview()"> 
<input type="button" value="打印设计" name="B3" onclick="prn_Design()"></p>       

<p>注意：打印设计中改变对象区域大小时，条码会自动随之适应调整，也可以360度范围随便定义旋转方向。</p>   

<p>双击对象，在弹出的属性窗口中修改其它属性，然后生成程序代码看看其实现方法。</p>   

 
<p><b>二、内嵌显示条码(及其它图形对象)</b></p> 
1:先点击<a href="javascript:myShow1()">显示条码</a>在如下区域直接绘制一个条码：
<br>2:再进入<a href="javascript:myShow2()">打印设计</a>加几个图类对象(图表、条码、图形图线、图片)，用其程序代码绘制如下：<br>
<object id="LODOP1" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=800 height=400> 
  <param name="Caption" value="显示区">
  <param name="Border" value="0">
  <param name="Color" value="white"> 
  <embed id="LODOP_EM1" TYPE="application/x-print-lodop" width=800 height=400 border=0 Color="white" PLUGINSPAGE="install_lodop.exe">
</object> 
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>

</p>
<script language="javascript" type="text/javascript">  
        var LODOP; //声明为全局变量  
	function prn_Preview() {		
		CreatePrintPage();
	  	LODOP.PREVIEW();		
	};
	function prn_Design() {		
		CreatePrintPage();
		LODOP.PRINT_DESIGN();		
	};	
	function CreatePrintPage() {
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1')); 
		LODOP.PRINT_INITA(0,0,800,1600,"打印控件功能演示_Lodop功能_打印条码");
		LODOP.ADD_PRINT_BARCODE(28,34,307,47,"128A","123456789012");
		LODOP.ADD_PRINT_BARCODE(88,32,206,78,"128B","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
		LODOP.ADD_PRINT_BARCODE(107,255,161,64,"128C","888888");
		LODOP.SET_PRINT_STYLEA(0,"Color","#FF0000");
		LODOP.ADD_PRINT_BARCODE(179,42,130,47,"128Auto","12345678901");
		LODOP.ADD_PRINT_BARCODE(252,42,153,54,"EAN8","12345678");
		LODOP.SET_PRINT_STYLEA(0,"Angle",180);
		LODOP.ADD_PRINT_BARCODE(173,244,235,172,"EAN13","1234567890123");
		LODOP.SET_PRINT_STYLEA(0,"Angle",35);
		LODOP.ADD_PRINT_BARCODE(351,34,360,36,"EAN128A","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"ShowBarText",0);
		LODOP.ADD_PRINT_BARCODE(403,34,360,47,"EAN128B","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"AlignJustify",2);
		LODOP.ADD_PRINT_BARCODE(462,34,360,47,"EAN128C","123456789012");
		LODOP.ADD_PRINT_BARCODE(513,34,360,47,"Code39","*123ABC4567890*");
		LODOP.SET_PRINT_STYLEA(0,"Color","#0000FF");
		LODOP.ADD_PRINT_BARCODE(570,34,360,47,"39Extended","*1234567890*");
		LODOP.ADD_PRINT_BARCODE(621,34,360,47,"2_5interleaved","123456789012");
		LODOP.ADD_PRINT_BARCODE(677,34,360,47,"2_5industrial","123456789012");
		LODOP.ADD_PRINT_BARCODE(729,34,360,47,"2_5matrix","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Color","#408080");
		LODOP.ADD_PRINT_BARCODE(787,34,360,47,"UPC_A","089600124569");
		LODOP.ADD_PRINT_BARCODE(844,34,135,64,"UPC_E0","08960007");
		LODOP.ADD_PRINT_BARCODE(65,595,45,95,"UPC_E1","1122333");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(87,676,57,122,"UPCsupp2","12345");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(359,435,78,181,"UPCsupp5","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(309,579,44,238,"Code93","BJ100080");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(241,663,73,246,"93Extended","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Angle",-90);
		LODOP.ADD_PRINT_BARCODE(583,419,58,251,"MSI","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Color","#FF00FF");
		LODOP.SET_PRINT_STYLEA(0,"ShowBarText",0);
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(589,504,74,270,"PostNet","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_BARCODE(565,626,115,253,"Codabar","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Angle",285);
		LODOP.ADD_PRINT_BARCODE(30,405,176,67,"PDF417","我是pdf417value");
		LODOP.ADD_PRINT_BARCODE(130,434,168,146,"QRCode","1234567890版本7的最大值是122个字符123123");
		LODOP.SET_PRINT_STYLEA(0,"GroundColor","#0080FF");
	};	
   	function myShow1() {
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1')); 	    	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_内嵌显示演示11");
		LODOP.ADD_PRINT_BARCODE(28,34,227,147,"128A","123456789012");
		LODOP.SHOW_CHART();
  	}; 
   	function myShow2() {
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1')); 
		LODOP.PRINT_INITA(0,0,800,400,"打印控件功能演示_Lodop功能_内嵌显示演示11_2");
		LODOP.ADD_PRINT_BARCODE(28,34,109,338,"128A","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_CHART(26,155,338,162,3,"空");
		LODOP.ADD_PRINT_RECT(46,538,131,107,0,1);
		LODOP.ADD_PRINT_SHAPE(5,260,559,100,60,0,1,"#FF00FF");
		LODOP.ADD_PRINT_IMAGE(232,200,282,92,"<img border='0' src='http://www.baidu.com/img/baidu_logo.gif'/>");
		LODOP.ADD_PRINT_LINE(206,558,207,658,0,1);
		LODOP.ADD_PRINT_LINE(160,605,242,606,0,1);
		var strProgram=LODOP.PRINT_DESIGN();
		eval(strProgram);
		LODOP.SHOW_CHART();
  	}; 
</script> 

</body>
</html>