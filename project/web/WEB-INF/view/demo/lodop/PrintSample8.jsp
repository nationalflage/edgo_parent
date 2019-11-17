﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例八:打印网页图片</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><b><font color="#009999">演示打印网页图片：</font></b></h2>
<p>利用<font color="#0000FF">ADD_PRINT_IMAGE和SET_PRINT_STYLEA</font>函数可以缩放打印图片，用IMG标签打印WEB图片，用全路径打印本地图片。 </p>

<p>下面是互联网上的一个图片： </p>

<img border="0" src="http://s1.sinaimg.cn/middle/4fe4ba17hb5afe2caa990&690" width=345 height=250 />&nbsp;

<p>1：看到图片了吗（没有联网可能看不到哟）？如果能看到就可以打印出来，</p>

<p>&nbsp;先<a href="javascript:myPreview1()">打印预览1</a>，感觉满意可<a href="javascript:myPrint1()">直接打印</a>  
 ，如不满意可用<a href="javascript:myPrintSetup1()">打印维护</a>调整。</p>     

<p>&nbsp;这种（默认）方式为截取模式，即当设定区域小于实际图时会截掉剩余的。</p>

<p>下面演示另外两种模式：</p>

<p>2：(可变形)扩展缩放模式，放大成600px×250px看看<a href="javascript:myPreview2();">打印预览2</a>。</p>

<p>3：按原图比例（不变形）缩放打印模式，看看<a href="javascript:myPreview3();">打印预览3</a>。</p>

<p>4：打印透明图片见<a href="javascript:myPreview4();">打印预览4</a>或公章请参考<a href="PrintSample37.html">样例37</a>。
</p>

<p>5：用BASE64编码图片请参考<a href="PrintSample38.html">样例38</a>。
</p>

<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>

<script language="javascript" type="text/javascript"> 
        var LODOP; //声明为全局变量
	function CreateImage() {
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印图片1");
		LODOP.ADD_PRINT_IMAGE(30,150,400,400,"<img border='0' src='http://s1.sinaimg.cn/middle/4fe4ba17hb5afe2caa990&690' />");
		//LODOP.ADD_PRINT_IMAGE(200,150,260,150,"C:/test.jpg"); //本地图片
	};	
	function myPreview1() {		
		CreateImage();
		LODOP.PREVIEW();		
	};	
	function myPrint1() {		
		CreateImage();
		LODOP.PRINT();		
	};  
	function myPrintSetup1() {		
		CreateImage();
		LODOP.PRINT_SETUP();		
	}; 		

	function myPreview2() {	
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印图片2");
		LODOP.ADD_PRINT_IMAGE(30,20,600,250,"<img border='0' src='http://s1.sinaimg.cn/middle/4fe4ba17hb5afe2caa990&690'width='100%' height='250'/>");
		LODOP.SET_PRINT_STYLEA(0,"Stretch",1);//(可变形)扩展缩放模式
		LODOP.PREVIEW();
	};	
	function myPreview3() {	
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印图片3");
		LODOP.ADD_PRINT_IMAGE(30,20,600,600,"<img border='0' src='http://s1.sinaimg.cn/middle/4fe4ba17hb5afe2caa990&690' />");
		LODOP.SET_PRINT_STYLEA(0,"Stretch",2);//按原图比例(不变形)缩放模式
		LODOP.PREVIEW();		
	};	
	function myPreview4() {	
		LODOP=getLodop();  	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印图片4");
		LODOP.ADD_PRINT_TEXT(56,56,200,20,"公章底下的文字");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
		LODOP.ADD_PRINT_IMAGE(28,49,171,153,"<img border='0' src='http://static15.photo.sina.com.cn/middle/4fe4ba17t993d651b55ce&690' />");
		LODOP.SET_PRINT_STYLEA(0,"TransColor","#FFFFFF");
		LODOP.ADD_PRINT_TEXT(120,53,200,20,"公章上面的文字");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
		LODOP.PREVIEW();
	};			
</script> 

</body>
</html>