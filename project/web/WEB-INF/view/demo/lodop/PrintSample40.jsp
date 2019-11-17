﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例四十:如何使用格式转换函数</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<script language="javascript">  
   function getFormatValue(strType,strValue,oResultOB){
       var LODOP=getLodop();  
       if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){if (oResultOB) oResultOB.value=Value;}; 
       var stResult=LODOP.FORMAT(strType,strValue);
       if (!LODOP.CVERSION) oResultOB.value=stResult; 
   }
   function getOneFileName() {
	var LODOP=getLodop(); 
        if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){document.getElementById('V30').value=Value;}; 
	return LODOP.GET_DIALOG_VALUE("LocalFileFullName","*.*");
   } 
</script>

<h2><b><font color="#009999">演示格式转换函数的使用:</font></b></h2>
<p style="line-height: 150%">Lodop提供了一个很实用的数据<b>格式转换</b>函数，使用简单，可转换数据类型很多，其语法如下：<br>       
<font color="#0000FF">FORMAT(strType,strValue);</font><br>
参数<font color="#0000FF">strType</font>是格式类型（参见下面蓝色内容）,<font color="#0000FF">strValue</font>是要转换的数据，下面演示一部分：<br>

<br>
1、把<input type="text" id="V1" size="23" value="1567.48" name="V1">转大写金额<input type="text" id="F1" size="32" value="UpperMoney" name="F1" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F1').value,document.getElementById('V1').value,document.getElementById('R1'))">格式&gt;&gt;</a>            
<input type="text" id="R1" size="31">                                      


<br>
2、把<input type="text" id="V2" size="23" value="1234.678" name="V2">转换为数值<input type="text" id="F2" size="32" value="FLOAT:#.##" name="F2" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F2').value,document.getElementById('V2').value,document.getElementById('R2'))">格式&gt;&gt;</a>            
<input type="text" id="R2" size="31">                                      

<br>
3、把<input type="text" id="V3" size="23" value=".2" name="V3">转换为数值<input type="text" id="F3" size="32" value="FLOAT:0.00" name="F3" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F3').value,document.getElementById('V3').value,document.getElementById('R3'))">格式&gt;&gt;</a>            
<input type="text" id="R3" size="31">                                      


<br>
4、把<input type="text" id="V4" size="23" value="356673489.0365" name="V4">转换为数值<input type="text" id="F4" size="32" value="FLOAT:#,##0.00" name="F4" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F4').value,document.getElementById('V4').value,document.getElementById('R4'))">格式&gt;&gt;</a>            
<input type="text" id="R4" size="31">                                      

          
<br>
5、把<input type="text" id="V5" size="23" value="25439.6" name="V5">转换为数值<input type="text" id="F5" size="32" value="FLOAT:0.000E+00" name="F5" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F5').value,document.getElementById('V5').value,document.getElementById('R5'))">格式&gt;&gt;</a>            
<input type="text" id="R5" size="31">                                      

           
<br>
6、把<input type="text" id="V6" size="23" value="145988.19" name="V6">转换为数值<input type="text" id="F6" size="32" value="FLOAT:#.###E-0" name="F6" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F6').value,document.getElementById('V6').value,document.getElementById('R6'))">格式&gt;&gt;</a>            
<input type="text" id="R6" size="31">                                     


<br>
7、把<input type="text" id="V7" size="23" value="2011年3月10日 18:09:25" name="V7">转换为时间<input type="text" id="F7" size="32" value="TIME:yyyy-mm-dd hh:mm:ss" name="F7" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F7').value,document.getElementById('V7').value,document.getElementById('R7'))">格式>></a>            
<input type="text" id="R7" size="31">                                      


<br>
8、把<input type="text" id="V8" size="23" value="11-3-10" name="V8">转换为时间<input type="text" id="F8" size="32" value="TIME:yyyy年mm月dd日" name="F8" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F8').value,document.getElementById('V8').value,document.getElementById('R8'))">格式&gt;&gt;</a>            
<input type="text" id="R8" size="31">年月日                                      


<br>
9、把<input type="text" id="V9" size="23" value="DMY 11-3-10" name="V9">转换为时间<input type="text" id="F9" size="32" value="TIME:yyyy年mm月dd日" name="F9" style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F9').value,document.getElementById('V9').value,document.getElementById('R9'))">格式&gt;&gt;</a>            
<input type="text" id="R9" size="31">DMY:日月年                                      


<br>
10 把<input type="text" id="V10" size="23" value="MDY 11-3-10" name="V10">转换为时间<input type="text" id="F10" size="32" value="TIME:yyyy年mm月dd日" name="F10" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F10').value,document.getElementById('V10').value,document.getElementById('R10'))">格式&gt;&gt;</a>            
<input type="text" id="R10" size="31">MDY:月日年                                                                      

