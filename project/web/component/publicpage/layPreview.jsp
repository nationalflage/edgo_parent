<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'layPreview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script src="<%=basePath %>js/layer-v2.4/layer/layer.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/ajaxfileupload.js" ></script>
    <script type="text/javascript" src="<%=basePath %>js/preview.js" ></script>
    <link href="<%=basePath %>css/preview.css" rel="stylesheet">
  </head>
  
  <body>
    
  </body>
</html>
