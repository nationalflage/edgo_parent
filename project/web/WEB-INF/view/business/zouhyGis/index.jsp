<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
第一题：<a href="<%=basePath%>zouhy_gis/index1.xhtml">洒点</a><br>
第二题：<a href="<%=basePath%>zouhy_gis/index2.xhtml">边界</a><br>
第三题：<a href="<%=basePath%>zouhy_gis/index3.xhtml">热力图</a><br>
</body>
</html>

