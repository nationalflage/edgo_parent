﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例五十:演示文档式模板生成和使用</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body><h2><b><font color="#009999">演示文档式模板生成和使用：</font></b></h2>
&nbsp;&nbsp;&nbsp;&nbsp;Lodop传统模板可以称为“JS语句组式模板”，在<a href="PrintSample35.html" target="_blank">样例35</a>
和<a href="PrintSample36.html" target="_blank">样例36</a>都有演示，这种模板需要JS的eval方法来装载。<br><br>
本例演示的“文档式模板”不再依赖该方法，直接用Lodop的语句<font color="#0000FF">ADD_PRINT_DATA</font>就可装载复用。

<p><b>一、 文档模板的生成： </b></p>                
生成文档模板的方法是<font color="#0000FF">LODOP.GET_VALUE("ProgramData",0);</font>语句，其中参数ProgramData是固定关键字，<br><br>
参数0代表全部模板内容（含初始化语句）,生成之前先点一下<a href="javascript:DisplayDesign()">打印设计</a>开启设计界面:<br>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=800 height=400> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=820 height=450 pluginspage="install_lodop32.exe"></embed>
</object> 
  

<p>再点<a href="javascript:getProgramData()">生成模板</a>看看获取的文档模板到底啥样：</p>
<textarea rows="10" id="S1" cols="98" >返回的结果值</textarea>
<p>以上文档是特殊格式的BASE64字符，符合该编码集范畴，很容易保存(参考<a href="PrintSample35.html" target="_blank">样例35</a>)和网络传递。

<p><b>二、 文档模板的使用：</b></p> 
点<a href="javascript:DesignByPRGData()">加载模板</a>使用以上模板再次设计，或直接使用模板进行<a href="javascript:PreviewByPRGData()">打印预览</a>，
模板加载后用<font color="#0000FF">SET_PRINT_STYLEA</font>语句赋值。
<br>


<p><b>三、相关语句的参数含义：</b><br>
1.GET_VALUE (ValueType, ValueIndex);<br>
<font color="#0000FF">ValueType</font>：获得文档式模板关键字是“ProgramData”：; 
<br>
<font color="#0000FF">intModeValue</font> 0-全部模板;1-不包含初始化语句的模板。 </p>      

<br>
2.ADD_PRINT_DATA(strDataStyle, varDataValue);<br>
</font><font color="#0000FF">strDataStyle</font>：加载文档式模板的关键字是“ProgramData”; <br>
<font color="#0000FF">varDataValue</font>：文档式模板内容。 </p><br>      
3.SET_PRINT_STYLEA(varItemNameID, strStyleName,varStyleValue);<br>
</font><font color="#0000FF">
strStyleName</font>：关键字参数值是“CONTENT”; 
<br> </p>      


<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
 </p>      

<script language="javascript" type="text/javascript"> 
	var LODOP; 
	function DisplayDesign() {		
		CreatePage();	
		LODOP.SET_SHOW_MODE("DESIGN_IN_BROWSE",1);		  
	   	LODOP.PRINT_DESIGN();       		
	};
	function getProgramData() {	
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 
		if (LODOP.CVERSION) LODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};	
		document.getElementById('S1').value=LODOP.GET_VALUE("ProgramData",0);	//获得文档式模板

	};
	function DesignByPRGData() {		
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 
		LODOP.ADD_PRINT_DATA("ProgramData",document.getElementById('S1').value); //装载模板
		//按类名赋值
		LODOP.SET_PRINT_STYLEA("jj_xm","CONTENT","张三");
		LODOP.SET_PRINT_STYLEA("jj_dz","CONTENT","北京昌平昌盛路XX号");
		LODOP.SET_PRINT_STYLEA("jj_dh","CONTENT","18612345678");
		LODOP.SET_PRINT_STYLEA("sj_xm","CONTENT","李四");
		LODOP.SET_PRINT_STYLEA("sj_dz","CONTENT","山东泰安市泰山区青年路28号银泰大厦");
		LODOP.SET_PRINT_STYLEA("sj_dh","CONTENT","15612345678");
		LODOP.SET_SHOW_MODE("DESIGN_IN_BROWSE",1);
		LODOP.PRINT_DESIGN();
	};
	function PreviewByPRGData() {		
		LODOP=getLodop(); 
		LODOP.ADD_PRINT_DATA("ProgramData",document.getElementById('S1').value); //装载模板
		//按类名赋值
		LODOP.SET_PRINT_STYLEA("jj_xm","CONTENT","张三");
		LODOP.SET_PRINT_STYLEA("jj_dz","CONTENT","北京昌平昌盛路XX号");
		LODOP.SET_PRINT_STYLEA("jj_dh","CONTENT","18612345678");
		LODOP.SET_PRINT_STYLEA("sj_xm","CONTENT","李四");
		LODOP.SET_PRINT_STYLEA("sj_dz","CONTENT","山东泰安市泰山区青年路28号银泰大厦");
		LODOP.SET_PRINT_STYLEA("sj_dh","CONTENT","15612345678");
		LODOP.PREVIEW();
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 
	};
	
	function CreatePage() {
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP.PRINT_INITA(0,0,665,600,"打印控件功能演示_Lodop功能_演示文档式模板生成和使用");
		LODOP.ADD_PRINT_TEXTA("jj_xm",83,78,75,20,"寄件人姓名");
		LODOP.ADD_PRINT_TEXTA("jj_dz",134,90,238,35,"寄件人的详细地址");
		LODOP.ADD_PRINT_TEXTA("jj_dh",83,212,100,20,"寄件人电话");
		LODOP.ADD_PRINT_TEXTA("sj_xm",85,391,75,20,"收件人姓名");
		LODOP.ADD_PRINT_TEXTA("sj_dz",137,403,244,35,"收件人详细地址");
		LODOP.ADD_PRINT_TEXTA("sj_dh",80,554,75,20,"收件人电话");
		
	};
	//赋值并输出
				
</script> 

</body>
</html>