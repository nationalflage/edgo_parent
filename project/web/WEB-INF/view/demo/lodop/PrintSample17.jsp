﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十七:直接读写端口数据</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示直接读写端口数据（如发指令到打印设备）：</font>
</h2>
<h3><font color="#009999">方式一：利用打印机驱动传递</font></h3>  
<p>向打印机发送原始数据的函数格式是： <font color="#0000FF">SEND_PRINT_RAWDATA(strRawData)</font></p>                      
<p>参数含义:<font color="#0000FF">strRawData：</font>数据或指令值，字符（JS中可用String的fromCharCode方法生成）型。</p>  
<p><b>演示如下：</b></p>     
数据内容：<input type="text" id="T1" size="20" value="&amp;l1O Hello world!">
<p>先选打印设备(可参考<a href="PrintSample7.html">样例七</a>),这里<a href="javascript:MySelect()">弹出窗口选打印机</a> 
选择后<a href="javascript:MySendData()">开始发送</a>。                   
</p>
<h3><font color="#009999">方式二：直接写端口</font></h3>
<p>直接写端口的函数格式是： <font color="#0000FF">WRITE_PORT_DATA(strPortName，strData)</font></p>                    
<p>参数含义:</p>
<p><font color="#0000FF">strPortName：</font>端口名，譬如&quot;LPT1&quot;&quot;COM1&quot;等等。</p>
<p><font color="#0000FF">strData：</font>数据或指令值，字符型。</p>

<p><b>下面演示向LPT1端口写如下控制字符：</b></p>

<p>CHR(27)+','+CHR(112)+','+CHR(0)+','+CHR(128)+','+CHR(128) <a href="javascript:MyWritePort()">开始写入端口</a></p>            

<p><b>读写COM端口前可能需要设置参数：</b></p>

<p>用关键字“mode com1”<a href="javascript:MyWriteCom()">设置COM1的参数如下</a>：2400,n,8,1</p>            

<p><font color="#009999"><b>方式三：从端口读数据</b></font></p>

<p>从端口读数的函数格式是： <font color="#0000FF">READ_PORT_DATA(strPortName)</font></p>                   
<p>参数含义:<font color="#0000FF">strPortName：</font>端口名。</p>

<p><input type="button" value="从COM1读数：" onclick="javascript:document.getElementById('data1').value=MyReadComData()"><br>
<textarea rows="4" id="data1" cols="48"></textarea></p>


<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>

<script language="javascript" type="text/javascript">  
        var LODOP; //声明为全局变量             
	function MySelect() {	
		LODOP=getLodop();  
		LODOP.SELECT_PRINTER();
	
	};
	function MySendData() {
		LODOP=getLodop();  
		strData=String.fromCharCode(27,112,1,128,128)+document.getElementById("T1").value;	
		LODOP.SET_PRINT_MODE("SEND_RAW_DATA_ENCODE","UTF-8");//UTF-8 UTF-7 UNICODE ANSI UTF-16 UTF-16BE GBK BIG5 EUC-JP
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){ if (Value) alert("发送命令成功"); else alert("发送命令失败！"); };
			LODOP.SEND_PRINT_RAWDATA(strData);
			return;
		};
		if (LODOP.SEND_PRINT_RAWDATA(strData))
		 alert("发送命令成功！"); else alert("发送命令失败！"); 
	
	};
	function MyWritePort() {	
		LODOP=getLodop();  
	        strData=String.fromCharCode(27)+','+String.fromCharCode(112)+','+String.fromCharCode(0)+','+String.fromCharCode(128)+','+String.fromCharCode(128);
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){ if (Value) alert("写端口成功！"); else alert("写端口失败!"); };
			LODOP.WRITE_PORT_DATA("LPT1",strData);
			return;
		};
		if (LODOP.WRITE_PORT_DATA("LPT1",strData))
		 alert("写端口成功！"); else alert("写端口失败!"); 
	
	};	
	function MyWriteCom() {	
		LODOP=getLodop();  
 	        strConfig="mode com1:2400,n,8,1";
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){ 
				if (Value) alert("设置端口参数成功！"); else {
					alert("设置端口参数失败"); 
					LODOP.On_Return=function(TaskID,Value){alert("设置端口参数失败,LastErrorID:"+Value);};
					LODOP.GET_SYSTEM_INFO("GetLastError");
				};
			};
			LODOP.WRITE_PORT_DATA("COM1",strConfig);
			return;
		};
		if (LODOP.WRITE_PORT_DATA("COM1",strConfig))
		 alert("设置端口参数成功！"); else alert("设置端口参数失败,LastErrorID:"+LODOP.GET_SYSTEM_INFO("GetLastError")); 
	
	};		
	function MyReadComData() {	
		LODOP=getLodop(); 
		if (LODOP.CVERSION) {
		   LODOP.On_Return=function(TaskID,Value){
			   if (Value) {
				LODOP.On_Return=function(TaskID,Value){
					if (Value=="") document.getElementById('data1').value="端口数据空"; else 
					document.getElementById('data1').value=Value;
					};
				LODOP.READ_PORT_DATA("COM1");
			   } else {
				LODOP.On_Return=function(TaskID,Value){document.getElementById('data1').value="设置通讯参数失败,LastErrorID:"+Value;}
				LODOP.GET_SYSTEM_INFO("GetLastError");
			   };
		   };
		   LODOP.WRITE_PORT_DATA("COM1","mode com1:2400,n,8,1,2000,1000")
		   return "";
		};
		
		//设置读时限2000毫秒（写时限1000毫秒）
		if (!LODOP.WRITE_PORT_DATA("COM1","mode com1:2400,n,8,1,2000,1000"))
		return "设置通讯参数失败,LastErrorID:"+LODOP.GET_SYSTEM_INFO("GetLastError"); else
		{
       		   strData=LODOP.READ_PORT_DATA("COM1");
		   if (strData=="") return "端口数据空";else return strData;
		}
    	
	};		
</script> 
</body>
</html>