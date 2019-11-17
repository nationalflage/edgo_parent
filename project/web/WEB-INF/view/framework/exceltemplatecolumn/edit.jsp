<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <title>新增</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
</head>
<body>
	<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<input type="hidden" name="pub_excel_template_id" value="<%=request.getParameter("pub_excel_template_id")==null?"":request.getParameter("pub_excel_template_id")%>" >
		<input type="hidden" name="pub_excel_template_column_id" id="excel_template_column_id" value="<c:out value="${etcModel.pub_excel_template_column_id}"/>">
			<table  class="table-list" style="margin: 0 auto;">
				<tr>
				<th width="15%">中文字段名字</th><td width="30%"><input class="easyui-textbox" type="text" validType="length[0,50]" required="true" name="ch_column_name" value="<c:out value="${etcModel.ch_column_name}"/>"/> </td>
				<th width="15%">英文字段名字</th><td><input class="easyui-textbox" type="text" required="true" validType="length[0,50]" name="en_column_name" value="<c:out value="${etcModel.en_column_name}"/>"/></td>
				</tr>
				<tr>
				<th width="15%">是否必填</th><td >
				<input type="radio" name="is_null" <c:if test="${etcModel.is_null  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是
					<input type="radio" name="is_null" <c:if test="${etcModel.is_null  eq 'N'}">checked="checked"</c:if> value="N"/> 否
				</td>				</td>
				<th width="15%">字段顺序</th>
				<td>
					<input class="easyui-textbox" type="text"  data-options="validType:['number','length[1,3]']" required="true" name="excel_field_no" value="<c:out value="${etcModel.excel_field_no}"/>" />
				</td>
				
				
				</tr>
				<tr>
				<th width="15%">最大长度</th><td><input  name="max_length" class="easyui-textbox" type="text" data-options="validType:['number','length[1,100]']" value="<c:out value="${etcModel.max_length}"/>" required="true"/></td>
				<th width="15%">数据类型</th>
				<td>
				<select class="easyui-combobox" name="data_type" id="data_type">
				<option value="String">字符串</option>
				<option value="Date">日期</option>
				<option value="Number">数字</option>
				</select>
				 </td>
				</tr>
				<tr>
				<th width="15%">日期格式</th><td >
					<input type="text" validType="length[0,20]" name="date_formate"  class="easyui-textbox" value="<c:out value="${etcModel.date_formate}"/>"   /><br/>如:YYYY-MM-DD
				</td>
				<th>是否主键</th>
				<td>
				<input type="radio" name="is_primary_key" <c:if test="${etcModel.is_primary_key  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是
				<input type="radio" name="is_primary_key" <c:if test="${etcModel.is_primary_key  eq 'N'}">checked="checked"</c:if> value="N"/> 否
				<input type="hidden" name="data_type1" id="data_type1"   value="<c:out value="${etcModel.data_type}"/>"   />
				
				</td>
				</tr>
			</table>

			<center>
                        <input type="button" class="btn btn-info" onclick="save();" value="保 存"/>
                        <input type="button" class="btn"  onclick="window.parent.closeWin('修改模板列');" value="关闭">
				</center>
			</form>
			
			
</body>
</html>
<script type="text/javascript">

     $(function(){
    
    	 $('#data_type').combobox('select', $("#data_type1").val());
         
     });

	function closewin()
	{
		window.parent.closeWin('修改模板列');
	}
	
	function save()
	{
	
	

	    
		if(!$("#form1").form('validate')){  
			return;
		}
		
		$.ajax({
			url:"<%=basePath%>exceltemplatecolumn/doEdit.xhtml?",
			data:$("#form1").serialize(),
			type:"post",
			async:false,
			success:function(msg)
			{
				if(msg=="success"){
				   
					$.hyjx.alert('信息','保存成功','info',function(){
					    parent.rightFrame.$('#tt').datagrid("reload");
						window.parent.closeWin('修改模板列');
					});
				}else
				{
					$.hyjx.alert('错误',msg);
				}
			},
			error:function(msg)
			{
				$.hyjx.alert('错误','出错啦');
			}
			
		});
	}
</script>