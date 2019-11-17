﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例二十八:获取客户端系统信息</title>

<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<script language="javascript">  
   var LODOP; //声明为全局变量  
   function getSystemInfo(strINFOType,oResultOB){
       LODOP=getLodop(); 
       if (LODOP.CVERSION) CLODOP.On_Return=function(TaskID,Value){if (oResultOB) oResultOB.value=Value;}; 
       var strResult=LODOP.GET_SYSTEM_INFO(strINFOType);
       if (!LODOP.CVERSION) return strResult; else return "";
   }
</script>

<h2><b><font color="#009999">演示获取客户端系统信息:</font></b></h2>
<p style="line-height: 150%">Lodop提供了一个读取客户端系统信息的函数，其格式如下：<br>       
<font color="#0000FF">LODOP.GET_SYSTEM_INFO(strINFOType);</font><br>
参数<font color="#0000FF">strINFOType</font>说明：<br>
该参数大多是“设备类型”和“设备属性”的名称组合，用“.”号联结。<br>
当有多个同类设备存在时，类型名后加“点和序号”来指定某设备。<br>
设备类型和属性名称见<font color="#0000FF"><a href="http://msdn.microsoft.com/en-us/library/aa394084(v=VS.85).aspx" target="_blank">WMI</a></font>（MicrosoftWindows管理规范）。<br>
<b>1、演示获得部分设备信息：</b><br>
<input type="button" value="所有驱动的盘符:" 
onclick="document.getElementById('T1').value=getSystemInfo('Drive.Labels',document.getElementById('T1'))"><input type="text" id="T1" size="48"><br>
<input type="button" value="第一个硬盘的盘符:" 
onclick="document.getElementById('T2').value=getSystemInfo('DiskDrive.1.Label',document.getElementById('T2'))"><input type="text" id="T2" size="45"><br>
<input type="button" value="第一个光盘的盘符:" 
onclick="document.getElementById('T3').value=getSystemInfo('CDROMDrive.1.Label',document.getElementById('T3'))"><input type="text" id="T3" size="45"><br>
<input type="button" value="第一个优盘的盘符:" 
onclick="document.getElementById('T4').value=getSystemInfo('RemovableDrive.1.Label',document.getElementById('T4'))"><input type="text" id="T4" size="45"><br>
<input type="button" value="主硬盘的序列号:" 
onclick="document.getElementById('T5').value=getSystemInfo('DiskDrive.1.SerialNumber',document.getElementById('T5'))"><input type="text" id="T5" size="47">        
 <br>
<input type="button" value="主网卡MAC地址:" 
onclick="document.getElementById('T6').value=getSystemInfo('NetworkAdapter.1.PhysicalAddress',document.getElementById('T6'))"><input type="text" id="T6" size="48">    
<br>
<input type="button" value="主网卡IP地址:" 
onclick="document.getElementById('T7').value=getSystemInfo('NetworkAdapter.1.IPAddress',document.getElementById('T7'))"><input type="text" id="T7" size="49">  
<br>
<input type="button" value="主网卡Mask" 
onclick="document.getElementById('T8').value=getSystemInfo('NetworkAdapter.1.SubnetMask',document.getElementById('T8'))"><input type="text" id="T8" size="53">  
<br>
<input type="button" value="网卡个数:" 
onclick="document.getElementById('T9').value=getSystemInfo('NetworkAdapter.Count',document.getElementById('T9'))"><input type="text" id="T9" size="54"> <br>
<input type="button" value="硬盘个数:" 
onclick="document.getElementById('T10').value=getSystemInfo('DiskDrive.Count',document.getElementById('T10'))"><input type="text" id="T10" size="54">
<br>
<input type="button" value="CPU序列号:" 
onclick="document.getElementById('T11').value=getSystemInfo('Processor.CPUID',document.getElementById('T11'))"><input type="text" id="T11" size="52">
<br>
<input type="button" value="BIOS序列号:" 
onclick="document.getElementById('T12').value=getSystemInfo('BIOS.SerialNumber',document.getElementById('T12'))"><input type="text" id="T12" size="51">
<br>
<input type="button" value="主板序列号:" 
onclick="document.getElementById('T13').value=getSystemInfo('BaseBoard.SerialNumber',document.getElementById('T13'))"><input type="text" id="T13" size="51">
<br>

