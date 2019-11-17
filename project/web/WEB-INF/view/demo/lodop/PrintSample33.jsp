﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例33:如何实现清晰的图表打印二</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><b><font color="#009999">演示如何实现甘特图等的打印：</font></b></h2>
<h3><b>一、甘特图：</b></h3>
<div id="Div01">
<table border="1" width="67%">
  <tr>
    <td width="18%">工程甘特图</td>
    <td width="25%">计划开始</td>
    <td width="19%">计划完成</td>
    <td width="24%">实际开始</td>
    <td width="14%">实际完成</td>
  </tr>
  <tr>
    <td width="18%">启动</td>
    <td width="25%">2007-01-10</td>
    <td width="19%">2007-2-09</td>
    <td width="24%">2007-01-10</td>
    <td width="14%">2007-2-08</td>
  </tr>
  <tr>
    <td width="18%">设计</td>
    <td width="25%">2007-02-10</td>
    <td width="19%">2007-2-27</td>
    <td width="24%">2007-02-11</td>
    <td width="14%">2007-3-2</td>
  </tr>

  <tr>
    <td width="18%">实验</td>
    <td width="25%">2007-3-10</td>
    <td width="19%">2007-4-7</td>
    <td width="24%">2007-3-13</td>
    <td width="14%">2007-4-8</td>
  </tr>

  <tr>
    <td width="18%">施工</td>
    <td width="25%">2007-4-05</td>
    <td width="19%">2007-5-21</td>
    <td width="24%">2007-4-15</td>
    <td width="14%">2007-5-28</td>
  </tr>

  <tr>
    <td width="18%">验收</td>
    <td width="25%">2007-5-10</td>
    <td width="19%">2007-5-30</td>
    <td width="24%">2007-6-1</td>
    <td width="14%">2007-6-20</td>
  </tr>

</table>
</div>
<p>把以上表格数据<a href="javascript:myPreview7()">打印预览</a>成<b>甘特图</b>样式的图表,可进入<a href="javascript:myDesign7()">打印设计</a>调整一下，然后生成程序代码看有啥变化。 </p>                        

<h3><b>二</b><b>、箭头图：</b></h3>
<div id="Div02">
<table border="1" width="55%">
  <tr>
    <td width="20%">项目箭头图</td>
    <td width="20%">起点X</td>
    <td width="20%">起点Y</td>
    <td width="20%">终点X</td>
    <td width="20%">终点Y</td>
  </tr>
  <tr>
    <td width="20%">阶段一</td>
    <td width="20%">12</td>
    <td width="20%">15</td>
    <td width="20%">22</td>
    <td width="20%">31</td>
  </tr>
  <tr>
    <td width="20%">阶段二</td>
    <td width="20%">23</td>
    <td width="20%">38</td>
    <td width="20%">61</td>
    <td width="20%">63</td>
  </tr>

  <tr>
    <td width="20%">阶段三</td>
    <td width="20%">60</td>
    <td width="20%">50</td>
    <td width="20%">82</td>
    <td width="20%">88</td>
  </tr>

  <tr>
    <td width="20%">阶段四</td>
    <td width="20%">81</td>
    <td width="20%">89</td>
    <td width="20%">98</td>
    <td width="20%">92</td>
  </tr>

</table>
</div>
<p>把以上表格数据<a href="javascript:myPreview8()">打印预览</a>成<b>箭头图</b>样式的图表。 </p>                        

<h3><b>三、气泡图：</b></h3>
<div id="Div03">
<table border="1" width="55%">
  <tr>
    <td width="20%">气泡图</td>
    <td width="20%">位置X</td>
    <td width="20%">位置Y</td>
    <td width="20%">半径R</td>
  </tr>
  <tr>
    <td width="20%">泡泡一</td>
    <td width="20%">12</td>
    <td width="20%">15</td>
    <td width="20%">12</td>
  </tr>
  <tr>
    <td width="20%">泡泡二</td>
    <td width="20%">23</td>
    <td width="20%">38</td>
    <td width="20%">20</td>
  </tr>

  <tr>
    <td width="20%">泡泡三</td>
    <td width="20%">60</td>
    <td width="20%">50</td>
    <td width="20%">15</td>
  </tr>

  <tr>
    <td width="20%">泡泡四</td>
    <td width="20%">81</td>
    <td width="20%">89</td>
    <td width="20%">8</td>
  </tr>

</table>
</div>
<p>把以上表格数据<a href="javascript:myPreview9()">打印预览</a>成<b>气泡图</b>样式的图表。 </p>                        

