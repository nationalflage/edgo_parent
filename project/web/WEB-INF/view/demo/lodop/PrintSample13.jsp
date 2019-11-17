﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十三:页内部分内容旋转</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示页内部分内容旋转：</font>
</h2>
<p><b>一、纯文本内容旋转的设置函数如下：</b></p>  
<p><font color="#0000FF">SET_PRINT_STYLEA(varItemNameID,strStyleName,varStyleValue)</font></p>  
<p>参数含义:</p>  
<p><font color="#0000FF">varItemNameID</font> 打印对象的序号或名称(0代表最后一个)</p>    
<p><font color="#0000FF">strStyleName </font><font color="#000000">风格名称，这里为“Angle”</font></p>     
<p><font color="#0000FF">varStyleValue </font><font color="#000000">逆时针旋转角度数，单位是度，0度表示不旋转，可设置任意角度旋转。</font></p>  

<p><font color="#000000">（注意打印设计看不到旋转效果，进入预览才行，旋转时以左上角为原点）</font></p> 

<p><font color="#000000"><b>二、超文本旋转用</b></font><font color="#0000FF">writeing-mode:tb-rl</font><font color="#000000"><b>这个样式(</b></font><font color="#0000FF">Style</font><b><font color="#000000">)，只能旋转90度。</font></b></p>  


<p><font size="2"><input type="button" value="打印预览" onclick="prn1_preview()"><input type="button" value="打印维护" onclick="prn1_setup()"><input type="button" value="打印设计" onclick="prn1_design()"><br>
</font>

<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>

<script language="javascript" type="text/javascript">
        var LODOP; //声明为全局变量 
	function prn1_preview() {	
		CreateOneFormPage();	
		LODOP.PREVIEW();	
	};
	function prn1_setup() {		
		CreateOneFormPage();
		LODOP.PRINT_SETUP();	
	};
	function prn1_design() {		
		CreateOneFormPage();
		LODOP.PRINT_DESIGN(); 	
	};	
	function CreateOneFormPage(){
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_内容旋转");
		LODOP.SET_PRINT_STYLE("FontName","黑体");
		LODOP.SET_PRINT_STYLE("FontSize",15);
		LODOP.ADD_PRINT_TEXT(71,162,120,35,"正常内容");
		LODOP.ADD_PRINT_TEXT(232,355,325,34,"纯文本逆时针旋转90度\n");
		LODOP.SET_PRINT_STYLEA(0,"Angle",90);
		LODOP.ADD_PRINT_TEXT(181,161,346,34,"纯文本逆时针旋转45度\n");
		LODOP.SET_PRINT_STYLEA(0,"Angle",45);
		LODOP.ADD_PRINT_HTM(230,98,163,200,"<table border=\"1\"><tr>\n<td style=\"writing-mode: tb-rl;\">旋转90度</td>\n<td>正常<p>超文本</p><p>内容</p></td>\n</tr></table>\n\n");
	};	
</script> 




</body>
</html>