<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>图片上传</title>
</head>
<body>
	<!-- 图片上传组件 -->
	<div class="content">
		<h1 class="public-title"><b>图片上传</b></h1>
		<div class="hy-imgupload" vchr_domain="undefined" vchr_entityid="undefined">
			<%--<div class="upload-btn" id="upload">--%>
			<%--<input class="add-file" type="file" id="file1" name="file1" />--%>
			<%--</div>--%>
		</div>
	</div>
	<script src="<%=basePath %>js/ajaxfileupload.js" ></script>
</body>
</html>