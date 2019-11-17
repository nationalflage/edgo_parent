﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例三十五:获得打印结果和程序代码</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>
<h2><font color="#009999">演示如何获得打印结果和程序代码：</font>
</h2>
<table>
<tr><td>一般情况下，打印设计的程序代码需要用界面的“生成程序代码”菜单命令生成后，</td>
</tr>
<tr><td>手工复制出来融合到页面程序中使用。但实际上无论是<font color="#0000FF">直接打印、打印预览、打印维护</font>还是<font color="#0000FF">打印设计</font>，在运行结束或关闭窗口时都会返回相应的执行结果：</td></tr>
<tr><td><font color="#0000FF">直接打印</font><font color="#000000">返回逻辑真假结果（1或true代表真，false或0代表假），表示是否成功（关于进一步捕获打印状态<a href="PrintSample45.html">参考样例45</a>）；</font></td></tr>
<tr><td><font color="#0000FF">打印维护</font><font color="#000000">和</font><font color="#0000FF">打印预览</font><font color="#000000">返回打印次数，大于0表示打印成功的次数；</font></td></tr>
<tr><td><font color="#0000FF">打印设计</font><font color="#000000">窗口关闭后会自动生成程序代码并返给页面，页面程序可以进一步验证这些代码或提交保存；</font></td></tr>
<tr><td><font color="#0000FF">打印设计</font><font color="#000000">返回的程序代码借用js的 eval()函数 ，从而实现0内容开始的全动态设计；</font></td></tr>
</table>
<p><font size="2"><input type="button" value="打印预览" onclick="prn1_preview()">
<input type="button" value="打印维护" onclick="prn1_setup()">
<input type="button" value="打印设计" onclick="prn1_design()">
<input type="button" value="打印维护返回程序代码" onclick="prn2_setup()"></p>
<form method="POST" action="--WEBBOT-SELF--">
  <p><textarea rows="12" id="S1" cols="107" >返回的结果值</textarea>
<div id='id01'  disabled = true>
  <input type="button" value="用这些代码执行打印预览" id="button02"   onclick="prn2_Preview()"> 
  <input type="button" value="保存这些代码到本地文件" id="button03" onclick="myWriteFile(document.getElementById('S1').value)"> 
  <input type="button" value="导入程序代码" id="button04" onclick="document.getElementById('S1').value=myReadFile()"> 
  <input type="button" value="用以上代码设计并返回结果(循环互动)" id="button05"   onclick="prn2_design()"> 
</div>
</font>
</form>
<table>
<tr><td style="font-weight:bold">关于打印设计特别说明</td></tr>
<tr><td>1.<font color="#0000FF">打印预览</font>中有透明表格内容的演示</td></tr>
<tr><td>2.打印设计在生成程序代码时依据以下方法，让页面变量与数据项内容对接：
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color="#0000FF">LODOP.SET_PRINT_STYLEA(0,"ContentVName","变量名");</font>
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp例如：<font color="#0000FF">LODOP.ADD_PRINT_TEXT(256,61,191,30,"演示发货地址信息");</font>
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color="#0000FF">LODOP.SET_PRINT_STYLEA(0,"ContentVName","MyData");</font>
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp设计完毕，关闭设计窗口，设计时的内容自动替换为变量名称,关闭设计窗口生成代码如下:
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color="#0000FF">LODOP.ADD_PRINT_TEXT(256,61,191,30,MyData);</font>
<br>3.实例演示设计内容与变量转换对接:<input type="text" id="data01" size="30" value="泰安市青年路28号银泰大厦">点击<font color="#0000FF"><a href="javascript:void(0)" onclick="prn1_design();">打印设计</a></font>后点击<font color="#0000FF" ><a href="javascript:void(0)" onclick="prn2_Preview();">用设计生成代码预览</a></font>看<font color="red" >红色字体</font>显示效果</td></tr>
<tr><td><br><br><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'"><<回样例目录</a></td></tr>
<table>

<p></p>

