<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
    		<c:if test="${dataMap['type'] == 'add'}">
            	document.all.OA1.Open("<%=webapp%>/webword/webwordAction!makewordForPrint.dhtml?dataMap['BUSPKEY']=${dataMap['BUSPKEY']}&dataMap['TEPID']=${dataMap['TEPID']}&trackdataFileName=word.doc");
            </c:if>
            <c:if test="${dataMap['type'] == 'edit'}">
            	document.all.OA1.Open("<%=webapp%>/webword/webwordAction!makewordForPrint.dhtml?dataMap['WORDID']=${dataMap['WORDID']}&trackdataFileName=word.doc");
            </c:if>
    	}
		function fn_open() {
            window.onbeforeunload = null;
			var r = confirm("确定要重置模板吗？");
			if(r){
	            document.all.OA1.Open("<%=webapp%>/webword/webwordAction!makewordForPrint.dhtml?dataMap['BUSPKEY']=${dataMap['BUSPKEY']}&dataMap['TEPID']=${dataMap['TEPID']}&trackdataFileName=word.doc");
        		alert("重置成功。");
        	}
        }
		
		function fn_save(){
			if (document.OA1.IsOpened) {
			    document.OA1.SetAppFocus();
			    document.OA1.HttpInit();
			    document.OA1.HttpAddPostOpenedFile("${dataMap['WORDID']}.doc");
			    document.OA1.HttpPost("<%=webapp%>/webword/webwordAction!saveWord.dhtml?dataMap['BUSPKEY']=${dataMap['BUSPKEY']}&dataMap['TEPID']=${dataMap['TEPID']}&dataMap['WORDID']=${dataMap['WORDID']}&"+encodeURI("dataMap['TEPCATEGORY']=${dataMap['TEPCATEGORY']}&dataMap['WORDNAME']=${dataMap['WORDNAME']}"));
			    if (document.OA1.GetErrorCode() == 0) {
			        alert("提示:保存成功!");
			    }
			}else {
			    window.alert("提示：您word文件没有打开，不能保存!");
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
            	 document.all.OA1.SaveFileDialog("*.doc");
                //You can call the SaveAs method to save silently.
            }
        }
    </script>
	<body onload="fn_load();" style="margin: 0;padding:0;">
	<div>
		<div style="padding-left:20px;padding-right:20px">
			<%--<input type="button" onclick="fn_save();" value="在线保存" style="width:100px;float: left;"/>
			--%><input type="button" onclick="PrintDoc();" value="在线打印" style="width:100px;float: left;"/>
			<input type="button" onclick="SaveAs();" value="保存到本地" style="width:100px;float: left;"/>
            <a href="javascript:void(0);" onclick="fn_open();" style="float: right;">重置模板</a>
		</div>
		<div style="clear: both;">
			<object classid="clsid:7677E74E-5831-4C9E-A2DD-9B1EF9DF2DB4" id="OA1" width="100%" height="100%" codebase="<%=webapp %>/common/webword/officeviewer.cab#7,4,0,236">
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
