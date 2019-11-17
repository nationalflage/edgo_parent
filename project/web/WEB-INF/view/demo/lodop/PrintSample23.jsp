﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十三:水平或垂直方向居中打印超文本</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示如何居中打印超文本及复选和单选状态输出：</font>
</h2>
<p>超文本居中打印方式有多种，下面演示以下表格的打印:
</p>
<div id="dv1">
<form valign="center">
  <table border="2" width="400" height="106" cellspacing="1" bgcolor="#CCFFFF"  style="border:solid 2px black">
  <tr>
  <td width="60" height="16" align="center" style="border:solid 1px black"><font color="#0000FF">A</font><font color="#0000FF">等</font></td>
  <td width="60" height="16" align="center" style="border:solid 1px black"><font color="#0000FF">B</font><font color="#0000FF">等</font></td>
  <td width="60" height="16" align="center" style="border:solid 1px black"><font color="#0000FF">C</font><font color="#0000FF">等</font></td>
  <td width="100" height="16" align="center" style="border:solid 1px black"><font color="#0000FF">D</font><font color="#0000FF">等</font></td>
  </tr> 
  <tr>
  <td  height="50" style="border:solid 1px black" ><input id="inpt1" type="text" value="A001"></td>
  <td  height="12" style="border:solid 1px black" valign="middle" align="middle">B001</td>
  <td  height="12" style="border:solid 1px black"><INPUT name=powerlist value=1 type=checkbox>C001</td>
  <td  height="16" align="center" style="border:solid 1px black">
    <input type="radio" id="R1" name="RX" checked>D1号<br>
    <input type="radio" id="R2" name="RX">D2号<br>
    <input type="radio" id="R3" name="RX">D3号<br>
  </td>
  </tr> 
  <tr>
  <td  height="16" style="border:solid 1px black"><input id="inpt2" type="text" style="background-color:Transparent" value="A002"></td>
  <td  height="16" style="border:solid 1px black">B002</td>
  <td  height="16" style="border:solid 1px black"><INPUT name=powerlist value=1 type=checkbox  checked>C002</td>
  <td   height="16" align="center" style="border:solid 1px black">
    <input type="radio" id="R1" name="RX1" checked>D1号<br>
    <input type="radio" id="R2" name="RX1">D2号<br>
    <input type="radio" id="R3" name="RX1">D3号<br>
  </td>
  </tr> 
  <tr>
  <td  height="16" style="border:solid 1px black"><input id="inpt3" type="text" style="border:none;background-color:Transparent;" value="A003"></td>
  <td  height="16" style="border:solid 1px black">
  <select size="1" name="D1">
  <option value="a">B003-A</option>
  <option value="b" selected>B003-B</option>
  <option value="c">B003-C</option>
  </select></td>
  <td  height="16" style="border:solid 1px black"><INPUT name=powerlist value=1 type=checkbox>C003</td>
  <td   height="16" align="center" style="border:solid 1px black">
    <input type="radio" id="R1" name="RX2" checked>D1号<br>
    <input type="radio" id="R2" name="RX2">D2号<br>
    <input type="radio" id="R3" name="RX2">D3号<br>
  </td>
</tr> 
</table>
</form>
</div>
<h4>
<br>
第一种：如果知道内容的宽度(假如是122mm)则可以用如下语句来控制“水平居中”：</h4>
<p><font color="#0000FF">LODOP.SET_PRINT_STYLEA(0,&quot;Horient&quot;,2);</font>//设置对象在纸张范围内水平居中,</p>
<p>进入<a href="javascript:myDesign1()">打印设计1</a>然后再预览看一下。</p>
<h4>第二种：如果内容宽度不定，则可以把对象宽度设置为纸张宽度（对象左右边距设为0）来控制“水平居中”：
</h4>
<p>用style（text-align:                                
center）来控制“内容在对象内居中”，从而实现在纸张内居中,                           
</p>                           
<p>进入<a href="javascript:myDesign2()">打印设计2</a>然后再预览看一下。</p>                          
                          
