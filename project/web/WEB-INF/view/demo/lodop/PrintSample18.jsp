﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例十八:幅面高度不固定的票据打印</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><font color="#009999">幅面高度不固定的票据打印：</font></h2>

<p>用<a href="PrintSample5.html">样例五</a>介绍过的函数<font color="#0000FF" size="3">SET_PRINT_PAGESIZE</font>可以实现“纸张高度”按“打印内容自适应”</p>
<p>下面演示打印如下商品清单，操作前可以勾选不同的商品，观察打印预览效果：</p>

<div id="splist" style="OVERFLOW-Y: scroll; WIDTH: 100%; POSITION: HEIGHT: 200px">
  <table class="tableframe2" style="WORD-BREAK: break-all" width="97%" align="center">
    <tbody>
      <tr id="id1" style="BACKGROUND-COLOR: #dae2ed">
        <td  align="middle" width="4%" height="25" bgcolor="#C0C0C0"></td>
        <td  align="center" width="15%" height="25" bgcolor="#C0C0C0">
          <p align="center"><b>商品编号</b></p>
        </td>
        <td  align="center" width="31%" bgcolor="#C0C0C0"><b>商品名称</b></td>
        <td  align="center" width="14%" bgcolor="#C0C0C0"><b>数量</b></td>
        <td  align="center" width="15%" bgcolor="#C0C0C0"><b>单价(元)</b></td>
      </tr>
      <tr    style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK1" value="ON" checked onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text" id="BH1" value="001" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text" id="MC1" value="商品A" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text" id="SL1" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text" id="DJ1" value="10.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr>
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK2" value="ON" onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text" id="BH2" value="002" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text" id="MC2" value="商品B" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text" id="SL2" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text" id="DJ2" value="20.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr>  
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK3" value="ON" checked onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text"    id="BH3" value="003" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text"  id="MC3" value="商品C" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text"  id="SL3" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text"  id="DJ3" value="70.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr>        
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK4" value="ON" checked onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text"    id="BH4" value="004" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text"  id="MC4" value="商品D" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text"  id="SL4" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text"  id="DJ4" value="25.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr>   
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK5" value="ON" onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text"    id="BH5" value="005" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text"  id="MC5" value="商品E" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text"  id="SL5" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text"  id="DJ5" value="40.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr> 
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK6" value="ON" onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text"    id="BH6" value="006" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text"  id="MC6" value="商品F" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text"  id="SL6" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text"  id="DJ6" value="36.50" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr>
      <tr style="BACKGROUND-COLOR: #dae2ed">
        <td   width="4%" height="25"><input type="checkbox" id="CK7" value="ON" onClick="ReSumMoney()"></td>
        <td   width="15%" height="25"><input type="text"    id="BH7" value="007" style="text-align:center;border:0px;background-color:#dae2ed" ></td> 
        <td  align="center" width="31%"><input type="text"  id="MC7" value="商品G" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="14%"><input type="text"  id="SL7" value="1.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
        <td  align="center" width="15%"><input type="text"  id="DJ7" value="60.00" style="text-align:center;border:0px;background-color:#dae2ed" ></td>
      </tr> 
    </tbody>
  </table>
</div>
<table width="874">
  <tr>
    <td align="right" width="371" height="26">
      <p align="left"></td>
    <td align="right" width="78"><b>收银员:</b></td>
    <td align="right" width="146">
      <p align="left">0018</td>
    <td align="right" width="99"><b>合计金额:</b></td>
    <td align="right" width="138">
      <p align="left"><input type="text"  id="HJ" value="105.00" style="border:0px;"  size="20" name="T11"></p>
    </td>
  </tr>
</table>
<p><font color="#009999" size="3">现在开始</font><font size="2"><input type="button" value="打印预览" onClick="MyPreview()"><br><br></font>
</p>
<p><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>
<script language="javascript" type="text/javascript"> 
        var LODOP; //声明为全局变量
	function ReSumMoney() {	
		var fSumvalue=0;
		for (i = 1; i < 8; i++) {
			if (document.getElementById("CK"+i).checked) {
  				fSumvalue=fSumvalue+parseFloat(document.getElementById("DJ"+i).value);
			}			 
		}	
		document.getElementById("HJ").value=fSumvalue.toFixed(2);
	};
	function MyPreview() {	
		AddTitle();
		var iCurLine=80;//标题行之后的数据从位置80px开始打印
		for (i = 1; i < 8; i++) {
			if (document.getElementById("CK"+i).checked) {				
				LODOP.ADD_PRINT_TEXT(iCurLine,15,100,20,document.getElementById("BH"+i).value);
				LODOP.ADD_PRINT_TEXT(iCurLine,149,100,20,document.getElementById("MC"+i).value);
				LODOP.ADD_PRINT_TEXT(iCurLine,289,100,20,document.getElementById("SL"+i).value);
				LODOP.ADD_PRINT_TEXT(iCurLine,409,100,20,document.getElementById("DJ"+i).value);
				iCurLine=iCurLine+25;//每行占25px
			}			 
		}		
		LODOP.ADD_PRINT_LINE(iCurLine,14,iCurLine,510,0,1);
		LODOP.ADD_PRINT_TEXT(iCurLine+5,20,300,20,"打印时间："+(new Date()).toLocaleDateString()+" "+(new Date()).toLocaleTimeString());
                LODOP.ADD_PRINT_TEXT(iCurLine+5,346,150,20,"合计金额："+document.getElementById("HJ").value);				
		LODOP.SET_PRINT_PAGESIZE(3,1385,45,"");//这里3表示纵向打印且纸高“按内容的高度”；1385表示纸宽138.5mm；45表示页底空白4.5mm
		LODOP.PREVIEW();	
	};
	function AddTitle(){	
		LODOP=getLodop();  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_不同高度幅面");
		LODOP.ADD_PRINT_TEXT(15,102,355,30,"北京市东城区沃乐福商城收款票据");
		LODOP.SET_PRINT_STYLEA(1,"FontSize",13);
		LODOP.SET_PRINT_STYLEA(1,"Bold",1);
		LODOP.ADD_PRINT_TEXT(50,15,100,20,"商品编号");
		LODOP.SET_PRINT_STYLEA(2,"FontSize",10);
		LODOP.SET_PRINT_STYLEA(2,"Bold",1);
		LODOP.ADD_PRINT_TEXT(50,149,100,20,"商品名称");
		LODOP.SET_PRINT_STYLEA(3,"FontSize",10);
		LODOP.SET_PRINT_STYLEA(3,"Bold",1);
		LODOP.ADD_PRINT_TEXT(50,289,100,20,"商品数量");
		LODOP.SET_PRINT_STYLEA(4,"FontSize",10);
		LODOP.SET_PRINT_STYLEA(4,"Bold",1);
		LODOP.ADD_PRINT_TEXT(50,409,100,20,"单价(元)");
		LODOP.SET_PRINT_STYLEA(5,"FontSize",10);
		LODOP.SET_PRINT_STYLEA(5,"Bold",1);
		LODOP.ADD_PRINT_LINE(72,14,73,510,0,1);
	};	
</script> 

</body>
</html>