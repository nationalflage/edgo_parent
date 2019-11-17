<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>对话框</title>
</head>
<body>
	<div style="margin:20px 0;">
		<a class="btn btn-info" href="javascript:void(0)" onclick="$('#dlg').dialog('open')">打开</a>
		<a class="btn btn-info" href="javascript:void(0)" onclick="$('#dlg').dialog('close')">关闭</a>
		<div class="easyui-dialog" id="dlg" title="基础对话框" style="width:400px;height:200px;padding:10px">
			对话框内容
		</div>
	</div>
</body>
</html>