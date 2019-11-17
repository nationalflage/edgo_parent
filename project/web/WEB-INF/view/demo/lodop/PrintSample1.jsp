﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例一:在页面内引入打印控件</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="78%" height="152">
  <tr>
    <td width="100%" height="20"><h2><font color="#009999">演示如何在页面内引入打印控件Lodop：</font></h2></td>
  </tr>
  <tr>
    <td width="100%" height="5"></td>
  </tr>
  <tr>
    <td width="100%" height="20"><b><font size="3" face="黑体">一、嵌入方式</font><font size="3" face="宋体">：</font></b></td>
  </tr>
  <tr>
    <td width="100%" height="20">
<font face="宋体">&nbsp;通常情况下,在页面中嵌入Lodop的如下引用代码，然后用一个全局对象变量来使用控件：</font></td>       
  </tr>
  <tr>
    <td width="100%" height="20"><font face="宋体">·在head或body中加入：</font></td>
  </tr>
  <tr>
    <td width="100%" height="20"><font size="2" color="#0000FF" face="宋体">&lt;script                 
      language=&quot;javascript&quot; src=&quot;LodopFuncs.js&quot;&gt;&lt;/script&gt;</font></td>                
  </tr>  
  <tr>  
    <td width="100%" height="20"><font size="2" color="#0000FF" face="宋体">&lt;object&nbsp;                 
      id=&quot;LODOP_OB&quot; classid=&quot;clsid:2105C259-1E0C-4534-8141-A753534CB4CA&quot;                 
      width=0 height=0&gt;&nbsp;</font></td>                        
  </tr>  
  <tr>  
    <td width="100%" height="20"><font size="2" color="#0000FF" face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
      &lt;embed id=&quot;LODOP_EM&quot; type=&quot;application/x-print-lodop&quot;                 
      width=0 height=0&gt;&lt;/embed&gt;</font></td>                      
  </tr>  
  <tr>  
    <td width="100%" height="20"><font size="2" color="#0000FF" face="宋体">&lt;/object&gt;</font></td>  
  </tr>  
  <tr>  
    <td width="100%" height="20"><font face="宋体">·在调用Lodop功能前，先用如下JS过程获得控件对象：</font></td>  
  </tr>  
  <tr>  
    <td width="100%" height="20"><span LANG="ZH"><font color="#0000FF" size="2" face="宋体">&nbsp;&nbsp;&nbsp;      
      var </font><font color="#0000FF" size="2">LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));</font></span></td>              
  </tr>  
  <tr>  
    <td width="100%" height="22"><font face="宋体">·现在测试一下：<a href="javascript:CheckIsInstall()">查看本机是否安装了控件或云打印</a></font></td>  
  </tr>  
  <tr>  
    <td width="100%" height="22"><font face="宋体">·</font>当页面不添加以上代码时，getLodop过程会动态建立它们，语句简化如下(推荐)：</font></td>
  </tr>
  <tr>  
    <td width="100%" height="20"><span LANG="ZH"><font color="#0000FF" size="2" face="宋体">&nbsp;&nbsp;&nbsp;      
      var </font><font color="#0000FF" size="2">LODOP=getLodop();</font></span></td>              
  </tr>  
  <tr> 
    <td width="100%" height="20"><b><font size="3" face="黑体">二、相关文件：</font></b> 
    </td> 
  </tr> 
  <tr> 
    <td width="100%" height="20">Lodop相关文件说明如下：</td> 
  </tr> 
  <tr> 
    <td width="100%" height="20"><font color="#0000FF">·install_lodop32.exe和install_lodop64.exe</font></td> 
  </tr> 
  <tr> 
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp;            
      这俩文件是安装和升级的主程序，对应32位和64位浏览器（这里是浏览器位数不是操作系统位数），</td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp; 提供给用户下载后使用，如果将它们复制或改名为<font color="#0000FF">uninstall_lodop32.exe</font>(名前加un)就可用其卸载控件。</td>   
  </tr>  
  <tr>  
    <td width="100%" height="20"><font size="2" color="#0000FF">·LodopFuncs.js</font></td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp;           
      该文件是个样例，里面包含JS过程<span LANG="ZH"><font color="#0000FF" size="2">getLodop</font></span>，该过程根据浏览器类型来取用页面元素(object或embed)，</td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp; 从而兼容各种浏览器，同时检查控件是否安装、是否最新版本，</td>   
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp; 然后引导用户对应下载执行install_lodop32.exe文件或install_lodop64.exe。</td>   
  </tr>  
  <tr>  
    <td width="100%" height="20"><font color="#0000FF">·lodop</font>实体文件</td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp; 控件被安装后，其实体文件<font color="#0000FF">CAOSOFT_WEB_PRINT_LODOP.OCX</font>和<font color="#0000FF">NPCAOSOFT_WEB_PRINT_lodop.dll</font></td>     
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp;&nbsp;&nbsp;  被自动安装在系统Program Files\MountTaiSoftware\Lodop目录下，开发者也可将其自主签名，</td>  
  </tr>  
  <tr>  
    <td width="100%" height="18">&nbsp;&nbsp;&nbsp;  用其它方式发布。亲手制作CAB参考：<a href="http://blog.sina.com.cn/s/blog_721e77e50100ng1r.html" target="_blank">http://blog.sina.com.cn/s/blog_721e77e50100ng1r.html</a></td>  
  </tr>  
  <tr>  
    <td width="100%" height="20"></td>  
  </tr>  
  <tr>  
    <td width="100%" height="20"><b><font size="3" face="黑体">三、支持的浏览器：</font></b>  
    </td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">&nbsp; 目前Lodop支持<font color="#0000FF">IE系列、IE内核系列</font>(遨游、360、世界之窗、搜狗、蚂蚁等)浏览器，以及</td>   
  </tr>  
  <tr>  
    <td width="100%" height="20"><font color="#0000FF">Firefox</font>(火狐)系列、<font color="#0000FF">Chrome</font>(谷歌)系列、<font color="#0000FF">Opera</font>系列、<font color="#0000FF">Safari</font>系列等各类浏览器，</td>  
  </tr>  
  <tr>  
    <td width="100%" height="20">以上安装程序为所有浏览器一次性安装完毕，不需要为各系列浏览器分别安装。</td>  
  </tr>  
 
 
</table> 
 
<script language="javascript" type="text/javascript">    
	function CheckIsInstall() {	 
		try{ 
		     var LODOP=getLodop(); 
			if (LODOP.VERSION) {
				 if (LODOP.CVERSION)
				 alert("当前有C-Lodop云打印可用!\n C-Lodop版本:"+LODOP.CVERSION+"(内含Lodop"+LODOP.VERSION+")"); 
				 else
				 alert("本机已成功安装了Lodop控件！\n 版本号:"+LODOP.VERSION); 

			};
		 }catch(err){ 
 		 } 
	}; 
</script> 
 
 
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p> 
 
</body> 
</html></script>