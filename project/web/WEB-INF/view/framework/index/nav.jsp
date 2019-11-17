<%@ page language="java" import="com.hyjx.framework.service.SessionManager" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String activemenuid= SessionManager.getString("activeMenuId");
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
</head>
<body>
	<!-- 一级导航 -->
	<ul id="menunav1" class="navigation" ></ul>
</body>
<script >
$(function(){
	$("#menunav1").menunav({
		homeurl:"<%=basePath %>index/home.xhtml",
		menuurl:"<%=basePath %>index.xhtml",
		activemenuid:"<%= activemenuid%>"
	});
});
</script>