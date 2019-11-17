﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例四十五:获得打印状态及控制打印</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示如何获得打印状态及控制打印：</font>
</h2>

<br>
&nbsp;&nbsp;&nbsp;&nbsp;              
由于Windows下打印一般采用后台服务完成，也就是说<a href="PrintSample35.html" target="_blank">样例35</a>返回的“打印成功”实际仅是成功加入后台队列，<p>要获得后台真实打印的状态变化以及最终是否打印成功结束，需要采用如下捕获语句：</p>
<p><font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;CATCH_PRINT_STATUS&quot;,true);</font></p>
<p>执行该语句之后，PRINT指令不再返回那个所谓“打印成功”，而是该任务的<font color="#0000FF">JOB代码</font>（打印机序号和JOB序号组成）。</p>
<p>有了该<font color="#0000FF">JOB代码</font>，可以用<font color="#0000FF">GET_VALUE(&quot;PRINT_STATUS_XXX&quot;,&quot;JOB代码值&quot;)</font>语句获得打印状态信息及最终结果。</p>
<p>这与<a href="PrintSample28.html" target="_blank">样例28</a>方法不同的是，即便打印任务消失之后仍能查询，也可以循环查询，等待某个状态出现。</p>
<p><b>下面演示：</b>
</p>

<p>1、先点<a href="javascript:MyPrint()">执行打印</a>获得该打印的JOB代码：<input type="text" id="T1" size="48"><br>
</p>

2、<input type="button" value="获得该JOB是否已经打印成功:" 
onclick="document.getElementById('T2').value=getStatusValue('PRINT_STATUS_OK',document.getElementById('T1').value,document.getElementById('T2'))"><input type="text" id="T2" size="48">(1-成功     
0-不成功)<br>     

3、<input type="button" value="获得该JOB是否还处在队列中:" 
onclick="document.getElementById('T3').value=getStatusValue('PRINT_STATUS_EXIST',document.getElementById('T1').value,document.getElementById('T3'))"><input type="text" id="T3" size="48">(1-在     
0-不在,可能已打完或未打而删除)<br>

4、<input type="button" value="获得该JOB当前打印状态代码:" 
onclick="document.getElementById('T4').value=getStatusValue('PRINT_STATUS_ID',document.getElementById('T1').value,document.getElementById('T4'))"><input type="text" id="T4" size="48">(含义见后面解释)<br>

5、<input type="button" value="获得该JOB当前打印状态描述:" 
onclick="document.getElementById('T5').value=getStatusValue('PRINT_STATUS_TEXT',document.getElementById('T1').value,document.getElementById('T5'))"><input type="text" id="T5" size="48"><br>

6、<input type="button" value="获得该JOB需要打印的总页数:" 
onclick="document.getElementById('T6').value=getStatusValue('PRINT_STATUS_TOTAL_PAGES',document.getElementById('T1').value,document.getElementById('T6'))"><input type="text" id="T6" size="48"><br>

7、<input type="button" value="获得该JOB文档名称:" 
onclick="document.getElementById('T7').value=getStatusValue('PRINT_STATUS_DOCNAME',document.getElementById('T1').value,document.getElementById('T7'))"><input type="text" id="T7" size="59"><br>

8、<input type="button" value="获得该JOB文档建立时间:" 
onclick="document.getElementById('T8').value=getStatusValue('PRINT_STATUS_ADDTIME',document.getElementById('T1').value,document.getElementById('T8'))"><input type="text" id="T8" size="53"><br>

9、<input type="button" value="获得该JOB打印状态变化记录:" 
onclick="document.getElementById('T9').value=getStatusValue('PRINT_STATUS_LIST',document.getElementById('T1').value,document.getElementById('T9'))"><br><textarea rows="6" id="T9" cols="45"> </textarea><br>
 
10、<input type="button" value="获得该打印任务持续的时间(秒):" 
onclick="document.getElementById('T10').value=getStatusValue('PRINT_STATUS_SECONDS',document.getElementById('T1').value,document.getElementById('T10'))"><input type="text" id="T10" size="7"><br>

11、<input type="button" value="获得该打印机是否处于忙碌状态:" 
onclick="document.getElementById('T11').value=getStatusValue('PRINT_STATUS_BUSY',document.getElementById('T1').value,document.getElementById('T11'))"><input type="text" id="T11" size="7">(1-忙碌     
0-不忙碌)<br>

<br>
12、由于打印能并发执行，所以哪怕上面的打印任务还没有完成，
<p>&nbsp;&nbsp;&nbsp; 现在也可以<a href="javascript:PrintWait()">另外执行一个打印</a>（产生新JOB代码:<input type="text" id="T12A" size="5">）
并等待其打印成功状态出现:<input type="text" id="T12B" size="40">    
</p>
<p>&nbsp;&nbsp;&nbsp; 等待过程中可以用如下语句对该打印机进行暂停打印、恢复打印及清理打印任务三项控制：<br>
 &nbsp; &nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;CONTROL_PRINTER:打印机名称或序号&quot;,&quot;PAUSE&quot;);</font><br>
 &nbsp; &nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;CONTROL_PRINTER:打印机名称或序号&quot;,&quot;RESUME&quot;);</font><br>
 &nbsp; &nbsp;<font color="#0000FF">LODOP.SET_PRINT_MODE(&quot;CONTROL_PRINTER:打印机名称或序号&quot;,&quot;PURGE&quot;);</font><br>

