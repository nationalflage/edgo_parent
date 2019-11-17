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
			<th width="100">操作时间</th>
			<td>
				${model.oper_time }
			</td>
			<th width="100">操作人ID</th>
			<td>
				${model.oper_id }
			</td>
		</tr>
		<tr>
			<th>操作人名称</th>
			<td>
				${model.oper_name }
			</td>
				<th>IP地址</th>
			<td>
				${model.ip_address }
			</td>
		</tr>
		<tr>
			<th>执行时间</th>
			<td>
				${model.exec_time }
			</td>
				<th>模块名称</th>
			<td>
				${model.ip_address }
			</td>
		</tr>
		<tr>
			<th>操作描述</th>
			<td colspan="3" style="max-width: 400px;">
				${model.oper_desc }
			</td>
		</tr>
		<tr>
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