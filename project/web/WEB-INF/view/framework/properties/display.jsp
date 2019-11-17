<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>配置信息</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	//修改全部配置信息
	function modifyAll() {
		openWinW("<%=path %>/properties/gotoEditAll.xhtml","修改","850px","600px",false,false);
	}
	//修改单个配置信息
	function modify(key) {
		openWinW("<%=path %>/properties/gotoEdit.xhtml?key="+key,"修改","610px","222px",false,false);
	}
	</script>
</head>

<body>
<div class="result-list">
<h1 class="public-title">参数配置</h1>
<table class="table-list">
<tbody>
	<c:forEach var="property" items="${properties}" >
	<tr>
		<th width="150px" align="right" style="text-align: left;padding-left: 20px;">${property.key }：</th>
		<td width="80%">${property.value }</td>
		<td width="50px" align="center">
			<img style="cursor: pointer;" title="修改" alt="修改" src="<%=basePath %>images/edit.png" onclick="modify('${property.key }');">
		</td>
		
		
	</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="3" align="center">
			<button class="btn btn-info" type="button" onclick="modifyAll()">批量修改</button>
		</td>
	</tr>
	</tfoot>
</table>
</div>
</body>
</html>