<br>
<b>2、演示获得操作系统和打印机的常见信息：</b><br>

<font color="#0000FF">OperatingSystem</font>的            
<select size="1" id="Select42">  
  <option value="Name">Name</option>  
  <option value="Caption">Caption</option>    
  <option value="BuildNumber">BuildNumber</option>    
  <option value="BuildType">BuildType</option>    
  <option value="CodeSet">CodeSet</option>    
  <option value="CountryCode">CountryCode</option>    
  <option value="CreationClassName">CreationClassName</option>    
  <option value="CSCreationClassName">CSCreationClassName</option>    
  <option value="CSDVersion">CSDVersion</option>    
  <option value="CSName">CSName</option>    
  <option value="CurrentTimeZone">CurrentTimeZone</option>    
  <option value="BootDevice">BootDevice</option>    
  <option value="Description">Description</option>    
  <option value="EncryptionLevel">EncryptionLevel</option>    
  <option value="InstallDate">InstallDate</option>    
  <option value="Locale">Locale</option>    
  <option value="Manufacturer">Manufacturer</option>    
  <option value="Organization">Organization</option>    
  <option value="OSArchitecture">OSArchitecture</option>    
  <option value="OtherTypeDescription">OtherTypeDescription</option>    
  <option value="PlusProductID">PlusProductID</option>    
  <option value="RegisteredUser">RegisteredUser</option>    
  <option value="SerialNumber">SerialNumber</option>    
  <option value="Status">Status</option>    
  <option value="WindowsDirectory">WindowsDirectory</option>    
  <option value="Version">Version</option>    
  <option value="SuiteMask">SuiteMask</option>    
  <option value="SystemDevice">SystemDevice</option>    
  <option value="SystemDirectory">SystemDirectory</option>    
  <option value="SystemDrive">SystemDrive</option>    
  <option value="OperatingSystemSKU">OperatingSystemSKU</option>    
  <option value="PlusVersionNumber">PlusVersionNumber</option>    
</select><input type="button" value="值:"     
onclick="document.getElementById('T14').value=getSystemInfo('OperatingSystem.'+document.getElementById('Select42').value,document.getElementById('T14'))"><input type="text" id="T14" size="60">    
<br>  
  
<font color="#0000FF">Printer</font>的            
<select size="1" id="Select52">  
  <option value="Name">Name</option>  
  <option value="Caption">Caption</option>  
  <option value="Default">Default</option>  
  <option value="DefaultCopies">DefaultCopies</option>  
  <option value="Description">Description</option>  
  <option value="DriverName">DriverName</option>  
  <option value="Location">Location</option>  
  <option value="Status">Status</option>  
  <option value="StartTime">StartTime</option>  
  <option value="CurrentCharSet">CurrentCharSet</option>  
  <option value="DeviceID">DeviceID</option>  
  <option value="MaxCopies">MaxCopies</option>  
  <option value="PrinterStatus">PrinterStatus</option>  
  <option value="PrintJobDataType">PrintJobDataType</option>  
  <option value="SystemName">SystemName</option>  
  <option value="SystemCreationClassName">SystemCreationClassName</option>  
  <option value="CurrentPaperType">CurrentPaperType</option>  
  <option value="Comment">Comment</option>  
  <option value="AveragePagesPerMinute">AveragePagesPerMinute</option>  
  <option value="CreationClassName">CreationClassName</option>  
  <option value="CurrentMimeType">CurrentMimeType</option>  
  <option value="CurrentNaturalLanguage">CurrentNaturalLanguage</option>  
  <option value="DefaultPaperType">DefaultPaperType</option>  
  <option value="DefaultMimeType">DefaultMimeType</option>  
  <option value="InstallDate">InstallDate</option>  
  <option value="Parameters">Parameters</option>  
  <option value="PNPDeviceID">PNPDeviceID</option>  
  <option value="PortName">PortName</option>  
  <option value="ServerName">ServerName</option>  
