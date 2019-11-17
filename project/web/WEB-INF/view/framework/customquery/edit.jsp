<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>信息修改</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>customquery/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		   				parent.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	</script>
</head>
<body>
<form id="form1" class="gray-bg" method="post" action="" data-options="novalidate:true" >
			<input type="hidden" value=<c:out value="${model.query_id }"/>  id="query_id" name="query_id">
	<table  class="table-list">
			<tr>
			<th>查询抬头名称</th>
			<td>
				<input type="text" value=<c:out value="${model.query_name }"/> id="query_name" name="query_name" size="40" class="easyui-textbox" required="true" validType="length[0,30]"/>
			</td>
			<th>查询类型</th>
			<td>
				<input type="text" value=<c:out value="${model.query_type }"/> id="query_type" name="query_type" size="40" class="easyui-textbox" required="true" validType="length[0,8]"/>
			</td>
		</tr>
		<tr>
			<th>查询SQL</th>
			<td>
				<input type="text" value=<c:out value="${model.query_sql }"/> id="query_sql" name="query_sql" size="40" class="easyui-textbox" required="true" validType="length[0,4,000]"/>
			</td>
			<th>描述</th>
			<td>
				<input type="text" value=<c:out value="${model.query_desc }"/> id="query_desc" name="query_desc" size="40" class="easyui-textbox" validType="length[0,2,000]"/>
			</td>
		</tr>
		<tr>
			<th>查询配置详情</th>
			<td>
				<input type="text" value=<c:out value="${model.query_config }"/> id="query_config" name="query_config" size="40" class="easyui-textbox" required="true" validType="length[0,4,000]"/>
			</td>
			<th>创建日期</th>
			<td>
				<input type="text" value=<c:out value="${model.create_date }"/> id="create_date" name="create_date" size="40" class="easyui-textbox" required="true" validType="length[0,19]"/>
			</td>
		</tr>
		<tr>
			
					<th width="15%">是否有效</th><td width="30%">
					<input type="radio" name="validity" <c:if test="${model.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是
					<input type="radio" name="validity" <c:if test="${model.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否
				</td>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">下一步</button>
                        <button class="btn"  onclick="window.parent.closeWin('信息修改');">关 闭</button>
                    </div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>