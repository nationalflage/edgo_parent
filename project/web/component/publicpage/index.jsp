<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body >
<a onclick="show()">show</a>
</body>
</html>
<script>
function show()
{
	var ret = window.showModalDialog("<%=basePath%>component/publicpage/queryuserdept.jsp?type=1","dialogHeight:300,dialogWidth:400");
}
</script>