<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>信息详细</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body>
<form id="form1" class="query-list"  method="post" action="<%=basePath %>customquery/addTpl.xhtml" data-options="novalidate:true" >
	<table  class="query-list">
					<tr>
			<th>请输入模板名称</th>
			<td>
				<input type="hidden" name="id" value="${id }">
				<input type="text" value="" name="tpl_name" id="tpl_name" class="easyui-textbox" required="true" validType="length[0,30]"/>
			</td>
		</tr>
		<tr>
			<td style="text-align:center" valign="bottom" colspan="2">
			 <div class="buttons">
                      <button class="btn"  onclick="save();">确定</button>
                    </div>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<script>
function save()
{
	$.ajax({
		type: "POST",
	   	url: "<%=basePath %>customquery/addTpl.xhtml",
	   	data: "id=${model.query_id}&tpl_name="+$("#tpl_name").val(),
	   	success: function(msg){
	   		window.parent.closeWin('输入模板名称','');
				//$.hyjx.alert("提示信息","保存成功！","info", function(){
					//window.parent.closeWin('输入模板名称','');
				//});
	   				
			}
	});
}
</script>