<h3><b>四</b><b>、几何图：</b></h3>
<div id="Div04">
<table border="1" width="72%" height="328">
  <tr>
    <td width="17%" height="16">几何图</td>
    <td width="11%" height="16">位置X</td>
    <td width="9%" height="16">位置Y</td>
    <td width="8%" height="16">宽W</td>
    <td width="9%" height="16">高H</td>
    <td width="11%" height="16">图形代码</td>
    <td width="7%" height="16">颜色</td>
    <td width="8%" height="16">透明</td>
  </tr>
  <tr>
    <td width="17%" height="14">矩形</td>
    <td width="11%" height="14">10</td>
    <td width="9%" height="14">10</td>
    <td width="8%" height="14">50</td>
    <td width="9%" height="14">30</td>
    <td width="11%" height="14">0</td>
    <td width="7%" height="14">teal</td>
    <td width="8%" height="14">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">圆形</td>
    <td width="11%" height="16">5</td>
    <td width="9%" height="16">70</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">1</td>
    <td width="7%" height="16">255</td>
    <td width="8%" height="16">0</td>
  </tr>

  <tr>
    <td width="17%" height="16">竖线</td>
    <td width="11%" height="16">130</td>
    <td width="9%" height="16">90</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">2</td>
    <td width="7%" height="16">#FF0000</td>
    <td width="8%" height="16">0</td>
  </tr>

  <tr>
    <td width="17%" height="16">横线</td>
    <td width="11%" height="16">70</td>
    <td width="9%" height="16">140</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">3</td>
    <td width="7%" height="16">Green</td>
    <td width="8%" height="16">0</td>
  </tr>

  <tr>
    <td width="17%" height="16">三角形</td>
    <td width="11%" height="16">40</td>
    <td width="9%" height="16">10</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">4</td>
    <td width="7%" height="16">orange</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">倒三角形</td>
    <td width="11%" height="16">40</td>
    <td width="9%" height="16">60</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">5</td>
    <td width="7%" height="16">fuchsia</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">斜线</td>
    <td width="11%" height="16">130</td>
    <td width="9%" height="16">140</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">6</td>
    <td width="7%" height="16">#FF02FF</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">菱形</td>
    <td width="11%" height="16">40</td>
    <td width="9%" height="16">160</td>
    <td width="8%" height="16">40</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">7</td>
    <td width="7%" height="16">darkgreen</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">立方体</td>
    <td width="11%" height="16">5</td>
    <td width="9%" height="16">10</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">8</td>
    <td width="7%" height="16">#0000FF</td>
    <td width="8%" height="16">1</td>
  </tr>
  <tr>
    <td width="17%" height="16">十字线</td>
    <td width="11%" height="16">130</td>
    <td width="9%" height="16">10</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">9</td>
    <td width="7%" height="16">brown</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">斜十字线</td>
    <td width="11%" height="16">130</td>
    <td width="9%" height="16">90</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">10</td>
    <td width="7%" height="16">#00FFFF</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">米字线</td>
    <td width="11%" height="16">100</td>
    <td width="9%" height="16">150</td>
    <td width="8%" height="16">40</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">11</td>
    <td width="7%" height="16">darkRed</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">三角锥</td>
    <td width="11%" height="16">100</td>
    <td width="9%" height="16">10</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">12</td>
    <td width="7%" height="16">yellow</td>
    <td width="8%" height="16">0</td>
  </tr>
  <tr>
    <td width="17%" height="16">倒三角锥</td>
    <td width="11%" height="16">110</td>
    <td width="9%" height="16">60</td>
    <td width="8%" height="16">50</td>
    <td width="9%" height="16">40</td>
    <td width="11%" height="16">13</td>
    <td width="7%" height="16">gray</td>
    <td width="8%" height="16">0</td>
  </tr>

</table>
</div>
<p>把以上表格数据<a href="javascript:myPreview10()">打印预览</a>成各种（十四种）<b>几何图</b>。图形代码是0-13，颜色有RGB值、16进制组合值或英文名等三种描述法。 </p>                        

<p>　 </p>                        

<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量 
	function CreatePage(intChartType,strTableHTML) {
		LODOP=getLodop(); 
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_图表显示打印二");
		LODOP.ADD_PRINT_CHART(0,0,768,428,intChartType,strTableHTML);
	};
	function myPreview7() {		
		CreatePage(7,document.getElementById("Div01").innerHTML);//甘特图的代码是7
		LODOP.SET_PRINT_STYLEA(1,"ChartStyle","33--0-3-01---------");
		LODOP.PREVIEW();
	};
	function myDesign7() {		
		CreatePage(7,document.getElementById("Div01").innerHTML);
		LODOP.SET_PRINT_STYLEA(1,"ChartStyle","33--0-3-01---------");		
		LODOP.PRINT_DESIGN();
	};	
	function myPreview8() {		
		CreatePage(8,document.getElementById("Div02").innerHTML);//箭头图的代码是8
		LODOP.PREVIEW();
	};	
	function myPreview9() {		
		CreatePage(9,document.getElementById("Div03").innerHTML);//气泡图的代码是9
		LODOP.PREVIEW();
	};	
	function myPreview10() {		
		CreatePage(10,document.getElementById("Div04").innerHTML);//几何图的代码是10
		LODOP.PREVIEW();
//		LODOP.PRINT_DESIGN();
	};			
			
</script> 

<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>      

</body>
</html>