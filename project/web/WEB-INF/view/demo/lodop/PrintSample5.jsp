﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例五:控制纸张大小和连续打印</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><b><font color="#009999">演示控制纸张大小、打印方向、连续打印和位置基点:</font></b></h2>
<p>一般的打印是程序控制一个逻辑布局，在不同的打印纸张上打印出相应效果。</p>
<p>但有些打印业务需要固定纸张大小从而实现连续打印，此时可用如下控制函数：</p>
<p><font color="#0000FF" size="3">SET_PRINT_PAGESIZE(intOrient,intPageWidth,intPageHeight,strPageName);
</font></p>
<p><font size="3"><b>参数说明：</b></font><font color="#0000FF" size="3">
<br>
</font><font size="3"><font color="#0000FF">intOrient：</font>打印方向及纸张类型<font color="#0000FF"><br>
</font><font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>1---纵向打印，固定纸张；&nbsp;<br>
<font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>2---横向打印，固定纸张；&nbsp;&nbsp;<br>
<font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>3---纵向打印，宽度固定，高度按打印内容的高度自适应(见<a href="PrintSample18.html">样例18</a>)；<br>
<font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>0---方向不定，由操作者自行选择或按打印机缺省设置。<font color="#0000FF"><br>
</font><font color="#0000FF"><br>
intPageWidth：<br>
</font><font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>纸张宽，单位为0.1mm 譬如该参数值为45，则表示4.5mm,计量精度是0.1mm。</font></p>                                     
<p><font size="3"><font color="#0000FF">intPageHeight：</font><br>   
<font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>固定纸张时该参数是纸张高；高度自适应时该参数是纸张底边的空白高，计量单位与纸张宽一样。</font></p>         
<p><font color="#0000FF" size="3">   
strPageName：</font><font size="3"><br>   
</font><font size="3"><font color="#0000FF">&nbsp;&nbsp;&nbsp; </font>纸张类型名，       
<font color="#0000FF">intPageWidth</font><font size="3">等于零时本参数才有效，具体名称参见操作系统打印服务属性中的格式定义。<br>     
&nbsp;&nbsp;&nbsp; 关键字“CreateCustomPage”会在系统内建立一个名称为“LodopCustomPage”自定义纸张类型。<br>       
</font></p>                         
       
<p><font size="3"><b>演示自定义纸张：</b></font></p>         
<p>1：用宽<input type="text" size="5" value="1380" id="W1">(138mm)高<input type="text" size="4" value="880" id="H1">(88mm)           
的动态纸张<a href="javascript:Preview1()">打印预览1</a>一份交行受理书，打印方向不定。</p>                                              
   
                                         
<p>2：选择如下打印机：<input type="radio" id="Radio1" name="RadioS1" checked >默认打印机                         
  <input type="radio" id="Radio2" name="RadioS1" onclick="CreatePrinterList()">指定打印机:                  
<select id="PrinterList" size="1"></select> </p>      
                                        
                                         
<p>&nbsp;&nbsp; 用上一步设置的动态纸张大小，打印方向是正(纵)向，见<a href="javascript:Preview2()">打印预览2</a>。</p>               
                                        
                                         
<p>3：选择上一步所指定打印机的如下纸张类型：<input type="radio" id="Radio3" name="RadioS2" checked >不指定纸张                         
  <input type="radio" id="Radio4" name="RadioS2" onclick="CreatePagSizeList()">指定纸张:<select id="PagSizeList" size="1"></select> </p>      
                                        
                                         
<p>&nbsp;&nbsp;打印方向不定，见<a href="javascript:Preview3()">打印预览3</a>。</p>           
                                        
                                         
<p>4：用宽<input type="text" size="5" value="1400" id="W4">(140mm)高<input type="text" size="4" value="900" id="H4">(90mm)进行     
<font size="3"><a href="javascript:Preview4()">打印预览4</a></font>的同时并建立<font size="3">名称为</font>LodopCustomPage的自定义类型。<br>   
&nbsp;这种方式可以适应某些不能动态设置纸张大小的打印机，新建的纸张可用SET_PRINT_MODE重命名。</p>      
                                        
                                         
<p><i>说明：<br>   
&nbsp; </i>由于有些打印机对自定义的纸张不一定完全支持，所以同样纸张在不同打印机上预览结果可能不一样。<br>     
&nbsp; Lodop的这种预览更接近实际打印输出，但在开发时要注意区分，建议安装一个虚拟打印机来辅助测试。</p>      
                                        
                                         
<p><font size="3"><b>演示连续打印：</b></font></p>      
                                        
                                         
<p>5：用以上动态设置纸张的方法，循环执行<a href="javascript:Print5()">直接打印5</a>，可以实现无间隔的连续打印输出。</p>      
                                        
                                         
<p><b>控制位置基点：</b></p>     
                                       
                                        
<p>6：为使内容不出轨，输出位置一般是以“可打区域”边缘为基点的，但由于各种打印机物理边距不一样，<br>  
&nbsp;这样就造成同一程序用不同打印机输出的位置有差异，这对通用套打是非常不利的，此时可用如下语句：<br> 
&nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;POS_BASEON_PAPER&quot;,true);</font><br> 
&nbsp;该语句可使输出以纸张边缘为基点，<font size="3">进入<a href="javascript:Preview6()">打印预览6</a></font>选不同物理边距打印机看看位置是否一致。</p>   
   
