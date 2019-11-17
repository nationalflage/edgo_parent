<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>查看附件信息</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body>
	<form id="form1" class="query-list" method="post" action=""
		data-options="novalidate:true">
		<table class="table-query">
			<tr>
				<th>文件名</th>
				<td ><a
					href="<%=basePath %>upload/download.xhtml?id=${model.vchr_id }&vchr_domain=${model.vchr_domain}&vchr_entityid=${model.vchr_entityid}"
					title="点击下载" class="color1" target="_blank"
					onclick="javascript:void(0);"> ${model.vchr_originname } </a></td>
				<th>上传人</th>
				<td>${model.vchr_uploaduser }</td>
			</tr>
			<tr>
				<th>文件大小</th>
				<td>${model.num_filesize/1000 } KB</td>
				<th>上传时间</th>
				<td>${model.date_uploaddate }</td>
			</tr>
			<tr>
				
				<th>模块名称</th>
				<td>${model.vchr_domain}</td>
				<th>关联记录编号</th>
				<td>${model.vchr_entityid }</td>
				
			</tr>
			<tr>
				<th>文件描述</th>
				<td>${model.vchr_description }</td>
			</tr>
			<tr>
			<td colspan="4" align="center" style="text-align: center;">
			<c:if test="${type==2}">
			<img style="width: 400px;" src="<%=basePath %>upload/getPreview.xhtml?vchr_entityid=${model.vchr_entityid}&vchr_domain=${model.vchr_domain}&fileName=${model.vchr_storagename}">
			</c:if>
			</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center" valign="bottom">
					<div class="buttons">
						<button class="btn"
							onclick="window.parent.closeWin('查看附件信息');">关 闭</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>