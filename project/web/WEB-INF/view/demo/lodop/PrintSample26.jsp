﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十六:超多页打印演示</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">超多页打印演示：</font></h2>

<p>&nbsp;&nbsp;&nbsp; 当打印页数超级多（上千页）时，如果用单页循环打印，会因为在操作系统中产生太多的</p>  

<p>打印任务而影响性能；如果用NewPage分页方式打印，则会因为一次性占用太多的系统资源而</p>
<p>需要等待很长时间...</p>

<p>&nbsp;&nbsp;&nbsp;   
解决问题的办法是采用折中处理，既分组完成，每组完成一部分，循环执行组打印。</p>

<p>下面演示一组打印预览10页，分50组循环实现500页的学位证书套打：</p>

<p>（在分组打印模板中，需要用ADD_PRINT_TEXTA函数，为每一个对象起个类名）</p>

<p>&nbsp; <font size="2"><input type="button" value="打印维护(模板)" onClick=" MySetup()">   
<input type="button" value="打印预览(10页)" onClick="MyPREVIEW()"> 
<input type="button" value="批量打印500页" onClick="MyPrint()"></font>      
</p>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>
<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function MySetup() {	
			LODOP=getLodop();  
			LODOP.PRINT_INIT("中文学位证书打印");
			LODOP.SET_PRINT_PAGESIZE(1,2970,2100,"");
			LODOP.SET_PRINT_STYLE("FontSize",16);
			LODOP.SET_PRINT_STYLE("Bold",1);
			CreateOnePage("姓名","男","");			
			LODOP.PRINT_SETUP();
	};
	function MyPREVIEW() {	
  			LODOP=getLodop();  
			LODOP.PRINT_INIT("中文学位证书打印");
			LODOP.SET_PRINT_PAGESIZE(1,2970,2100,"");
			LODOP.SET_PRINT_STYLE("FontSize",16);
			LODOP.SET_PRINT_STYLE("Bold",1);	
			for (j = 1; j <=10; j++) {
				CreateOnePage("姓名"+j,"男",j);			
			};		
			LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");			
			LODOP.PREVIEW();
	};	
	function MyPrint() {	
		LODOP=getLodop();  
		if(!confirm("下面的演示会产生大量的实际打印操作，确定继续吗？")) return;
		for (i = 1; i <=50; i++) {
			LODOP.PRINT_INIT("中文学位证书打印");
			LODOP.SET_PRINT_PAGESIZE(1,2970,2100,"");
			LODOP.SET_PRINT_STYLE("FontSize",16);
			LODOP.SET_PRINT_STYLE("Bold",1);		
			for (j = 1; j <=10; j++) {
				CreateOnePage("姓名"+i+j,"男",""+i+j);			
			};	
			LODOP.SET_PRINT_MODE("CUSTOM_TASK_NAME","中文学位证书打印"+i);//为每个打印单独设置任务名	
			LODOP.PRINT();
		};
	};	
	function CreateOnePage(XM,XB,BH){	
		LODOP.NewPage();
		LODOP.ADD_PRINT_TEXTA("text01",67,132,137,35,XM);
		LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		LODOP.ADD_PRINT_TEXTA("text02",67,280,40,35,XB);
		LODOP.ADD_PRINT_TEXTA("text03",67,329,70,35,"1979");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		LODOP.ADD_PRINT_TEXTA("text04",67,421,50,35,"09");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text05",67,489,40,35,"09");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text06",223,220,76,35,"理学");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text07",121,130,332,35,"应用物理与微电子技术");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text08",271,482,34,35,"校");
		LODOP.ADD_PRINT_TEXTA("text09",271,616,32,35,"长");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		LODOP.ADD_PRINT_TEXTA("text10",300,131,289,35,"合肥工业大学");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text11",364,210,261,35,"103700002009000"+BH);
		LODOP.ADD_PRINT_TEXTA("text12",365,753,66,35,"2009");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
		LODOP.ADD_PRINT_TEXTA("text13",365,843,37,35,"12");
		LODOP.ADD_PRINT_TEXTA("text14",365,911,54,35,"31");
		LODOP.SET_PRINT_STYLEA(0,"Alignment",2);
	};	
</script> 
</body>
</html>