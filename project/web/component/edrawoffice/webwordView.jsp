<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String webapp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title>${dataMap.WORDNAME}</title>
	</head>
    <script type="text/javascript" language="javascript" src="./edrawoffice.js"></script>    
    <script type="text/javascript" language="javascript">
    	function fn_load(){
    		document.all.OA1.Open("<%=webapp%><%out.print(request.getParameter("src"));%>");
            if (document.all.OA1.IsOpened()) {
                var x = document.OA1.Toolbars;
                document.OA1.Toolbars = !x;
            }
    	}
        function CloseDoc() {
            if (document.OA1.IsOpened) {
                document.all.OA1.CloseDoc();
            }
        }
        function PrintDoc() {
            if (document.all.OA1.IsOpened()) {
                document.all.OA1.PrintDialog();
            }
        }
        function SaveAs() {
            if (document.all.OA1.IsOpened()) {
                document.all.OA1.SaveFileDialog();
                //You can call the SaveAs method to save silently.
            }
        }
    </script>
	<body onload="fn_load();" style="margin: 0;padding:0;">
	<div>
		<div style="padding-left:20px">
			<input type="button" onclick="PrintDoc();" value="在线打印" style="width:100px;" />
			<input type="button" onclick="SaveAs();" value="保存到本地" style="width:100px;"/>
		</div>
		<div>
			<object classid="clsid:7677E74E-5831-4C9E-A2DD-9B1EF9DF2DB4" id="OA1" width="100%" height="100%" codebase="<%=webapp %>/edrawoffice/officeviewer.cab#7,4,0,236">
				<param name="Toolbars" value="-1">
				<param name="LicenseName" value="30daytrial">
				<param name="LicenseCode" value="EDWD-3333-2222-1111">
				<param name="BorderColor" value="15647136">
				<param name="BorderStyle" value="2">
			</object>
		</div>
	</div>
</body>
</html>