<h4>第三种：如果边距精度要求不高，可以用百分比方式来控制“水平居中”：                        
</h4>                        
<p>如下把“左边距”和“宽度”分别设为10%和80%（这样左右边距都是10%），再配合超文本Width100%可以实现随纸张变化的满边居中,                         
</p>                       
<p>进入<a href="javascript:myDesign3()">打印设计3</a>然后再预览看一下。</p>                       
                       
<h4>第四种：如果知道内容高度和宽度，可以用Horient和Vorient同时设置，实现水平和垂直都居中：                    
</h4>            
<p><font color="#0000FF">LODOP.SET_PRINT_STYLEA(0,&quot;Vorient&quot;,2);</font>//设置对象在纸张范围内垂直居中,</p>        
<p>进入<a href="javascript:myDesign4()">打印设计4</a>然后再预览看一下。</p> 
以上预览时可以选择不同的纸张或打印方向感受一下。                    
                     
                     
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>                     
</p>                     
                     
<script>  
	function refreshData(){ //让innerHTML获取的内容包含input和select(option)的最新值
		var allInputObject=document.body.getElementsByTagName("input");
		for (i = 0; i < allInputObject.length; i++) {
			if(allInputObject[i].type=="checkbox")  {
		        	if (allInputObject[i].checked ) 
                	   	allInputObject[i].setAttribute("checked","checked"); 
                	   	else
				        allInputObject[i].removeAttribute("checked");
        	} else 	if(allInputObject[i].type=="radio")  {
		        	if (allInputObject[i].checked ) 
                	   	allInputObject[i].setAttribute("checked","checked"); 
                	   	else
				        allInputObject[i].removeAttribute("checked");
        	}else allInputObject[i].setAttribute("value",allInputObject[i].value);
		};
		for (i = 0; i < document.getElementsByTagName("select").length; i++) {
		    var sl=document.getElementsByTagName("select")[i];
		    for (j = 0; j < sl.options.length; j++) {
		    if (sl.options[j].selected) 
                     	sl.options[j].setAttribute("selected","selected");
			else sl.options[j]=new Option(sl.options[j].text,sl.options[j].value);
		    };
		};
	};              
	var LODOP; //声明为全局变量                     
	function  myDesign1(){   
		refreshData();                  
		LODOP=getLodop();                       
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_文本居中一");                     
		LODOP.ADD_PRINT_HTM(90,221,"120mm",245,"<!doctype html>"+document.getElementById("dv1").innerHTML);  //宽120mm                     
		LODOP.SET_PRINT_STYLEA(0,"Horient",2);                     
		LODOP.PRINT_DESIGN();                    
	};         
	function myDesign2(){         
		refreshData();            
		LODOP=getLodop();                       
		strCenterStyle="<style/>form {text-align: center}</style>";                     
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_文本居中二");                     
		LODOP.ADD_PRINT_HTM("9mm","0mm","RightMargin:0mm","BottomMargin:9mm",strCenterStyle+document.getElementById("dv1").innerHTML); //上下边距9mm，左右边距0mm                     
		LODOP.PRINT_DESIGN();                    
	};		                     
	function myDesign3(){     
		refreshData();                
		LODOP=getLodop();                       
		strCenterStyle="<style/>table {width:100%}</style>";                     
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_文本居中三");                     
		LODOP.ADD_PRINT_HTM(5,"10%","80%",140,strCenterStyle+document.getElementById("dv1").innerHTML); //左右边距都是10%              
		LODOP.PRINT_DESIGN();	                    
	};		                     
	function myDesign4(){                     
		refreshData();
		LODOP=getLodop(); 
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_文本居中四");                     
		LODOP.ADD_PRINT_HTM(151,276,"122mm","62mm",document.getElementById("dv1").innerHTML);//宽122mm 高62mm     
		LODOP.SET_PRINT_STYLEA(0,"Horient",2);        
		LODOP.SET_PRINT_STYLEA(0,"Vorient",2);                    
		LODOP.PRINT_DESIGN();                    
	};		                     
</script>                        
                     
</body>                     
</html>