</select><input type="button" value="值:"     
onclick="document.getElementById('T15').value=getSystemInfo('Printer.'+document.getElementById('Select52').value,document.getElementById('T15'))">  
<input type="text" id="T15" size="65">        
<br>  
  
<br>  
更多WIN32系统的相关信息(属性参考WMI)：<br>  
  
<select size="1" id="Select61">  
  <option value="Processor">Processor</option>  
  <option value="PhysicalMemory">PhysicalMemory</option>  
  <option value="Keyboard">Keyboard</option>  
  <option value="PointingDevice">PointingDevice</option>  
  <option value="DiskDrive">DiskDrive</option>  
  <option value="CDROMDrive">CDROMDrive</option>  
  <option value="BaseBoard">BaseBoard</option>  
  <option value="BIOS">BIOS</option>  
  <option value="ParallelPort">ParallelPort</option>  
  <option value="SerialPort">SerialPort</option>  
  <option value="SoundDevice">SoundDevice</option>  
  <option value="USBController">USBController</option>  
  <option value="NetworkAdapter">NetworkAdapter</option>  
  <option value="NetworkAdapterConfiguration">NetworkAdapterConfiguration</option>  
  <option value="PrinterConfiguration">PrinterConfiguration</option>  
  <option value="PrintJob">PrintJob</option>  
  <option value="TCPIPPrinterPort">TCPIPPrinterPort</option>  
  <option value="POTSModem">POTSModem</option>  
  <option value="POTSModemToSerialPort">POTSModemToSerialPort</option>  
  <option value="DesktopMonitor">DesktopMonitor</option>  
  <option value="VideoController">VideoController</option>  
  <option value="VideoSettings">VideoSettings</option>  
  <option value="TimeZone">TimeZone</option>  
  <option value="SystemDriver">SystemDriver</option>  
  <option value="DiskPartition">DiskPartition</option>  
  <option value="LogicalDisk">LogicalDisk</option>  
  <option value="LogicalMemoryConfiguration">LogicalMemoryConfiguration</option>  
  <option value="PageFile">PageFile</option>  
  <option value="PageFileSetting">PageFileSetting</option>  
  <option value="BootConfiguration">BootConfiguration</option>  
  <option value="StartupCommand">StartupCommand</option>  
  <option value="Service">Service</option>  
  <option value="Group">Group</option>  
  <option value="GroupUser">GroupUser</option>  
  <option value="UserAccount">UserAccount</option>  
  <option value="Process">Process</option>  
  <option value="Thread">Thread</option>  
  <option value="Share">Share</option>  
  <option value="NetworkClient">NetworkClient</option>  
  <option value="NetworkProtocol">NetworkProtocol</option>  
</select>的<input type="text" id="T161" size="13" value="Name"><input type="button" value="值:"     
onclick="document.getElementById('T16').value=getSystemInfo(document.getElementById('Select61').value+'.'+document.getElementById('T161').value,document.getElementById('T16'))">  
<input type="text" id="T16" size="60">        
<br>  
  
<br>  
更多关于打印状态的捕获<a href="PrintSample45.html">参考样例45</a>.<p style="line-height: 150%">

<b>3、演示获得系统GetLastError信息：</b>
<p style="line-height: 150%">
<input type="button" value="GetLastError:" onclick="document.getElementById('T20').value=getSystemInfo('GetLastError',document.getElementById('T20'))">
<input type="text" id="T20" size="11">代码含义<a href="http://wenku.baidu.com/view/e8828627a5e9856a561260bb.html" target="_blank">参考这里</a>。

<p style="line-height: 150%"><a href="javascript:void(0);" onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a>
</p>



</body>
</html>