<p><b>改变Windows默认打印设置：</b></p>  
<i>系统默认设置对Lodop控制输出影响很小,不需要改变。提供如下额外功能是为了满足特殊需要：</i><br><br>
7：
用如下语句可指定Windows默认打印机：<br>
 &nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;WINDOW_DEFPRINTER&quot;,打印机名称或序号);</font><br> 
&nbsp;点<a href="javascript:SetPrint7()">设置打印7</a>把第2步选的打印机设置为操作系统的默认打印机，成功返回OK，否则返回错误信息。<br><br> 
8：
用如下语句可指定Windows默认纸张：<br>
 &nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;WINDOW_DEFPAGESIZE:打印机名称或序号&quot;,纸张名称);</font><br> 
&nbsp;点<a href="javascript:SetPrint8()">设置打印8</a>把第3步所选纸张设置为第2步所选打印机的默认纸张，成功返回OK，否则返回错误信息。<br> 
                               
                                      
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>
<script language="javascript" type="text/javascript"> 
        var LODOP; //声明为全局变量  
	function Preview1() {	
		LODOP=getLodop();  
		LODOP.PRINT_INITA(0,0,522,333,"打印控件功能演示_Lodop功能_自定义纸张1");	
		LODOP.SET_PRINT_PAGESIZE(0,document.getElementById('W1').value,document.getElementById('H1').value,"A4");
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PREVIEW();		
	};
	function Preview2() {		
		LODOP=getLodop();  
		LODOP.PRINT_INITA(0,0,522,333,"打印控件功能演示_Lodop功能_自定义纸张2");
		LODOP.SET_PRINTER_INDEX(getSelectedPrintIndex());		
		LODOP.SET_PRINT_PAGESIZE(1,document.getElementById('W1').value,document.getElementById('H1').value,"");
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PREVIEW();		
	};
	function Preview3() {		
		LODOP=getLodop();  
		LODOP.PRINT_INITA(0,0,522,333,"打印控件功能演示_Lodop功能_自定义纸张3");
		LODOP.SET_PRINTER_INDEX(getSelectedPrintIndex());
		LODOP.SET_PRINT_PAGESIZE(0,0,0,getSelectedPageSize());
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PREVIEW();			
	};	
	function Preview4() {		
		LODOP=getLodop();  
		LODOP.PRINT_INITA(0,0,522,333,"打印控件功能演示_Lodop功能_自定义纸张4");
		LODOP.SET_PRINTER_INDEX(getSelectedPrintIndex());		
		LODOP.SET_PRINT_PAGESIZE(1,document.getElementById('W4').value,document.getElementById('H4').value,"CreateCustomPage");
		//LODOP.SET_PRINT_MODE("CREATE_CUSTOM_PAGE_NAME","我的纸张名");//对新建的纸张重命名
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PREVIEW();			
	};	
	function Print5() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("");	
		LODOP.SET_PRINT_PAGESIZE(1,document.getElementById('W1').value,document.getElementById('H1').value,"A3");
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PRINT();	
		LODOP.PRINT_INIT("");	  	
		LODOP.SET_PRINT_PAGESIZE(1,document.getElementById('W1').value,document.getElementById('H1').value,"A3");
		AddPrintContent("10101010101012","于谦");
	  	LODOP.PRINT();		
	};		
	function Preview6() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_控制基本位置6");
		LODOP.SET_PRINT_MODE("POS_BASEON_PAPER",true);
		AddPrintContent("10101010101010","郭德强");
	  	LODOP.PREVIEW();			
	};
	function SetPrint7() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("");
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){alert(Value);};
		var strResult=LODOP.SET_PRINT_MODE("WINDOW_DEFPRINTER",getSelectedPrintIndex());
		if (!LODOP.CVERSION) alert(strResult);
	};
	function SetPrint8() {		
		LODOP=getLodop();  
		LODOP.PRINT_INIT("");
		if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){alert(Value);};
		var strResult=LODOP.SET_PRINT_MODE("WINDOW_DEFPAGESIZE:"+getSelectedPrintIndex(),getSelectedPageSize());
		//var strResult=LODOP.SET_PRINT_MODE("WINDOW_DEFPAGESIZE:"+getSelectedPrintIndex(),"LodopCustomPage");
		if (!LODOP.CVERSION) alert(strResult);
	};				
	function AddPrintContent(strCode,strName) {		
		LODOP.SET_PRINT_STYLE("FontColor",16711680);
		LODOP.ADD_PRINT_RECT(62,16,459,217,0,1);
		LODOP.ADD_PRINT_TEXT(15,137,157,25,"交通银行（      ）");
		LODOP.SET_PRINT_STYLEA(2,"FontName","隶书");
		LODOP.SET_PRINT_STYLEA(2,"FontSize",11);
		LODOP.SET_PRINT_STYLEA(2,"FontColor",0);
		LODOP.ADD_PRINT_TEXT(41,213,100,20,"2008年11月9日");
		LODOP.ADD_PRINT_TEXT(17,281,100,20,"个人业务受理书");
		LODOP.SET_PRINT_STYLEA(4,"FontColor",0);
		LODOP.ADD_PRINT_TEXT(75,37,431,20,"机构:109110 交易代码:010110");
		LODOP.ADD_PRINT_TEXT(102,37,431,20,"个人网银用户签约成功！");
		LODOP.ADD_PRINT_TEXT(129,37,431,20,"网点名称：东城分行营业部");
		LODOP.ADD_PRINT_TEXT(156,37,431,20,"主卡卡号："+strCode);
		LODOP.ADD_PRINT_TEXT(183,37,431,20,"客户姓名："+strName);
		LODOP.ADD_PRINT_TEXT(212,37,431,20,"登陆方式：用户名登陆");
		LODOP.ADD_PRINT_TEXT(17,218,60,20,"东城分行");
		LODOP.ADD_PRINT_TEXT(249,169,221,20,"以上内容已核实确认无误，客户签名：");
		LODOP.ADD_PRINT_TEXT(106,484,23,127,"第二联客户留联");
		LODOP.SET_PRINT_STYLEA(13,"FontColor",0);
		LODOP.ADD_PRINT_TEXT(284,21,74,20,"授权员");
		LODOP.SET_PRINT_STYLEA(14,"FontColor",0);
		LODOP.ADD_PRINT_TEXT(284,200,74,20,"复核员");
		LODOP.SET_PRINT_STYLEA(15,"FontColor",0);
		LODOP.ADD_PRINT_TEXT(284,346,74,20,"经办员");
		LODOP.SET_PRINT_STYLEA(16,"FontColor",0);
	};
	function getSelectedPrintIndex(){
		if (document.getElementById("Radio2").checked) 
		return document.getElementById("PrinterList").value;
		else return -1; 		
	};
	function getSelectedPageSize(){
		if (document.getElementById("Radio4").checked) 
		return document.getElementById("PagSizeList").value;
		else return ""; 		
	};	
	function CreatePrinterList(){
	    if (document.getElementById('PrinterList').innerHTML!="") return;
		LODOP=getLodop(); 
		var iPrinterCount=LODOP.GET_PRINTER_COUNT();
		for(var i=0;i<iPrinterCount;i++){

   			var option=document.createElement('option');
   			option.innerHTML=LODOP.GET_PRINTER_NAME(i);
   			option.value=i;
			document.getElementById('PrinterList').appendChild(option);
		};	
	};
	function clearPageListChild(){
	   var PagSizeList =document.getElementById('PagSizeList'); 
	   while(PagSizeList.childNodes.length>0){
  		   var children = PagSizeList.childNodes;	
	  		 for(i=0;i<children.length;i++){		
			PagSizeList.removeChild(children[i]);	
	  	  };	   
	   };	   
	}
	function CreatePagSizeList(){
	   LODOP=getLodop(); 
	   clearPageListChild();
	   var strPageSizeList=LODOP.GET_PAGESIZES_LIST(getSelectedPrintIndex(),"\n");
	   var Options=new Array(); 
 	   Options=strPageSizeList.split("\n");       
	   for (i in Options)    
	   {    
	     var option=document.createElement('option');   
		 option.innerHTML=Options[i];
		 option.value=Options[i];
   		 document.getElementById('PagSizeList').appendChild(option);
	   }  
	}	
		
</script> 
</body>
</html>
