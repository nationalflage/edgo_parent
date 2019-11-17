﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例三十八:用BASE64编码输出图片</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示用BASE64编码输出图片：</font></h2>
<p>&nbsp;&nbsp;&nbsp; BASE64编码是用字符串传递图片的常用方式，当浏览器(如IE6、IE7)不支持BASE64图片时，</p>                   
<p>可把图片编码直接送给ADD_PRINT_IMAGE输出图片。编码描述说明的格式不变，样式如下：</p>              
<p><font color="#FF0000">data:image/jpg;base64,</font><font color="#0000FF">XXXXXXXXXXXXXXXX&nbsp;</font> 
&nbsp;其中红色部分是编码描述说明，蓝色部分是内容,</p>                
<p>注意紧跟&quot;<font color="#FF0000">/</font>&quot;之后的图片格式&quot;<font color="#FF0000">jpg</font>&quot;很重要，  
一定要与生成编码时的图片格式保持一致，</p>              
<p>目前控件支持bmp、jpg、jpeg、gif、png、ico、emf、wmf等格式的图片。</p>              
<p>用下面的编码串进入<a href="javascript:myPreview()">打印预览</a>看看,也可以是打印维护或
<a href="javascript:myDesign()">打印设计</a>的背景图：
</p>              



<textarea rows="28" id="t1" cols="85">
data:image/jpg;base64,
/9j/4AAQSkZJRgABAgIAAAAAAAD//gAeQUNEIFN5c3RlbXMgRGlnaXRhbCBJbWFnaW5nAP/AABEI
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
CbevGYo4HB8bEAYqLLB+ojoPoJoT2JCiIiB5ERAREQEREBERAREQEREBERAREQP/2Q==
</textarea>

<br>
注：用LODOP生成BASE64编码的方法请参考<a href="PrintSample40.html">样例四十</a>的最后几个演示

<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>

<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量 
	function myPreview() {	
		LODOP=getLodop();             
		var strBASE64Code=document.getElementById('t1').value;
	        LODOP.PRINT_INIT("打印插件功能演示_Lodop功能_BASE64编码串打印图片");
	        LODOP.ADD_PRINT_IMAGE(100,100,"100%","100%",strBASE64Code);
	    	LODOP.PREVIEW();	
	};	
	function myDesign() {	
		LODOP=getLodop();             
		var strBASE64Code=document.getElementById('t1').value;
	        LODOP.PRINT_INIT("打印插件功能演示_Lodop功能_BASE64编码串当背景图");
		LODOP.ADD_PRINT_SETUP_BKIMG(strBASE64Code);
		LODOP.ADD_PRINT_TEXT(22,30,193,28,"这是正常内容,后面是背景图");
	    	LODOP.PRINT_DESIGN();	
	};			
</script> 



</body>
</html>