<br>
11 把<input type="text" id="V11" size="23" value="09 March 2011 18:09:25" name="V11">转换为时间<input type="text" id="F11" size="32" value="TIME:dddd yyyy年mm月d日" name="F11" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F11').value,document.getElementById('V11').value,document.getElementById('R11'))">格式&gt;&gt;</a>            
<input type="text" id="R11" size="31">                                                                        

<br>
12 把<input type="text" id="V12" size="23" value="2011/3/9 18:09:25" name="V12">转换为时间<input type="text" id="F12" size="32" value="TIME:yyyy.mm.d" name="F12" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F12').value,document.getElementById('V12').value,document.getElementById('R12'))">格式&gt;&gt;</a>            
<input type="text" id="R12" size="31">                                                              

<br>  
13 把<input type="text" id="V13" size="23" value="2011.3.10 18:09:25" name="V13">转换为时间<input type="text" id="F13" size="32" value="TIME:yyyy/mm/dd hh:mm:ss" name="F13" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F13').value,document.getElementById('V13').value,document.getElementById('R13'))">格式&gt;&gt;</a>            
<input type="text" id="R13" size="31">                                                                        

<br>
14 把<input type="text" id="V14" size="23" value="23.3.2011 18:09:25" name="V14">转换为时间<input type="text" id="F14" size="32" value="TIME:m-d-yyyy" name="F14" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F14').value,document.getElementById('V14').value,document.getElementById('R14'))">格式&gt;&gt;</a>            
<input type="text" id="R14" size="31">                                                                        

<br>
15 把<input type="text" id="V15" size="23" value="3-23-2011 18:09:25" name="V15">转换为时间<input type="text" id="F15" size="32" value="TIME:d-m-yyyy" name="F15" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F15').value,document.getElementById('V15').value,document.getElementById('R15'))">格式&gt;&gt;</a>            
<input type="text" id="R15" size="31">                                                                        

<br>
16 把<input type="text" id="V16" size="23" value="3 23 2011" name="V16">转换为时间<input type="text" id="F16" size="32" value="TIME:yyyy-mm-dd dddd" name="F16" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F16').value,document.getElementById('V16').value,document.getElementById('R16'))">格式&gt;&gt;</a>            
<input type="text" id="R16" size="31">                                                                        

<br>
17 把<input type="text" id="V17" size="23" value="Wed Mar 16 13:52:41 UTC+0800 2011" name="V17">转换为时间<input type="text" id="F17" size="32" value="TIME:yyyy/mm/dd" name="F17" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F17').value,document.getElementById('V17').value,document.getElementById('R17'))">格式&gt;&gt;</a>            
<input type="text" id="R17" size="31">                                                                        

<br>
18 把<input type="text" id="V18" size="23" value="Saturday, 12 March, 2011" name="V18">转换为时间<input type="text" id="F18" size="32" value="TIME:yyyy.mm.dd" name="F18" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F18').value,document.getElementById('V18').value,document.getElementById('R18'))">格式&gt;&gt;</a>            
<input type="text" id="R18" size="31">                                                                        

<br>
19 把<input type="text" id="V19" size="23" value="Now" name="V19">转换为时间<input type="text" id="F19" size="32" value="TIME:yyyy年mm月dd日hh时nn分ss秒" name="F19" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F19').value,document.getElementById('V19').value,document.getElementById('R19'))">格式&gt;&gt;</a>            
<input type="text" id="R19" size="31">                                                                        

<br>
20 把<input type="text" id="V20" size="23" value="Date" name="V20">转换为时间<input type="text" id="F20" size="32" value="TIME:yyyymmdd" name="F20" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F20').value,document.getElementById('V20').value,document.getElementById('R20'))">格式&gt;&gt;</a>            
<input type="text" id="R20" size="31">                                                                        

<br>
21 把<input type="text" id="V21" size="23" value="Time" name="V21">转换为时间<input type="text" id="F21" size="32" value="TIME:HH:mm:ss" name="F21" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F21').value,document.getElementById('V21').value,document.getElementById('R21'))">格式&gt;&gt;</a>            
<input type="text" id="R21" size="31">                                                                        

<br>
22 把<input type="text" id="V22" size="23" value="Now" name="V22">转时间数值<input type="text" id="F22" size="32" value="TIME:FloatValue" name="F22" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F22').value,document.getElementById('V22').value,document.getElementById('R22'))">格式&gt;&gt;</a>            
<input type="text" id="R22" size="31">                                                                        

<br>
23 把<input type="text" id="V23" size="23" value="Saturday, March 12, 2011" name="V23">判断是时间<input type="text" id="F23" size="32" value="TIME:IsValidFormat" name="F23" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F23').value,document.getElementById('V23').value,document.getElementById('R23'))">格式&gt;&gt;</a>            
<input type="text" id="R23" size="31">                                                                       

