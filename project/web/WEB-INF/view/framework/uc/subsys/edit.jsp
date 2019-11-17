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
    <title>新增</title>
  <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body style="background-color: #fff">
	<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
		<input type="hidden" name="subsys_id" id="sussys_id" value="<c:out value="${model.subsys_id}"/>">
			<table  class="table-query" >
				<tr>
					<th width="15%">系统编码</th>
					<td width="35%">
					<input class="easyui-textbox" type="text" required="true" name="subsys_code" value="<c:out value="${model.subsys_code}"/>" data-options="required:true,validType:['length[1,20]']"/>
					</td>
					<th width="15%">系统名称</th>
					<td width="35%">
					<input class="easyui-textbox" type="text" required="true" name="subsys_name" value="<c:out value="${model.subsys_name}"/>" data-options="required:true,validType:['length[1,20]']"/>
					</td>
				</tr>

				<tr>
					<th>系统地址</th>
					<td colspan="3">
						<input style="width:473px;"  class="easyui-textbox" value="<c:out value="${model.subsys_url}"/>" type="text" name="subsys_url" data-options="required:true,validType:['length[1,80]']"/>
					</td>
				</tr>
				<tr>
					<th>系统描述</th><td colspan="3">
					<input style="width:473px;height:100px"   value="<c:out value="${model.subsys_desc}"/>" class="easyui-textbox" type="text" name="subsys_desc"
						   data-options="multiline:true,validType:['length[0,200]']" /></td>
				</tr>

				<tr>
					<th >排序号</th>
					<td >
						<input class="easyui-numberbox" type="text" required="true" name="order_no" id="order_no" value="<c:out value="${model.order_no}"/>"  data-options="validType:['length[1,5]']"/></td>
					<th >是否有效</th>
					<td >
						<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是</label>
						<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否</label>
					</td>
				</tr>
				<tfoot>
				<tr>
					<td colspan="4">
						<input type="button" class="btn btn-info" onclick="save();" value="保 存" />
						<input type="button" class="btn"  onclick="closewin();" value="关 闭" />
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
		window.parent.closeWin('修改子系统');
	}
	
	function save()
	{
		if(!$("#form1").form('validate')){  
			return;
		}
		$.ajax({
			url:"<%=basePath%>subsys/doUpdate.xhtml",
			data:$("#form1").serialize(),
			type:"post",
			async:false,
			success:function(msg)
			{
				if(msg=="success"){
					$.hyjx.alert("提示信息","操作成功，请继续操作！","info", function(){
						parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('修改子系统');
		   			});	
				}
				if(msg=="failure"){
					$.hyjx.alert("提示信息","操作失败，请重新操作！","info", function(){
		   			});	
				}
				if(msg=="repeat"){
					$.hyjx.alert("提示信息","系统编码或名称已经存在！","info", function(){
		   			});	
				}
				
			},
			error:function(msg)
			{
				alert('请求失败');
			}
			
		});
	}
</script>