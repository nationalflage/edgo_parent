﻿<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例32:如何实现清晰的图表打印一</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
<object id="LODOP1" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
  <embed id="LODOP_EM1" TYPE="application/x-print-lodop" width=0 height=0 PLUGINSPAGE="install_lodop32.exe">
</object> 
</head>
<body><h2><b><font color="#009999">演示如何实现清晰的图表打印：</font></b></h2>

<div id="Div01">
<table border="1" width="55%">
  <tr>
    <td width="20%">图表标题</td>
    <td width="20%">产品A</td>
    <td width="20%">产品B</td>
    <td width="20%">产品C</td>
    <td width="20%">产品D</td>
  </tr>
  <tr>
    <td width="20%">上年</td>
    <td width="20%">100.5</td>
    <td width="20%">150.0</td>
    <td width="20%">260.5</td>
    <td width="20%">80.8</td>
  </tr>
  <tr>
    <td width="20%">本年</td>
    <td width="20%">95.0</td>
    <td width="20%">252.5</td>
    <td width="20%">200</td>
    <td width="20%">95</td>
  </tr>

</table>
</div>
<p> 利用控件函数<font color="#0000FF">ADD_PRINT_CHART</font>可以把以上通用表格数据直接<a href="javascript:myPREVIEW()">打印预览</a>成
<select size="1" id="Select01">
  <option value="0">折线图</option>
  <option value="1">柱状图</option>
  <option value="2">条形图</option>
  <option value="3">面积图</option>
  <option value="4">散点图</option>
  <option value="5">饼图</option>
  <option value="6">直线图</option>  
  <option value="1-6">柱状-直线图</option>  
</select>等各种样式的图表， </p>                        

<p> 清晰度比图片方式高很多。进入<a href="javascript:myDesign()">打印设计</a>双击图表可进行样式调整，满意后生成程序代码。 </p>                        

<p>也可以用控件函数<font color="#0000FF">SHOW_CHART</font>在页面内<a href="javascript:myShow()">显示该样式的图表</a>：（下面的画面不是网页图片哟） </p>                        

<object id="LODOP2" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=420 height=190> 
  <param name="Caption" value="图表显示区">
  <param name="Border" value="0">
  <param name="Color" value="white"> 
  <embed id="LODOP_EM2" TYPE="application/x-print-lodop" width=420 height=190 PLUGINSPAGE="install_lodop32.exe">
</object> 

<br><br>下面这<a href="javascript:myShow2()">饼图显示</a>与以上差异很大，都是ChartStyle的作用：<br>
<object id="LODOP3" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=420 height=290> 
  <param name="Caption" value="图表显示区">
  <param name="Border" value="0">
  <param name="Color" value="white"> 
  <embed id="LODOP_EM3" TYPE="application/x-print-lodop" width=420 height=290 PLUGINSPAGE="install_lodop32.exe">
</object> 

<div style="z-index: 10; position: absolute; top:710px; left:10px; height:20px;"> 
     <iframe style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0; 
         left: 0; scrolling: no;" frameborder="0" src="about:blank"></iframe> 
<font color="#FF0000">用"div+空iframe"可在Lodop上做浮动说明</font>
</div> 

<p>此外还可用专门的表格数据生成“甘特图”“箭头图”“气泡图”“几何图”等,请参考<a href="PrintSample33.html">样例33</a></p>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>      

<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function myPREVIEW() {	
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1'));  	
		CreatePage();
		LODOP.PREVIEW();
	};
	function myDesign() {	
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1'));  	
		CreatePage();
		LODOP.PRINT_DESIGN();

	};
	function CreatePage() {
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_图表显示打印");
		var intChartType=document.getElementById("Select01").value;
		var strTableHTML=document.getElementById("Div01").innerHTML;
		LODOP.ADD_PRINT_CHART(0,0,420,190,intChartType,strTableHTML);
	};
   	function myShow() {
		LODOP=getLodop(document.getElementById('LODOP2'),document.getElementById('LODOP_EM2')); 	    	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_图表显示打印");
		intChartType=document.getElementById("Select01").value;
		strTableHTML=document.getElementById("Div01").innerHTML;
		LODOP.ADD_PRINT_CHART(0,0,420,190,intChartType,strTableHTML);
		LODOP.SHOW_CHART();
  	};  
   	function myShow2() {
		LODOP=getLodop(document.getElementById('LODOP3'),document.getElementById('LODOP_EM3')); 	    	
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_图表显示打印");
		LODOP.ADD_PRINT_CHART(0,0,420,260,5,document.getElementById("Div01").innerHTML);
		LODOP.SET_PRINT_STYLEA(0,"ChartStyle","0000102001002360314");
		LODOP.SET_PRINT_STYLEA(0,"ChartTitle","产品销量饼图示意");
		LODOP.SET_PRINT_STYLEA(0,"ChartBKStartColor","#0080FF");
		LODOP.SET_PRINT_STYLEA(0,"ChartBKEndColor","#FF80C0");
		LODOP.SHOW_CHART();
  	}; 
	window.onload = function(){  
	    myShow();
	    myShow2();;
	};	
</script> 

</body>
</html>