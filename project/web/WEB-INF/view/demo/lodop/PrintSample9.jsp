﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例九:程序方式装载背景图</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><b><font color="#009999">演示用程序方式加载背景图：</font></b></h2>
<p>&nbsp;&nbsp;&nbsp; 用户在进入<a href="javascript:myPrintSetup1()">打印维护</a>界面后，可以用“装载背景图”菜单手工载入套打用的背景图， </p>               
<p>页面也可以用程序方式提前加载好背景图，加载函数的格式如下： </p>
<p><font color="#0000ff" size="3">ADD_PRINT_SETUP_BKIMG(strHtmFile);</font>这里  
<font color="#0000ff" size="3">strHtmFile</font>可以是WEB图片，也可以是本地图片。</p>
<p><b>1、加载WEB图片</b> </p>
<p>下面是互联网上的一个图片，进入以它为背景图的<a href="javascript:myPrintSetup2()">打印维护</a>看看。</p>
<p><img border="0" src="http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690" width="336" height="242">&nbsp;</p>
<p>&nbsp;&nbsp; 看到以上图片了吗,如果看不到就另选一个试试。</p>   
<p><b>2、加载本地图片</b></p>
<p>选择本地图片(JPG或BMP)文件  
<a href="javascript:;" onclick="javascript:document.getElementById('file1').value=getImageFileName()">选文件..</a>
<input type="text" id="file1" size="40" >  
 用它做背景进入<a href="javascript:myPrintSetup3()">打印维护</a>。</p>  
<p><b>3、指定背景图的位置和大小</b> </p>
<p>用函数<font color="#0000FF">SET_SHOW_MODE</font>的类型<font color="#0000FF"><font size="3">BKIMG_LEFT</font></font><font size="3">、<font color="#0000FF">BKIMG_TOP</font>、<font color="#0000FF">BKIMG_WIDTH</font>、</font><font color="#0000FF"><font size="3">BKIMG_HEIGHT</font></font>可以设置背景图的位置和大小，</p>
<p>类型<font color="#0000FF">BKIMG_IN_PREVIEW</font>设置打印预览时是否显示背景图（默认情况下仅在打印维护中显示）点<a href="javascript:myPrintDesign3()">打印设计</a>看看背景图放大和偏移。</p>
<p><b>4、打印(和预览)时包含背景图</b> </p>
<p>默认情况下背景图是不打印的，可以用BKIMG_PRINT让<a href="javascript:myPreview1()">打印或预览</a>包含背景图。</p>

<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>

<script language="javascript" type="text/javascript"> 
        var LODOP; //声明为全局变量
        function getImageFileName() {
		LODOP=getLodop(); 
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('file1').value=Value;};
		return  LODOP.GET_DIALOG_VALUE("LocalFileFullName","*.jpg;*.bmp;.jpeg");
        } 
	function myPrintSetup1() {		
		CreatePage();
		LODOP.PRINT_SETUP();		
	};
	function myPrintSetup2() {		
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690'>");
		LODOP.PRINT_SETUP();		
	};		
	function myPrintSetup3() {		
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG(document.getElementById('file1').value);
		LODOP.PRINT_SETUP();		
	};	
	function myPrintDesign3(){
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690'>");
		LODOP.SET_SHOW_MODE("BKIMG_LEFT",1);
		LODOP.SET_SHOW_MODE("BKIMG_TOP",1);
		LODOP.SET_SHOW_MODE("BKIMG_WIDTH","183mm");
		//LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","99mm"); //这句可不加，因宽高比例固定按原图的
		LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",1);		
		LODOP.PRINT_DESIGN();		
	};	
	function myPreview1(){
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690'>");
		LODOP.SET_SHOW_MODE("BKIMG_PRINT",1);		
		LODOP.PREVIEW();		
	};	
	function CreatePage() {
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_装载背景图");
		LODOP.ADD_PRINT_TEXT(83,78,75,20,"寄件人姓名");
		LODOP.ADD_PRINT_TEXT(109,137,194,20,"寄件人单位名称");
		LODOP.ADD_PRINT_TEXT(134,90,238,35,"寄件人的详细地址");
		LODOP.ADD_PRINT_TEXT(85,391,75,20,"收件人姓名");
		LODOP.ADD_PRINT_TEXT(108,440,208,20,"收件人单位名称");
		LODOP.ADD_PRINT_TEXT(137,403,244,35,"收件人详细地址");
		LODOP.ADD_PRINT_TEXT(252,33,164,40,"内件品名");
		LODOP.ADD_PRINT_TEXT(261,221,100,20,"内件数量");
		LODOP.ADD_PRINT_TEXT(83,212,100,20,"寄件人电话");
		LODOP.ADD_PRINT_TEXT(80,554,75,20,"收件人电话");
};
			
</script> 


</body>
</html>