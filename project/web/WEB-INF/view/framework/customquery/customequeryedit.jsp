<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>信息详细</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body>
	<table  class="table-list">
					<tr>
			<th>查询抬头名称</th>
			<td>
				<c:out value="${model.query_name }"/>
			</td>
			<th>查询类型</th>
			<td>
				<c:out value="${model.query_type }"/>
			</td>
		</tr>
		<tr>
			<th>查询SQL</th>
			<td>
				<c:out value="${model.query_sql }"/>
			</td>
			<th>描述</th>
			<td>
				<c:out value="${model.query_desc }"/>
			</td>
		</tr>
		<tr>
			<th>查询配置详情</th>
			<td>
				<c:out value="${model.query_config }"/>
			</td>
			<th>创建日期</th>
			<td>
				<c:out value="${model.create_date }"/>
			</td>
		</tr>
		<tr>
			<th>是否有效</th>
			<td>
				<c:out value="${model.validity }"/>
			</td>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                      <button class="btn"  onclick="window.parent.closeWin('信息详细');">关 闭</button>
                    </div>
			</td>
		</tr>
	</table>
</body>
</html>