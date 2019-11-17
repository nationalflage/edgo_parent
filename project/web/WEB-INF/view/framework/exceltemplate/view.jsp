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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <title></title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    </head>
  <body>
			<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
			<input type="hidden" name="user_id" id="user_id" value="<c:out value="${userModel.user_id}"/>">
			<input type="hidden" name="depart_id" id="depart_id" value="<c:out value="${userModel.user_id}"/>">
			<table  class="table-query">
				<tr>
				<th width="15%">模块中文名</th><td width="30%">
				<c:out value="${et.module_ch_name }"/>
				<th width="15%">模块英文名</th><td><c:out value="${et.module_en_name }"/></td>
				</tr>
				<tr>
				<th width="15%">直接导入</th><td width="30%">
				<c:if test="${et.is_direct_import  eq 'Y'}">是</c:if>  
				 <c:if test="${et.is_direct_import  eq 'N'}">否</c:if> 
				<th width="15%">sql_id</th>
				<td  width="30%">
				<c:out value="${et.sql_id }"/>
				</td>
				</tr>
				<tr>
				<th width="15%">model类名</th><td  width="30%">
					<c:out value="${et.class_name }"/>
				</td>
				<th width="15%">表名</th><td  width="30%">
					<c:out value="${et.table_name }"/>
				</td>
				</tr>
			</table>
			
			<table id="tt" style="width:100%;"></table>
			<table  class="table-query">
			<tfoot>
				<tr>
				<td>
				<center>
                        <button class="btn"  onclick="closewin();">关 闭</button>
                 </center> 
				</td>
				</tr>
				</tfoot>
				</table>	

		</form>
			
			
</body>
</html>
<script type="text/javascript">
	function closewin()
	{
		window.parent.closeWin('查看详细');
	}
	
	
</script>