<br>
24 取<input type="text" id="V24" size="23" value="2011/3/15" name="V24">星期几序号<input type="text" id="F24" size="32" value="TIME:WeekIndex" name="F24" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F24').value,document.getElementById('V24').value,document.getElementById('R24'))">格式&gt;&gt;</a>            
<input type="text" id="R24" size="31">                                                                       

<br>
25 取<input type="text" id="V25" size="23" value="简体中文汉字" name="V25">拼音首字母<input type="text" id="F25" size="32" value="CHAR:FirstPinYin" name="F25" style="color: #0000FF">            
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F25').value,document.getElementById('V25').value,document.getElementById('R25'))">格式&gt;&gt;</a>            
<input type="text" id="R25" size="31">                                                                      

<br>
26 把<input type="text" id="V26" size="23" value="abcd123eH" name="V26">判断纯字符<input type="text" id="F26" size="32" value="CHAR:IsCharacter" name="F26" style="color: #0000FF">           
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F26').value,document.getElementById('V26').value,document.getElementById('R26'))">格式&gt;&gt;</a>           
<input type="text" id="R26" size="31">                                                                     

<br>
27 把<input type="text" id="V27" size="23" value="汉字无字母" name="V27">判断纯汉字<input type="text" id="F27" size="32" value="CHAR:IsChinese" name="F27" style="color: #0000FF">           
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F27').value,document.getElementById('V27').value,document.getElementById('R27'))">格式&gt;&gt;</a>           
<input type="text" id="R27" size="31">                                                                     

<br>
<br>
28 要想获得字符串<input type="text" id="V28" size="93" value="含有特殊字符&quot;'>.<,-\/?&%￥@#以及汉字等内容的字符长串" name="V28"><br>                                  
的BASE64编码(该编码仅包含<font color="#0000FF">字母</font>和<font color="#0000FF">+/=</font>便于流转或存数据库)，用<font color="#0000FF">CHAR:EncodeBase64</font>格式<a href="javascript:;" onclick="javascript:getFormatValue('CHAR:EncodeBase64',document.getElementById('V28').value,document.getElementById('R28'))">转换如下:</a><br>
<input type="text" id="R28" size="112">                                 

<br>
<br>
29 要返回BASE64编码<input type="text" id="V29" size="90" value="uqzT0MzYyuLX1rf7Iic+LjwsLVwvPyYlo6RAI9LUvLC6utfWtcjE2sjdtcTX1rf7s6S0rg==" name="V29"><br>                                   
原字符串内容,用<font color="#0000FF">CHAR:DecodeBase64</font>格式<a href="javascript:;" onclick="javascript:getFormatValue('CHAR:DecodeBase64',document.getElementById('V29').value,document.getElementById('R29'))">转换如下:</a><br>
<input type="text" id="R29" size="112">                                 

<br>
<br>
30 要获得文件<input type="text" id="V30" size="19" value="C:\test.jpg" name="V30"><a href="javascript:;" onclick="javascript:document.getElementById('V30').value=getOneFileName()">另选文件</a>    
的BASE64编码，用<font color="#0000FF">FILE:EncodeBase64</font>格式<a href="javascript:;" onclick="javascript:getFormatValue('FILE:EncodeBase64',document.getElementById('V30').value,document.getElementById('R30'))">转换如下:</a>                        
<br>
<textarea rows="7" id="R30"  cols="110"></textarea>                            

