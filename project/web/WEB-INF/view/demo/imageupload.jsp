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
	<title>头像上传</title>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>头像上传</b></h1>
		<%--<div class="image-container">--%>
			<%--<img class="image" src="<%=basePath %>images/component/image-default.jpg" />--%>
			<%--<p class="image-edit" onclick="add()">编辑头像</p>--%>
		<%--</div>--%>
		<div style="padding: 10px">
			<div class="hy-imageupload" edit="1" vchr_domain="userPhoto" vchr_entityid="admin"></div>
		</div>
	</div>
</body>
</html>