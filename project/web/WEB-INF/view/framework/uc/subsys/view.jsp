<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <meta charset="UTF-8">
    <title>新增</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>

</head>
<body style="background-color: #fff">
<div class="content" style="margin: 0">
	<h1 class="public-title"><b>子系统详情</b></h1>
		<div class="detail-list" style="padding: 8px 15px;">
			<table class="detail-list1">
				<thead>
				<tr>
					<td width="50%"></td>
					<td width="50%"></td>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>系统编码：<strong><c:out value="${model.subsys_code}"/></strong></td>
					<td>系统名称：<strong><c:out value="${model.subsys_name}"/></strong></td>
				</tr>
				<tr>
					<td>系统地址：<strong><c:out value="${model.subsys_url}"/></strong></td>
					<td>系统描述：<strong><c:out value="${model.subsys_desc}"/></strong></td>
				</tr>
				<tr>
					<td>排序号：<strong><c:out value="${model.order_no}"/></strong></td>
					<td>是否有效：<strong><c:if test="${model.validity  eq 'Y'}">是</c:if><c:if test="${model.validity  eq 'N'}">否</c:if>	</strong></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button class="btn"  onclick="closewin();">关 闭</button></td>
				</tr>
				</tbody>

			</table>
		</div>
</div>
</body>
</html>
<script type="text/javascript">
	function closewin()
	{
		window.parent.closeWin('查看详细');
	}
	
	$(function(){
	var flag= "<%=(String)request.getAttribute("showFlag") %>";
	 if("0"==flag){
	 $(".btn").css("display","none");
	 }
	
	});
	
</script>