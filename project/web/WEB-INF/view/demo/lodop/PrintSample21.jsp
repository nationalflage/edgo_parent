﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十一:控制打印维护的功能权限</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示如何控制打印维护的功能权限：</font>
</h2>
<p><b>一、控制界面的菜单</b></p>  
<p><font color="#0000FF">打印维护</font>的目标用户是页面操作者，开发者在根据业务需要将该界面提供给操作者时，</p>  
<p>有时会发现其默认功能权限不符合业务要求（亦多亦少），如下是默认的功能权限范围，</p>  
<p>试着改变勾选，看看演示程序是如何通过<font color="#0000FF">SET_SHOW_MODE</font>函数解决这一问题的。</p>  
<table border="1" width="73%">
  <tr>
    <td width="34%">
      <p style="line-height: 150%"><font color="#000000">
1：<input type="checkbox" id="C1" checked>位置移动和宽高调整<br>
2：<input type="checkbox" id="C2" checked>颜色选择<br>
3：<input type="checkbox" id="C3" checked>字体名选择<br>
4：<input type="checkbox" id="C4" checked>字大小选择<br>
5：<input type="checkbox" id="C5" checked>旋角调整<br>
6：<input type="checkbox" id="C6" checked>粗斜体功能条<br>
7：<input type="checkbox" id="C7" checked>线型功能条</font></td>
    <td width="66%">
      <p style="line-height: 150%"><font color="#000000">
&nbsp;8：<input type="checkbox" id="C8" checked>对齐功能条<br>
&nbsp;9：<input type="checkbox" id="C9" >删除功能<br>
10：<input type="checkbox" id="C10" >页眉设置<br>
11：<input type="checkbox" id="C11" >页脚设置<br>
12：<input type="checkbox" id="C12" >位置锁定功能<br>
13：<input type="checkbox" id="C13" >属性设置<br>
14：<input type="checkbox" id="C14" checked>显示关闭钮(界面内嵌时)</font></td>
  </tr>
</table>
<p>演示按以上选项进入<input type="button" value="打印维护1" onclick="MySetup1()">看看，     
注意观察对应的菜单和工具条有效情况，</p>  

以上选项顺序是严格固定的，系统默认控制串（SETUP_ENABLESS值)是“11111111000001”,注意<input type="button" value="打印设计2" onclick="MyDesign2()">是不受该函数控制的。   
<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function MySetup1() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印维护权限控制");
		LODOP.ADD_PRINT_TEXT(90,311,231,35,"打印维护权限控制");
		LODOP.SET_SHOW_MODE("SETUP_ENABLESS",getCheckSS());
		LODOP.PRINT_SETUP();	
	};
	function MyDesign2() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印设计权限控制");
		LODOP.ADD_PRINT_TEXT(90,311,231,35,"打印设计权限控制");
		LODOP.SET_SHOW_MODE("SETUP_ENABLESS",getCheckSS());
		LODOP.PRINT_DESIGN();	
	};	
	function getCheckSS(){
		strCheckSS="";
		for (i = 1; i < 15; i++) {
			if (document.getElementById("C"+i).checked) {
  				strCheckSS=strCheckSS+"1";
			} else {strCheckSS=strCheckSS+"0";}
		}
		return strCheckSS;
	};	
</script>
<p><b>二、控制数据的内容</b></p>
<p>默认情况下，<font color="#0000FF">打印维护</font>时的内容是禁止修改的，页面程序可以通过<font color="#0000FF">SET_PRINT_STYLEA</font>的“<font color="#0000FF">ReadOnly</font>”参数将相关数据对象改成可修改的，</p>
<p>进入<input type="button" value="打印维护3" onclick="MySetup3()">看看演示。</p>
<script language="javascript" type="text/javascript"> 
	function MySetup3() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印维护修改权控制");
		LODOP.ADD_PRINT_TEXT(90,300,236,35,"可修改的文本内容");
		LODOP.SET_PRINT_STYLEA(1,"ReadOnly",0);
		LODOP.ADD_PRINT_TEXT(150,301,234,35,"一般文本内容禁止修改");
		LODOP.PRINT_SETUP();	
	};
</script>

<p><b>三、隐藏工具栏及功能按钮</b></p>
用SET_SHOW_MODE隐藏主界面的工具栏以及那个纸钉按钮，参见<input type="button" value="打印设计4" onclick="MyDesign4()">。
<p>或者仅部分按钮以及失效的按钮见<input type="button" value="打印维护5" onclick="MySetup5()">，</p>

<script language="javascript" type="text/javascript"> 
	function MyDesign4() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_设计维护界面隐藏工具栏");
		LODOP.ADD_PRINT_TEXT(90,300,236,35,"隐藏了工具栏和纸钉按钮");
		LODOP.SET_SHOW_MODE("HIDE_TOOLS_DESIGN",1); //隐藏整个工具栏
		LODOP.SET_SHOW_MODE("HIDE_GROUND_LOCK",1);  //隐藏纸钉按钮
		LODOP.PRINT_DESIGN();	
	};
	function MySetup5() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印维护隐藏功能按钮");
		LODOP.ADD_PRINT_TEXT(90,300,236,35,"隐藏了应用和预览等功能按钮");
		LODOP.SET_SHOW_MODE("HIDE_ABUTTIN_SETUP",1);//隐藏应用按钮
		LODOP.SET_SHOW_MODE("HIDE_RBUTTIN_SETUP",1);//隐藏复原按钮
		LODOP.SET_SHOW_MODE("HIDE_VBUTTIN_SETUP",1);//隐藏预览按钮
		LODOP.SET_SHOW_MODE("HIDE_PBUTTIN_SETUP",1);//隐藏打印按钮		
		LODOP.SET_SHOW_MODE("SETUP_ENABLESS",getCheckSS());
		LODOP.SET_SHOW_MODE("HIDE_DISBUTTIN_SETUP",1);//隐藏那些无效按钮
		LODOP.PRINT_SETUP();	
	};
</script>


<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>
</body>
</html>