<p>31 把如下BASE64编码：                          
<br>
<textarea rows="17" id="V31"  cols="110" name="V31">/9j/4AAQSkZJRgABAgIAAAAAAAD//gAeQUNEIFN5c3RlbXMgRGlnaXRhbCBJbWFnaW5nAP/AABEI
AEIAYwMBIgACEQEDEQH/2wCEABQNDxEPDBQREBEWFRQXHjIgHhsbHj0rLiQySD9MS0c/RkRQWnNh
UFVsVkRGZIhlbHZ6gIKATWCNl4x9lnN+gHsBHyEhLSctWDAwWLl7aXu5ubm5ubm5ubm5ubm5ubm5
ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5uf/EAHkAAQADAQEBAAAAAAAAAAAAAAAD
BAUCAQYQAAICAgAFAgQDBwUAAAAAAAECAAMEEQUSIUFREzEiYXGBFDJCBiORobHB0VNykuHwAQEB
AQEAAAAAAAAAAAAAAAAAAgEDEQEBAQEBAAMAAAAAAAAAAAAAARECURIxQf/aAAwDAQACEQMRAD8A
+yiIgInk4stCnQ+JvAgdyNr0H5dsflIbXA+K5wo7Azmu2qwlUYEjrrWjqB22RZ2RR9TImzLl/Sh+
xnVhAEo5FoEC0vE9H46v+JlmnMotOg+m8N0mGOaw9JMMZiOsDeiZFGRdikBtvX4PuPpNSq1Lqw9b
BlPeB1ERA9iJTycglvSrP+4j+kDu6/ZKVnr3bxM7OsxMWotbUjOfYa6mT3WrjUc5GyeijyZm24L3
g35DHmPXqdBRKk1luK9V19p5lJrTsAdn+P8AaaWM93MLvT9RAvINNonyRv3HSVMDFe12X1GalTvm
+Xgf+6TSucVpoaAA0AO03q/hEFubW+1BIce6MNEfaVRzXWaEiy2W48rDm8fL6eJDZa+MPRFmwRtm
/Uo8b+cmTWtH8XjYxKDmtsHuKxvX1PsJE/GdflxT97BMay9iOVBpR7ASAu2+pl/GJ1sX8UutQhQl
W+4PMZ1wbP8AwmQK2Y+i50d9j5mMrmSKdysjNffRIOHMzcPoaz8xQb3LHScVqXEcr0VFSH94/fwJ
WxhsgSHJYNxC7mPVWA+2pPjuqsIFHJyUt4siOdVoDr7f9ybJrOfYtFbgoPisYb19we/9YowfVJJ9
MKrELbvZI34lxzVjU8lY0B1PknyZW+MxyxqxqRXWNKv85l5WSWJnmXl7JlFrOZpjUyuERrn9lG9e
ZnF2tcs56k7b6yXMt5itCnovVvr2kI6S+YmvXOh0kDHrJGBY6A3L2DwPLyiGKciHu3SVbjJFClHs
cIilmPYCfQcJ4NzMLL+oHYew/wAzSwODUYifEec9x7CaQAA0AAB2nO9eKwA0AANARESWsjjnDrrS
MvDIF6jTIfZx/kTFTihqBXIRqbAO46b+s+ylPM4bj5Y+NdN5ExUz6rIpyj6QFbhlA10O5Dk5bkEG
c5n7L2oS+HZyt5Q6mRdjcbxX1cllqeQm4lbefEt1pJMh/EcnXpvsJC5y2OjVdvwKyP7T2rhnEcht
VYd5B7ldD+cvHPXVR2CxOyfcy9gcOvzrNVp8I92PsJocJ/ZmxCLM5wB/pod/xM+lqrSqsJWgVR7A
CbevGYo4HB8bEAYqLLB+ojoPoJoT2JCiIiB5ERAREQEREBERAREQEREBERAREQP/2Q==</textarea><br>
用格式<input type="text" id="F31" name="F31" size="40" value="FILE:DecodeBase64,C:\test1.jpg"  style="color: #0000FF">
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F31').value,document.getElementById('V31').value,document.getElementById('R31'))">写入文件</a>看看成功与否:<input type="text" id="R31" size="19">          
<br>
以上BASE64转换可以让WEB页面把本地任何文件当“长字符串”存入服务器数据库字段。<br>
<br>
32 把<input type="text" id="V32" size="23" value="255" name="V32">转换为颜色<input type="text" id="F32" size="32" value="COLOR:Hex" name="F32" style="color: #0000FF">         
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F32').value,document.getElementById('V32').value,document.getElementById('R32'))">格式&gt;&gt;</a>           
<input type="text" id="R32" size="31">                                                                     

<br>
33 把<input type="text" id="V33" size="23" value="#FF0000" name="V33">转换为颜色<input type="text" id="F33" size="32" value="COLOR:name" name="F33" style="color: #0000FF">         
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F33').value,document.getElementById('V33').value,document.getElementById('R33'))">格式&gt;&gt;</a>           
<input type="text" id="R33" size="31">                                                                     

<br>
34 把<input type="text" id="V34" size="23" value="red" name="V34">转换为颜色<input type="text" id="F34" size="32" value="COLOR:decimal" name="F34" style="color: #0000FF">         
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F34').value,document.getElementById('V34').value,document.getElementById('R34'))">格式&gt;&gt;</a>           
<input type="text" id="R34" size="31">                                                                     

<br>
35 把<input type="text" id="V35" size="23" value="green" name="V35">转换为颜色<input type="text" id="F35" size="32" value="COLOR:Hex" name="F35" style="color: #0000FF">         
<a href="javascript:;" onclick="javascript:getFormatValue(document.getElementById('F35').value,document.getElementById('V35').value,document.getElementById('R35'))">格式&gt;&gt;</a>           
<input type="text" id="R35" size="31">                                                                     

<p>
<br>
<br>

<a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">
&lt;&lt;回样例目录</a>


<p><br>
</p>

</body>
</html>
