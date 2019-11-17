<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title></title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function closeLayer(){
		var layerTitle='信息详细';
		window.parent.closeWin(layerTitle);
	}
	</script>
</head>
<body>
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >

	
	<table  class="table-query">
		<tr>
			<th width="10%">属性键</th>
			<td>
				${model.property_key}	
			</td>
			<th width="10%">属性值</th>
			<td>
				${model.property_value}	
			</td>
		</tr>
		<tr>
			<th>属性类型 </th>
			<td colspan="3">
			
				<c:if test="${model.property_type  eq '1'}">系统级别</c:if>
				<c:if test="${model.property_type  eq '2'}">项目级别</c:if>
			</td>
		</tr>
		<tr>
			<th width="10%">枚举值</th>
			<td colspan="3">
				${model.property_enum }
			</td>
		</tr>
		<tr>
			<th>备注</th>
			<td colspan="3">
				${model.note }
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
				<div class="buttons">
                       <button class="btn"  onclick="closeLayer();" type="button">关 闭</button>
                </div>	
			</td>
		</tr>
	</table>
</form>
</body>
</html>