﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十五:指定输出到哪些页</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示</font><font color="#009999">指定(或禁止)输出到哪一页，以及如何仅用来预览：</font></h2>

<p>用函数<font color="#0000ff">SET_PRINT_STYLEA</font>可以控制内容固定在哪些页输出，调用格式如下：</p>

<p><font color="#0000ff">SET_PRINT_STYLEA(varItemNameID,strStyleName,varStyleValue)</font></p>
<p>参数含义:</p>
<p><font color="#0000ff">varItemNameID</font> 打印对象的序号或名称，0表示最新对象</p>     
<p><font color="#0000ff">strStyleName </font><font color="#000000">控制关键字，“PageIndex”表示输出，“PageUnIndex”表示禁止</font></p>     
<p><font color="#0000ff">varStyleValue </font>控制字的值，first:第一页 last:最后页      
odd:奇数页 even:偶数页 或具体某页号(也可用表达式)</p>     
<p><font color="#009999" size="3">看看</font> 
<font size="2"><input type="button" value="打印预览" onClick="MyPreview()"></font>     
</p>
<p><font size="3"><br>注意：以上第一项内容通过“Repeat”实现有规则重复，多数类型对象都能做这个水印。</font>
</p>
<p><font size="3">最后一项通过设置“PreviewOnly”为真来实现“仅预览”不打印。而那个“矩形框”</font>
</p>
<p>是<font color="#0000FF">眉脚</font>属性，本来每页都出现，但最后页却未打，是被PageUnIndex禁止了。</font>
</p>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>
<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function MyPreview() {	
		CreatePages();		
		LODOP.PREVIEW();
	};
	function CreatePages(){	
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件Lodop功能演示_多页预览");
		LODOP.ADD_PRINT_TEXT(13,22,295,110,"有规则重复的内容");
		LODOP.SET_PRINT_STYLEA(0,"FontColor","#808080");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Angle",45);
		LODOP.SET_PRINT_STYLEA(0,"Repeat",true);
		for (i = 1; i <= 6; i++) {	
			LODOP.NewPage();		
			LODOP.ADD_PRINT_TEXT(30,100,200,20,"第"+i+"页的正常内容");
		}	
		LODOP.ADD_PRINT_RECT(10,18,400,300,0,1);	
	        LODOP.SET_PRINT_STYLEA(0,"ItemType",1);	//眉脚
		LODOP.SET_PRINT_STYLEA(0,"PageUnIndex","Last");	
		LODOP.ADD_PRINT_TEXT(100,33,200,20,"仅在首页才输出的内容");	
		LODOP.SET_PRINT_STYLEA(0,"PageIndex","first");	
		LODOP.ADD_PRINT_TEXT(130,33,200,20,"仅在奇数页才输出的内容");	
		LODOP.SET_PRINT_STYLEA(0,"PageIndex","odd");		
		LODOP.ADD_PRINT_TEXT(160,33,200,20,"仅在偶数页才输出的内容");
		LODOP.SET_PRINT_STYLEA(0,"PageIndex","even");			
		LODOP.ADD_PRINT_TEXT(190,33,200,20,"仅在尾页才输出的内容");
		LODOP.SET_PRINT_STYLEA(0,"PageIndex","last");	
		LODOP.ADD_PRINT_TEXT(220,33,300,20,"在某些页(第3页和倒数第2页)才输出的内容");
		LODOP.SET_PRINT_STYLEA(0,"PageIndex","3,Last-1");
		LODOP.ADD_PRINT_TEXT(256,33,200,20,"仅用来预览而不打印的内容");
		LODOP.SET_PRINT_STYLEA(0,"PreviewOnly",true);
		LODOP.ADD_PRINT_HTM(1,450,300,100,"超文本页号自行设置计算方式：<span tdata='pageNO-2'>第##页</span>/<span tdata='pageCount-2'>共##页</span>");
	        LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
      
		LODOP.SET_PRINT_STYLEA(0,"PageUnIndex","1,2");//前两页不显示该页号
	};	
</script>
</body>
</html>