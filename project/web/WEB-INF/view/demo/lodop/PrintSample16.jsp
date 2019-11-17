﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十六:设置各种样式的打印预览窗口</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示设置各种样式的打印预览窗口：</font>
</h2>
<p>预览窗口可以通过如下函数进行设置，以便适应不同的预览需要：</p>  
<p><font color="#0000FF">SET_PREVIEW_WINDOW(intDispMode,intToolMode,blDirectPrint,intWidth,intHeight,strTitleButtonCaptoin)</font></p>  
<p>参数含义:</p>  
<p><font color="#0000FF">intDispMode</font><font color="#0000FF">：</font>预览比例，数字型，0-适高&nbsp;                 
1-正常大小&nbsp; 2-适宽</p>                   
<p><font color="#0000FF">intToolMode：</font><span>工具条和按钮，数字型</span><span>&nbsp;                 
0-</span><span>显示(上方)工具栏</span><span lang="EN-US" style="color:black">&nbsp;&nbsp;                 
1-</span><span>显示(下方)按钮栏</span><span lang="EN-US" style="color:black">&nbsp;&nbsp;&nbsp;                 
2-</span><span>两个都显示</span><span lang="EN-US" style="color:black">&nbsp;&nbsp;                 
3-</span><span>两个都不显示</span><span lang="EN-US" style="color:black"> <o:p>
</o:p>
</span></p>   
<p><font color="#0000FF">blDirectPrint</font><font color="#0000FF">：</font>
<span>打印按钮是否“直接打印”                      
1-是&nbsp; 0-否（弹出界面“选机打印”）</span></p>                      
<p><font color="#0000FF">intWidth,intHeight </font>窗口的宽和高，整数型，单位是<span>px</span></p>                      
<p><font color="#0000FF">strTitleButtonCaptoin </font><span>预览窗口和打印按钮的名称组合，字符型，用“点”分隔</span></p>  
<p><span>演示如下<b>：</b></span></p>  
<p>A、以普通方式<a href="javascript:myPreview1()">打印预览1</a>（窗口满屏）,自定窗口大小的<a href="javascript:myPreview2()">打印预览2</a>
<p>B、无工具条和按钮的小窗口纯<a href="javascript:myPreview3()">预览3</a><p>C、带“开始打印”和“关闭”按钮的<a href="javascript:myPreview4()">预览4</a>，窗口始终在最前面，不能最小化。 
<p>D、为形象显示打印方向与走纸方向的关系，<a href="javascript:myPreview1()">打印预览1</a>底图上有模拟走纸板的条纹线，可以隐藏该条线，见
<a href="javascript:myPreview5()">打印预览5</a>。
<p>E、一般横向<a href="javascript:myPreview6()">打印预览6</a>的内容是旋转90度以准确描述横向的含义，可以设置成正向显示以符合传统习惯，见<a href="javascript:myPreview7()">打印预览7</a>。
<br><i>(注意传统习惯是错误的,尽管看上去“顺眼”，但很容易让操作者误以为横向打印要旋转纸张)</i>
<p>F、带“打印”和“关闭”按钮的<a href="javascript:myPreview8()">打印预览8</a>，其中打印按钮会弹出选机窗口,程序控制打印后自动关闭窗口。
<p>G、要显示预览窗口的标尺参考<a href="javascript:myPreview9()">打印预览9</a>(看不到时请在预览界面右键菜单里选"显示标尺")<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>
<script language="javascript" type="text/javascript">
        var LODOP; //声明为全局变量 
	function myPreview1() {	
		CreateOnePage();	
		LODOP.PREVIEW();	
	};
	function myPreview2() {	
		CreateOnePage();		
		LODOP.SET_PREVIEW_WINDOW(0,0,0,760,540,"");	
		LODOP.PREVIEW();	
	}
	function myPreview3() {	
		CreateOnePage();		
		LODOP.SET_PREVIEW_WINDOW(0,3,0,600,400,"");	
		LODOP.PREVIEW();	
	};	
	function myPreview4() {	
		CreateOnePage();	
		LODOP.SET_PREVIEW_WINDOW(0,1,1,800,600,"自定义标题.开始打印");
		LODOP.SET_SHOW_MODE("PREVIEW_NO_MINIMIZE",true);//预览窗口禁止最小化，并始终最前	
		LODOP.PREVIEW();	
	};	
	function myPreview5() {	
		CreateOnePage();	
		LODOP.SET_SHOW_MODE("HIDE_PAPER_BOARD",1);
		LODOP.PREVIEW();	
	};	
	function myPreview6() {	
		CreateOnePage();	
		LODOP.SET_PRINT_PAGESIZE(2,0,0,"");
		LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");	
		LODOP.PREVIEW();	
	};	
	function myPreview7() {	
		CreateOnePage();	
		LODOP.SET_PRINT_PAGESIZE(2,0,0,"");
		LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");	
		LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);//横向时的正向显示
		LODOP.PREVIEW();	
	};
	function myPreview8() {	
		CreateOnePage();	
		LODOP.SET_PREVIEW_WINDOW(0,1,0,800,600,"");//打印前弹出选择打印机的对话框	
		LODOP.SET_PRINT_MODE("AUTO_CLOSE_PREWINDOW",1);//打印后自动关闭预览窗口
		LODOP.PREVIEW();	
	};	
	function myPreview9() {	
		CreateOnePage();	
		LODOP.SET_SHOW_MODE("SHOW_SCALEBAR",true);//语句控制显示标尺（需高级注册才行）
		LODOP.PREVIEW();	
	};						
	function CreateOnePage(){
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_设置预览窗口界面");
		LODOP.SET_PRINT_PAGESIZE(1,1380,880,"");
		LODOP.ADD_PRINT_TEXT(80,100,400,35,"观察预览窗口的变化");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",30);
			
	};	
</script> 





</body>
</html>