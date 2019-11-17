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
			<th>子系统ID</th>
			<td>
				<c:out value="${model.subsys_id }"/>
			</td>
			<th>菜单所属组</th>
			<td>
				<c:out value="${model.menu_group }"/>
			</td>
		</tr>
		<tr>
			<th>菜单编码</th>
			<td>
				<c:out value="${model.menu_code }"/>
			</td>
			<th>菜单全编码</th>
			<td>
				<c:out value="${model.menu_code_full }"/>
			</td>
		</tr>
		<tr>
			<th>菜单名称</th>
			<td>
				<c:out value="${model.menu_name }"/>
			</td>
			<th>菜单描述</th>
			<td>
				<c:out value="${model.menu_desc }"/>
			</td>
		</tr>
		<tr>
			<th>功能入口</th>
			<td>
				<c:out value="${model.func_entra }"/>
			</td>
			<th>上级菜单编码</th>
			<td>
				<c:out value="${model.menu_parent_code }"/>
			</td>
		</tr>
		<tr>
			<th>菜单层次</th>
			<td>
				<c:out value="${model.menu_level }"/>
			</td>
			<th>顺序号</th>
			<td>
				<c:out value="${model.order_no }"/>
			</td>
		</tr>
		<tr>
			<th>管理员是否能操作[Y:是;N:否]</th>
			<td>
				<c:out value="${model.oper_admin }"/>
			</td>
			<th>是否专属管理员使用[Y:是;N:否]</th>
			<td>
				<c:out value="${model.belong_admin }"/>
			</td>
		</tr>
		<tr>
			<th>是否叶结点[Y:是;N:否]</th>
			<td>
				<c:out value="${model.is_leaf_node }"/>
			</td>
			<th>是否有效[Y:是;N:否]</th>
			<td>
				<c:out value="${model.validity }"/>
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