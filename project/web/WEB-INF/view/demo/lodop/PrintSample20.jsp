﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的使用样例二十:强制分页打印预览多张卡片</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">演示强制分页打印预览多张卡片：</font></h2>

<p>通常情况下，当对象位置超出纸张高度时，该对象会被自动打印到下一页甚至更下一页，</p>

<p>但如果纸张高度不确定时，可以用<font color="#0000FF">NewPage</font>函数直接强制在新一页的固定位置输出。</p>

<h2 align="center"><b>商品清单</b></h2>

<div id="splist" style="OVERFLOW-Y: scroll; WIDTH: 100%; POSITION: HEIGHT: 200px">
  <table class="tableframe2" style="WORD-BREAK: break-all" width="97%" align="center">
    <tbody>
      <tr id="id1" style="BACKGROUND-COLOR: #dae2ed">
        <td  align="center" width="15%" height="25" bgcolor="#C0C0C0">
          <p align="center"><b>商品编号</b></p>
        </td>
        <td  align="center" width="31%" bgcolor="#C0C0C0"><b>商品名称</b></td>
        <td  align="center" width="14%" bgcolor="#C0C0C0"><b>数量</b></td>
        <td  align="center" width="15%" bgcolor="#C0C0C0"><b>单价(元)</b></td>
      </tr>
      <tr    style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text" id="BH1" value="001" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text" id="MC1" value="商品0A" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text" id="SL1" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text" id="DJ1" value="10.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr>
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text" id="BH2" value="002" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text" id="MC2" value="商品0B" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text" id="SL2" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text" id="DJ2" value="20.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr>  
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text"    id="BH3" value="003" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text"  id="MC3" value="商品0C" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text"  id="SL3" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text"  id="DJ3" value="70.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr>        
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text"    id="BH4" value="004" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text"  id="MC4" value="商品0D" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text"  id="SL4" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text"  id="DJ4" value="25.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr>   
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text"    id="BH5" value="005" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text"  id="MC5" value="商品0E" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text"  id="SL5" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text"  id="DJ5" value="40.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr> 
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text"    id="BH6" value="006" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text"  id="MC6" value="商品0F" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text"  id="SL6" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text"  id="DJ6" value="36.50" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr>
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="15%" height="25"><input type="text"    id="BH7" value="007" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td> 
        <td  align="center" width="31%"><input type="text"  id="MC7" value="商品0G" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="14%"><input type="text"  id="SL7" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
        <td  align="center" width="15%"><input type="text"  id="DJ7" value="60.00" style="text-align:center;border:0px;background-color:#dae2ed" readonly=true></td>
      </tr> 
    </tbody>
  </table>
</div>
<p><font color="#009999" size="3">一次性输出以上全部商品的卡片（一品一页），看看</font> 
<font size="2"><input type="button" value="打印预览" onClick="MyPreview()"></font>     
</p>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>
<script language="javascript" type="text/javascript"> 
	var LODOP; //声明为全局变量
	function MyPreview() {	
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件Lodop功能演示_多页预览");
		LODOP.SET_PRINT_PAGESIZE(1,500,508,"");	
		CreateAllPages();
		LODOP.PREVIEW();
	};
	function CreateAllPages(){	
		for (i = 1; i < 8; i++) {
			LODOP.NewPage();
			LODOP.ADD_PRINT_RECT(10,18,128,160,0,1);		
			LODOP.ADD_PRINT_TEXT(31,33,111,20,"商品编号："+document.getElementById("BH"+i).value);		
			LODOP.ADD_PRINT_TEXT(69,33,111,20,"商品名称："+document.getElementById("MC"+i).value);
			LODOP.ADD_PRINT_TEXT(107,33,111,20,"商品数量："+document.getElementById("SL"+i).value);
			LODOP.ADD_PRINT_TEXT(146,33,111,20,"商品单价："+document.getElementById("DJ"+i).value);			
		}			
		
	};	
</script>

</body>
</html>