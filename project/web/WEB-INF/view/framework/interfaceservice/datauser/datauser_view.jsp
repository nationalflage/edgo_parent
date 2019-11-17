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

				<th width="15%">用户登录名:</th>
				<td width="30%"> 
					<c:out value="${model.userlogname }"/>
				</td>


				<th width="15%">用户名:</th>
				<td width="30%">
					<c:out value="${model.username }"/>
					
				</td>

			</tr>
			<tr>

				<th>用户类型:</th>
				<td>
					<c:out value="${model.usertype }"/>
				</td>


				<th>私钥:</th>
				<td>
					<c:out value="${model.privatekey }"/>
				</td>

			</tr>
			<tr>

				<th>是否有效:</th>
				<td>
					<c:out value="${model.validity }"/>
				</td>

			</tr>

			<tr >
				<th>限定IP范围:</th>
				<td colspan="3">
					<c:out value="${model.restrictedips }"/>
				</td>
			</tr>

			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn" value="关　闭"
						onclick="window.parent.closeWin('信息详细')" /></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>