﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例四十四:巧用ADD_PRINT_IMAGE实现超文本内容缩放打印</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h3><font color="#009999">巧用ADD_PRINT_IMAGE对超文本内容缩放打印：</font></h3>
<p>&nbsp;&nbsp;&nbsp; 函数<font color="#0000FF">ADD_PRINT_IMAGE</font>原本用来打印图片的,其优势是自由缩放打印(见<a href="PrintSample8.html" target="_blank">样例8</a>)，且因其图片来源可以是超文本(IMG标签)，二者结合能实现缩放打印普通超文本。</p>                                          
<p>Lodop最新版更强化了这个功能，只要内容不因超出范围而自动分页，控件则采用矢量快照模式，其清晰度和文本模式一样，且速度更快。</p>                        
<p>关键语句有如下两个：</p>                        

<p><font color="#0000FF">LODOP.ADD_PRINT_IMAGE(top,left,width,height,strHTML);</font></p>
<p><font color="#0000FF">LODOP.SET_PRINT_STYLEA(0,&quot;Stretch&quot;,ZMode);</font></p>
                                 
<p>其中<font color="#0000FF">Zmode=1</font>表示<b>变形缩放</b>，<font color="#0000FF">Zmode=2</font>表示<b>不变形缩放</b>，<font color="#0000FF">strHTML</font>即可以是超文本内容，也可以是“<font color="#0000FF">URL:WEB路径</font>”样式的WEB地址。</p>                        
<h3><font color="#009999">演示：</font></h3>  
1、缩放打印本页内容进入<a href="javascript:myPREVIEW1();">打印预览1</a>看看。
<p>
2、用<font color="#0000FF">URL:WEB路径</font>参数形式打印见<a href="javascript:myPREVIEW2();">打印预览2</a>。
</p>
<p>
3、以上打印过程因<font color="#0000FF">NOCLEAR_AFTER_PRINT</font>设为<font color="#0000FF">true</font>
,所有可再次执行<a href="javascript:myPREVIEW3();">打印预览3</a>(没点前面预览则空白)。
</p>
<p>
<a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
<script language="javascript" type="text/javascript">     
	var LODOP; //声明为全局变量
	function myPREVIEW1() {	
		LODOP=getLodop(); 
		LODOP.PRINT_INITA(0,0,800,706,"打印控件功能演示_Lodop功能_超文本内容缩放打印");
		LODOP.SET_PRINT_MODE("NOCLEAR_AFTER_PRINT",true);
		LODOP.ADD_PRINT_RECT(9,24,202,695,0,1);
		LODOP.ADD_PRINT_RECT(11,245,542,582,0,1);
		LODOP.ADD_PRINT_IMAGE(11,45,173,689,document.documentElement.innerHTML);
		LODOP.SET_PRINT_STYLEA(0,"Stretch",1);
		LODOP.ADD_PRINT_IMAGE(45,275,491,538,document.documentElement.innerHTML);
		LODOP.SET_PRINT_STYLEA(0,"Stretch",2);
		LODOP.ADD_PRINT_TEXT(630,280,476,81,"以上演示本页内容被缩放打印到两个矩形区域，\n左边区域较窄，变形缩小打印，\n上边区域与内容相当，不变形缩放，矢量快照(推荐)。");
		LODOP.SET_PRINT_STYLEA(0,"FontColor","#FF0000");
		LODOP.PREVIEW();		
	};
	function myPREVIEW2() {	
		LODOP=getLodop(); 
		LODOP.PRINT_INITA(0,0,800,906,"打印控件功能演示_Lodop功能_超文本内容缩放打印");
		LODOP.SET_PRINT_MODE("NOCLEAR_AFTER_PRINT",true);
		LODOP.ADD_PRINT_RECT(19,12,771,517,0,1);
		LODOP.ADD_PRINT_RECT(547,18,372,250,0,1);
		LODOP.ADD_PRINT_RECT(547,403,372,250,0,1);
		LODOP.ADD_PRINT_HTML(20,13,762,510,"URL:http://www.baidu.com/");
		LODOP.ADD_PRINT_IMAGE(563,31,352,222,"URL:http://www.baidu.com/");
		LODOP.ADD_PRINT_IMAGE(554,408,362,241,"URL:http://www.baidu.com/");
		LODOP.SET_PRINT_STYLEA(0,"Stretch",1);
		LODOP.ADD_PRINT_TEXT(808,37,695,67,"上面的大区域演示ADD_PRINT_HTML(超文本图形模式函数)URL参数形式，原始大小，不超范围，矢量快照。\n左下脚区域演示ADD_PRINT_IMAGE的URL参数方式，原始大小，因超出被截取，图形模式。\n右下角区域演示ADD_PRINT_IMAGE的URL参数形式，整体缩小，不超范围，矢量快照。");
		LODOP.SET_PRINT_STYLEA(0,"FontColor","#FF0000");
		LODOP.PREVIEW();	
	};	
	function myPREVIEW3() {	
		LODOP=getLodop(); 
		LODOP.PREVIEW();			
	};	
</script>
</p>
</body>
</html>