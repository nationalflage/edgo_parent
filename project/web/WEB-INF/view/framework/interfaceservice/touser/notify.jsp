<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="com.hyjx.framework.component.interfaceservice.datauserservice.*" %>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%
	List list=(ArrayList)request.getAttribute("list");
	
	String userid=(String)request.getAttribute("userid");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN">
<!-- <!DOCTYPE html> -->
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
</head>
<body>

	！！！！！！！！！！！！！！！！！！用户无效
    
    
	
</body>
</html>

<script type="text/javascript">
	
</script>
