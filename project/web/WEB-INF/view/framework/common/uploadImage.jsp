<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>

<title></title>
</head>
<body>
<div class="content">

<div class="hy-imageupload"  id="pic1"  imgid="aaa"  edit="1"    filename="e8de7685-3455-436c-ac1c-f58e4fb94b63.jpg"  picture_name="picture_name"></div>
<input type="hidden" id="picture_name">
</div>
</body>
</html>