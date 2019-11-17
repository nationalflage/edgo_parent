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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>
<body>
	<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
	<table class="table-query">
						<tr>
				
				<th>服务名称</th>
				<td>
					<c:out value="${model.srvname }"/>
				</td>
				
				
				<th>服务类型</th>
				<td>
					<c:out value="${model.srvtype }"/>
				</td>
				
				</tr>
				<tr>
				
				<th>查询SQL</th>
				<td>
					<c:out value="${model.querysql }"/>
				</td>
				
				
				<th>简介</th>
				<td>
					<c:out value="${model.brief }"/>
				</td>
				
				</tr>
				<tr>
				
				<th>接口说明</th>
				<td>
					<c:out value="${model.interfacedesc }"/>
				</td>
				
		
		<tfoot>
           <tr height="100">
               <td colspan="4">
                   <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息详细')"/>
                   
               </td>
           </tr>
       </tfoot>
	</table>
	</form>
</body>
</html>