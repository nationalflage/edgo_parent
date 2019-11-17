﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十九:内嵌显示以及预览时包含背景图</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body><h2><b><font color="#009999">演示如何内嵌显示以及预览时包含背景图：</font></b></h2>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=820 height=450> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=820 height=450 pluginspage="install_lodop32.exe"></embed>
</object> 

<p>一、 利用设置显示模式函数SET_SHOW_MODE可让控件界面内嵌到以上页面显示区域： </p>                

<p>演示<a href="javascript:myShow1()">打印预览</a>界面、<a href="javascript:myShow2()">打印维护</a>界面、<a href="javascript:myShow3()">打印设计</a>界面，该功能特有益于Lodop集成到其它系统(如CS)。</p>   

<p>二、利用SET_SHOW_MODE还可以在打印预览时内含背景图（当然实际打印时不输出背景图）</p>
<p>演示含背景图的普通<a href="javascript:myShow4()">打印预览</a>,既含背景图又内嵌显示的<a href="javascript:myShow5()">打印预览&nbsp;</a></p>

<p>三、用SET_SHOW_MODE可隐藏预览窗口中的“打印”、“设置”、“关闭”按钮和“缩放比例”等，看一下隐藏后<a href="javascript:myShow6()">打印预览</a>。</p>


<p>四、用SET_SHOW_MODE可动态设置打印设计和预览界面的语言:<select size="1" id="language">
  <option value="0">Simplified Chinese</option>
  <option value="1">English</option>  
  <option value="2">Traditional Chinese</option> 
</select>
进入<a href="javascript:myShow7()">打印设计</a>。</p>


<p>五、该函数的语法和解释如下：<font color="#0000FF"><br>
SET_SHOW_MODE(strModeType,intModeValue)<br>
</font><font size="3"><i>参数含义：</i></font><font color="#0000FF"><br>
strModeType</font>：模式类型有“PREVIEW_IN_BROWSE”“SETUP_IN_BROWSE”“DESIGN_IN_BROWSE”“BKIMG_IN_PREVIEW”等等; 
<br>
<font color="#0000FF">intModeValue</font>：1-表示是，0或其它-表示不是(不调用本函数也表示不是)。 </p>      

<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
 </p>      

<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function myShow1() {		
		CreatePage();
		LODOP.SET_SHOW_MODE("PREVIEW_IN_BROWSE",1);
		LODOP.SET_SHOW_MODE("HIDE_PAPER_BOARD",1);
		LODOP.PREVIEW();		
	};	
	function myShow2() {		
		CreatePage();
		LODOP.SET_SHOW_MODE("SETUP_IN_BROWSE",1);
		LODOP.PRINT_SETUP();		
	};
	function myShow3() {		
		CreatePage();
		LODOP.SET_SHOW_MODE("DESIGN_IN_BROWSE",1);
		LODOP.PRINT_DESIGN();		
	};	
	function myShow4() {		
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690'>");
		LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",1); //注："BKIMG_IN_PREVIEW"-预览包含背景图 "BKIMG_IN_FIRSTPAGE"- 仅首页包含背景图		
		LODOP.PREVIEW();		
	};	
	function myShow5() {		
		CreatePage();
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='http://s1.sinaimg.cn/middle/721e77e5t99431b026bd0&690'>");
		LODOP.SET_SHOW_MODE("PREVIEW_IN_BROWSE",1);
		LODOP.SET_SHOW_MODE("HIDE_PAPER_BOARD",1);
		LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",1);
		LODOP.PREVIEW();
	};
	function myShow6() {		
		CreatePage();
		LODOP.SET_SHOW_MODE("HIDE_PBUTTIN_PREVIEW",1);//隐藏打印按钮
		LODOP.SET_SHOW_MODE("HIDE_SBUTTIN_PREVIEW",1);//隐藏设置按钮
		LODOP.SET_SHOW_MODE("HIDE_PAGE_PERCENT",1);//隐藏缩放比例下拉选框
		LODOP.SET_SHOW_MODE("HIDE_QBUTTIN_PREVIEW",1);//隐藏关闭按钮
		LODOP.SET_SHOW_MODE("PREVIEW_NO_MINIMIZE",1);//禁止预览窗口最小化并始终显示在最前面
		LODOP.PREVIEW();
	};	
	function myShow7() {
	    var LODOP01=getLodop();
		LODOP01.PRINT_INITA(4,10,665,600,"打印控件功能演示_Lodop功能_语言选择");
		LODOP01.SET_SHOW_MODE("LANGUAGE",document.getElementById('language').value);
		LODOP01.ADD_PRINT_TEXT(20,233,192,37,"注意界以上文字语言的变化！");
		LODOP01.PRINT_DESIGN();
	};		
	function CreatePage() {
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP.PRINT_INITA(4,10,665,600,"打印控件功能演示_Lodop功能_显示模式");
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