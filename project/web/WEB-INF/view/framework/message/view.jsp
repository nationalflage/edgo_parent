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
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>信息详细</title>
</head>
<body>
	<table  class="table-query">
	<tr>
			<th style="width: 100px;">标题</th>
			<td>
				<c:out value="${model.title }"/>
			</td>
			</tr>
			<tr>
			<th>内容</th>
			<td>
				<c:out value="${model.content }"/>
			</td>
		</tr>
		<tr>
			<th>发送人</th>
			<td>
				<c:out value="${model.fromuser }"/>
			</td>
<!-- 			<th>业务主键</th> -->
<!-- 			<td> -->
<%-- 				${model.bus_pkey } --%>
<!-- 			</td> -->
		</tr>
		<tr>
			<th>发送时间</th>
			<td>
				<c:out value="${model.sendtime }"/>
			</td>
<!-- 			<th>消息类型</th> -->
<!-- 			<td> -->
<%-- 				${model.type } --%>
<!-- 			</td> -->
		</tr>
<!-- 		<tr> -->
<!-- 			<th>失效时间</th> -->
<!-- 			<td> -->
<%-- 				${model.invalidtime } --%>
<!-- 			</td> -->
<!-- 			<th>对应业务的URL</th> -->
<!-- 			<td> -->
<%-- 				${model.bus_url } --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                      <button class="btn"  onclick="closewin();">返回</button>
                    </div>
			</td>
		</tr>
	</table>
</body>
</html>
<script>
function closewin()
{
	//window.parent.closeWin('信息详细');window.parent.$('#tt').datagrid('reload')
	location.href = "<%=basePath%>message/gotoList.xhtml";
}
</script>