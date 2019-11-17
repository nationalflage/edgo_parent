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
	<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
	<link href="<%=basePath %>css/uploadfile.css" rel="stylesheet">
	<title>测试页面</title>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>本页面为开发人员测试页面</b></h1>
		<div class="detail-list" style="padding: 8px 15px;">
			
		</div>
	</div>
	<script src="<%=basePath %>js/component/jquery.md5.js"></script>
	<script src="<%=basePath %>js/component/niuniu/niuniucapture.js"></script>
	<script src="<%=basePath %>js/component/niuniu/capturewrapper.js"></script>
	<script src="<%=basePath %>js/jquery-upload-file/jquery.uploadfile.js"></script>
</body>
</html>