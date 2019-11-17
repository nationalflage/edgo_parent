<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>信息详细</title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body>
	<table  class="table-list">
					<tr>
			<th>名称</th>
			<td>
				<c:out value="${model.name }"/>
			</td>
			<th>父代码标识</th>
			<td>
				<c:out value="${model.parentcode }"/>
			</td>
		</tr>
		<tr>
			<th>顺序号</th>
			<td>
				<c:out value="${model.orderid }"/>
			</td>
			<th>代码表标识</th>
			<td>
				<c:out value="<c:out value="${model.codetable }"/>"/>
			</td>
		</tr>
		<tr>
			<th>是否有效</th>
			<td>
				<c:out value="${model.validflag }"/>
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