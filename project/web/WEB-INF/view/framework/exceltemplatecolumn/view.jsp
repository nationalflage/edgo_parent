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
			
			<table  class="table-query">
				<tr>
				<th width="15%">中文列名</th><td width="30%">
				<c:out value="${etcModel.ch_column_name }"/>
				<th width="15%">英文列名</th><td><c:out value="${etcModel.en_column_name }"/></td>
				</tr>
				<tr>
				<th width="15%">模板</th><td width="30%">
				<div id="excel_template_id"></div>
						
				<th width="15%">字段顺序</th>
				<td  width="30%">
						<c:out value="${etcModel.excel_field_no }"/>
				</td>

				</tr>
				<tr>
				<th width="15%">最大长度</th><td  width="30%">
						<c:out value="${etcModel.max_length }"/>
				</td>
				<th width="15%">字段类型</th><td  width="30%">
					<%-- 	<c:out value="${etcModel.data_type }"/> --%>
						<c:if test="${etcModel.data_type=='String' }">
						字符串
						</c:if>
						<c:if test="${etcModel.data_type=='Date' }">
						日期
						</c:if>
						<c:if test="${etcModel.data_type=='Number' }">
						数字
						</c:if>
				</td>
				
				</tr>
				<tr>
				<th width="15%">日期格式</th><td  width="30%">
					<c:out value="${etcModel.date_formate }"/>
				</td>
				<th width="15%">主键</th><td  width="30%">
				
				<c:if test="${etcModel.is_primary_key  eq 'Y'}">是</c:if>
				<c:if test="${etcModel.is_primary_key  eq 'N'}">否</c:if>
				</td>
				
				</tr>
				<tr>
				<th width="15%">是否必填</th><td  width="30%">
				<c:if test="${etcModel.is_null  eq 'Y'}">是</c:if>
				<c:if test="${etcModel.is_null  eq 'N'}">否</c:if>
				</td>
				</tr>
				<input type="hidden" name="pub_excel_template_id" id ="pub_excel_template_id" value="<c:out value="${etcModel.pub_excel_template_id }"/>"/>
			</table>
			
			<table id="tt" style="width:100%;"></table>
			<table  class="table-query">
			<tfoot>
				<tr>
				<td>
				<center>
                <input type="button" class="btn"  onclick="closewin()" value="关闭">
                 </center> 
				</td>
				</tr>
				</tfoot>
				</table>	

		</form>
			
			
</body>
</html>
<script type="text/javascript">

     $(function(){
                    $.ajax({
    				   	url: "<%=basePath %>exceltemplatecolumn/getExcelTemplatesName.xhtml?pub_excel_template_id="+$("#pub_excel_template_id").val(),
    				   	success: function(msg){
    				   		$("#excel_template_id").html(msg);
    				   	}
    				}); 
     
     });

	function closewin()
	{
	 //   alert(123);
		window.parent.closeWin('查看详情');
		//alert(456);
	}
</script>