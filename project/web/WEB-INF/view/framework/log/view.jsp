<%@page import="com.hyjx.framework.component.log.LogBusinessDataModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<th width="100" style="width:100px;">操作时间</th>
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
				${model.module_name }
			</td>
		</tr>
		<tr>
			<th>操作描述</th>
			<td colspan="3" style="min-width:600px;max-width: 600px;word-wrap: break-word;word-break:break-all;">
			${model.oper_desc }
				
			</td>
		</tr>
		<tr>
			<th>影响数据</th>
			<td colspan="3" style="max-width: 600px;margin-left: 20px;word-wrap: break-word;word-break:break-all;" >
				<c:forEach items="${logdata }" var="l" varStatus="s">
					${s.index +1}，${l.tablename }
					<br>
					原始数据：${l.origrec }
					<br>
					最新数据：${l.lastrec }
				</c:forEach>




			</td>
		</tr>
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