&nbsp; &nbsp;先试试<a href="javascript:ControlPrinterPAUSE(document.getElementById('T12A').value)">暂停打印</a>，
暂停后<a href="javascript:ControlPrinterRESUME(document.getElementById('T12A').value)">恢复打印</a>，
或<a href="javascript:ControlPrinterPURGE(document.getElementById('T12A').value)">清理其所有打印任务</a>(清理过程稍等待)。</p>

<p><b>打印状态代码含义：</b>


</p>


状态代码是一个牧举组合值，有如下信息所代表的数字合计而成。<br>
<table border="1" width="48%" height="65">
  <tr>
    <td width="32%" height="59" align="left">1-已暂停<br>
2-错误<br>
4-正删除<br>
8-进入队列</td>
    <td width="33%" height="59" align="left">
16-正在打印<br>
32-脱机<br>
64-缺纸<br>
128-打印结束</td>
    <td width="35%" height="59" align="left">
256-已删除<br>
512-堵塞<br>
1024-用户介入<br>
2048-正在重新启动</td>
  </tr>
</table>


<p>13、前面的<b>已经打印成功</b>是通过“状态码包含128”且“JOB已不在队列”来判断的，但有些打印机输出完毕状态码不变成128，
</p>   
<p>而一直等于20（“正在打印16”和“正在删除4”之和），此时页面程序需要针对这种打印机进行附加判断。事实上多数情况下
</p>   
<p>判断“JOB不在队列”就足可认定已经打印成功！</p>

下面演示逐个打印，也就是前面成功或删除了才继续打印下一个(演示中选“取消”就中断循环)：
<p><a href="javascript:PrintWaitLoop()">开始循环打印</a>:<input type="text" id="T14" size="60">    
</p>


<p>　
</p>   