<script language="javascript" type="text/javascript"> 
	var LODOP;  
	var MyData=document.getElementById('data01').value;
	var HtmStr="<!DOCTYPE>\n<style>table,td{border:1px solid black;}</style>\n<body style=\"background-color:transparent;margin:0\" >\n<table>\n<tr>\n<td>透明超文本表格</td>\n<td>预览就看出透明</td>\n<td>预览才看出透明</td>\n</tr>\n<tr>\n<td>非表格也能透明</td>\n<td>预览看出透明</td>\n<td>预览看出透明</td>\n</tr>\n</table>";	
	function prn1_preview() {	
		CreateOneFormPage();	
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};
		document.getElementById('S1').value="打印预览返回结果："+LODOP.PREVIEW();
		document.getElementById('id01').disabled = true;	
	};
	function prn1_setup() {		
		CreateOneFormPage();
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};
		document.getElementById('S1').value=LODOP.PRINT_SETUP();
		document.getElementById('id01').disabled = true;	
	};
	function prn1_design() {		
		CreateOneFormPage();
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};
		document.getElementById('S1').value=LODOP.PRINT_DESIGN();
		document.getElementById('id01').disabled = false; 	
	};
	function prn2_setup() {		
		CreateOneFormPage();
		LODOP.SET_PRINT_MODE("PRINT_SETUP_PROGRAM",true);
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};
		document.getElementById('S1').value=LODOP.PRINT_SETUP();
		document.getElementById('id01').display =false; 		
	};	
	function prn2_Preview() {
		MyData=document.getElementById('data01').value;	//打印前变量重读一下最新值
		LODOP=getLodop(); 		
		eval(document.getElementById('S1').value); 		
		if (LODOP.CVERSION) CLODOP.On_Return=null;
		LODOP.PREVIEW();
	};
	function prn2_design() {
		LODOP=getLodop(); 		
		eval(document.getElementById('S1').value); 
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value;};
		document.getElementById('S1').value=LODOP.PRINT_DESIGN();
	};		
	function CreateOneFormPage(){		
		MyData=document.getElementById('data01').value;	//打印前变量重读一下最新值
		LODOP=getLodop();                 
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_获得程序代码");
		LODOP.SET_PRINT_MODE("PROGRAM_CONTENT_BYVAR",true);//生成程序时，内容参数有变量用变量，无变量用具体值
		LODOP.ADD_PRINT_TEXTA("htm-1",12,228,317,30,"关闭本设计窗口会看到程序代码");		
        	LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
		LODOP.ADD_PRINT_ELLIPSE(168,29,100,60,0,1);
		LODOP.ADD_PRINT_BARCODE(190,483,213,60,"128A","123456789012");
		LODOP.SET_PRINT_STYLEA(0,"Color","#FF00FF");
		LODOP.ADD_PRINT_CHART(296,42,604,185,1,"");
		LODOP.ADD_PRINT_SHAPE(4,51,195,239,128,0,1,"#0080FF");
		LODOP.ADD_PRINT_HTM(141,377,261,161,HtmStr);
		LODOP.ADD_PRINT_TEXT(256,61,324,30,"演示发货地址信息");
		LODOP.SET_PRINT_STYLEA(0,"ContentVName","MyData");//设置内容参数的变量名
		LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
		LODOP.SET_PRINT_STYLEA(0,"FontColor","#FF0000");
	};
	function myWriteFile(strText){
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){
			var strFilename=Value;
			CLODOP.On_Return=function(TaskID,Value){alert(Value)};
			LODOP.WRITE_FILE_TEXT(0,strFilename,strText);
		};
		var strFilename=LODOP.GET_DIALOG_VALUE("LocalFileFullNameforSave","保存的新文件名.txt");
	 	if (!LODOP.CVERSION) {
			alert(LODOP.WRITE_FILE_TEXT(0,strFilename,strText));
		};
	};
	function myReadFile() {
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){
			var strFilename=Value;
			CLODOP.On_Return=function(TaskID,Value){document.getElementById('S1').value=Value};
			LODOP.GET_FILE_TEXT(strFilename);
		};
		var strFilename=LODOP.GET_DIALOG_VALUE("LocalFileFullNameforOpen","导入的文件名.txt");
	 	if (!LODOP.CVERSION) {
			return LODOP.GET_FILE_TEXT(strFilename);
		};		
		
	};
</script> 




</body>
</html>