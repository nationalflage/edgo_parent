<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
</head>
<body>
	<form id="form1"  method="post" action=""
		data-options="novalidate:true">
		<table class="table-query">
			<tr>

				<th width="20%">数据源名称:</th>
				<td width="34%"> 
					<c:out value="${model.datasourcename}"/>
				</td>


				<th width="15%">数据源驱动:</th>
				<td width="30%">
					<c:out value="${model.driverclassname }"/>
					
				</td>

			</tr>
			<tr>

				<th>数据库用户名:</th>
				<td>
					<c:out value="${model.username }"/>
				</td>


				<th>数据库密码:</th>
				<td>
					<c:out value="${model.password }"/>
				</td>

			</tr>
			<tr >
				<th>连接数据库的url:</th>
				<td colspan="3">
					<c:out value="${model.url }"/>
				</td>
			</tr>

			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn" value="关　闭"
						onclick="window.parent.closeWin('数据源信息详细')" /></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>