<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;回样例目录</a>
</p>   
<script language="javascript" type="text/javascript">   
        var LODOP,P_ID="",TaskID1,TaskID2,t,waiting=false,c=0,loop=0; //声明为全局变量 
	function getStatusValue(ValueType,ValueIndex,oResultOB){
		LODOP=getLodop(); 
		if (LODOP.CVERSION) LODOP.On_Return=function(TaskID,Value){oResultOB.value=Value;};
		var strResult=LODOP.GET_VALUE(ValueType,ValueIndex);
		if (!LODOP.CVERSION) return strResult; else return "";
	};
	function MyPrint(){
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_获得打印状态1");
		LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印的第一页内容");
		LODOP.NEWPAGEA();
		LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印的第二页内容");
		LODOP.SET_PRINT_MODE("CATCH_PRINT_STATUS",true);
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){document.getElementById('T1').value=Value;};
			LODOP.PRINTA();
			return;
		} else document.getElementById('T1').value=LODOP.PRINTA();
	};	
	function PrintWait(){
		if (c>0) {alert("正打印中...");return;}
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_获得打印状态2");
		LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印的页面部分内容");
		LODOP.SET_PRINT_MODE("CATCH_PRINT_STATUS",true);
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){
				P_ID=Value;
				document.getElementById('T12A').value=P_ID;
				if (P_ID!="") {	c=0;C_WaitFor();};
			};
			LODOP.PRINTA();
		} else {
			P_ID=LODOP.PRINTA();
			document.getElementById('T12A').value=P_ID;
			if (P_ID!="") {	c=0;WaitFor();};
		};
	}
	function WaitFor(){     
		c=c+1;    
		document.getElementById('T12B').value="正等待(JOB代码是"+P_ID+")打印结果："+c+"秒";
		t=setTimeout("WaitFor()",1000);    
		if (LODOP.GET_VALUE("PRINT_STATUS_OK",P_ID)) {
			clearTimeout(t);
			document.getElementById('T12B').value="打印成功！";
			c=0;
			alert("打印成功！");
		}if ((!LODOP.GET_VALUE("PRINT_STATUS_EXIST",P_ID))&&(c>0)) {
			clearTimeout(t);
			document.getElementById('T12B').value="打印任务被删除！";
			c=0;
			alert("打印任务被删除！");
		} else if (c>30){
			clearTimeout(t);
			document.getElementById('T12B').value="打印超时(30秒)！";
			c=0;
			alert("打印超过30秒没捕获到成功状态！");		
		};
	};
	function C_WaitFor(){     
		c=c+1;    
		document.getElementById('T12B').value="正等待(JOB代码是"+P_ID+")打印结果："+c+"秒";
		t=setTimeout("C_WaitFor()",1000); 
		LODOP.On_Return_Remain=true;
		LODOP.On_Return=function(TaskID,Value){
			if (TaskID==TaskID1){
				if (Value==1){alert(TaskID+" "+Value);
					clearTimeout(t);
					document.getElementById('T12B').value="打印成功！";
					c=0;
					alert("打印成功！");
				};
			} else 
			if (TaskID==TaskID2){
				if (Value==0){
					clearTimeout(t);
					document.getElementById('T12B').value="打印任务被删除！";
					c=0;
					alert("打印任务被删除！");
				};
			};		
		};		
		TaskID1=LODOP.GET_VALUE("PRINT_STATUS_OK",P_ID);
		TaskID2=LODOP.GET_VALUE("PRINT_STATUS_EXIST",P_ID);
		if (c>50){
			clearTimeout(t);
			document.getElementById('T12B').value="打印超时(50秒)！";
			c=0;
			alert("打印超过50秒没捕获到成功状态！");
		};
	};
	function PrintWaitLoop(){
		if (!waiting) {
			LODOP=getLodop();  
			LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_获得打印状态2");
			LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印的页面部分内容");
			LODOP.SET_PRINT_MODE("CATCH_PRINT_STATUS",true);			
			if (LODOP.CVERSION) {
				LODOP.On_Return_Remain=true;
				LODOP.On_Return=function(TaskID,Value){
					if (TaskID==TaskID1){
						P_ID=Value;
						if ((P_ID!="")) {waiting=true;c=0;loop=loop+1;setTimeout("PrintWaitLoop()",200);} else {document.getElementById('T14').value="已停止循环！";};
					} else 
					if (TaskID==TaskID2){
						if (Value==0) waiting=false;
						setTimeout("PrintWaitLoop()",200);
					};
				};
				TaskID1=LODOP.PRINTA();
			} else {
				P_ID=LODOP.PRINTA();
				if ((P_ID!="")) {waiting=true;c=0;loop=loop+1;setTimeout("PrintWaitLoop()",200);} else {document.getElementById('T14').value="已停止循环！";}
			};
		} else {
		      c=c+1;  	
		      document.getElementById('T14').value="正打印第"+loop+"个任务(JOB代码"+P_ID+")等待："+c/5+"秒"; 
		      if (LODOP.CVERSION) {
			      TaskID2=LODOP.GET_VALUE("PRINT_STATUS_EXIST",P_ID);
		      } else {
			      if (!LODOP.GET_VALUE("PRINT_STATUS_EXIST",P_ID)) waiting=false;//以是否还在队列为准
	                      setTimeout("PrintWaitLoop()",200);
		      };
		}

	}
	//从JOB代码找出打印机序号：
	function GetPrinterIDfromJOBID(strJOBID){
		var intPos=strJOBID.indexOf("_");
		if (intPos<0) {return strJOBID;} else {return strJOBID.substr(0,intPos);}
	}
	//暂停打印:
	function ControlPrinterPAUSE(strJOBID){ 
		strPrinterID=GetPrinterIDfromJOBID(strJOBID);
		LODOP=getLodop(); 
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){alert("暂停结果:"+Value);};
			LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"PAUSE");
			return;
		} else {
			var strResult=LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"PAUSE");
			alert("暂停结果:"+strResult);
		};
	}
	//恢复打印:
	function ControlPrinterRESUME(strJOBID){ 
		strPrinterID=GetPrinterIDfromJOBID(strJOBID);
		LODOP=getLodop(); 
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){alert("恢复结果:"+Value);};
			LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"RESUME");
			return;
		} else {
			var strResult=LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"RESUME");
			alert("恢复结果:"+strResult);
		};
	}
	//清理打印任务:
	function ControlPrinterPURGE(strJOBID){  
		strPrinterID=GetPrinterIDfromJOBID(strJOBID);
		LODOP=getLodop(); 
		if (LODOP.CVERSION) {
			LODOP.On_Return=function(TaskID,Value){alert("清理结果:"+Value);};
			LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"PURGE");
			return;
		} else {
			var strResult=LODOP.SET_PRINT_MODE("CONTROL_PRINTER:"+strPrinterID,"PURGE");
			alert("清理结果:"+strResult);
		};
	}
	//如下过程本例没用到，但或许对您有用：
	function getStatuMessage(statusID) { 
		var messages="";
		if (statusID & 1) messages += "已暂停 -";
		if (statusID & 2) messages += "错误 -";
		if (statusID & 4) messages += "正删除 -";
		if (statusID & 8) messages += "进入队列 -";
		if (statusID & 16) messages += "正在打印 -";
		if (statusID & 32) messages += "脱机 -";
		if (statusID & 64) messages += "缺纸 -";
		if (statusID & 128) messages += "打印结束 -";
		if (statusID & 256) messages += "已删除 -";
		if (statusID & 512) messages += "堵了 -";
		if (statusID & 1024) messages += "用户介入 -";
		if (statusID & 2048) messages += "正在重新启动 -";
		return messages;
	}
</script> 
 
</body>
</html>