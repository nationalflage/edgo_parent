<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	session.setAttribute("token", "1");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>新增</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body style="background-color: #fff">
	<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
		 <input type="hidden" name="token" value="${token}"/> 
		<input type="hidden" name="subsys_id" id="sussys_id" value="<c:out value="${model.subsys_id}"/>">
			<table  class="table-query">
				<tr>
				<th width="15%">系统编码</th><td width="30%"><input class="easyui-textbox" type="text"  data-options="required:true,validType:['length[1,20]']" name="subsys_code"/> </td>
				<th width="15%">系统名称</th><td width="30%"><input class="easyui-textbox" type="text" data-options="required:true,validType:['length[1,20]']"  name="subsys_name"/></td>
				</tr>
				
				<tr>
				<th width="15%">系统地址</th><td width="70%" colspan="3">
					<input style="width:473px;" class="easyui-textbox" type="text" name="subsys_url" style="width:95%"  data-options="required:true,validType:['length[1,80]']"/> </td>
				</tr>
				<tr>
				<th width="15%">系统描述</th><td width="70%" colspan="3">
					<input style="width:473px;height:100px" data-options="multiline:true,validType:['length[0,200]']" style="width:95%;height:100px" class="easyui-textbox" type="text" name="subsys_desc"/></td>
				</tr>
				<tr>
				<th width="15%">排序号</th>
				<td width="30%"><input class="easyui-numberbox" type="text" required="true" name="order_no" id="order_no" value="<c:out value="${model.order_no}"/>" data-options="validType:['length[1,5]']"/></td>
				<th width="15%">是否有效</th>
				<td  width="30%">
					<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是</label>
					<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否</label>
				</td>
				</tr>
			</table>
			<table  class="table-list"  style="width: 100%">
				<tr>
					<td colspan="4" align="center" >
						<center>
							<input type="button" class="btn btn-info" onclick="save();" value="保 存" />
							<input type="button" class="btn"  onclick="closewin();" value="关 闭" />
						</center>
					</td>
				</tr>
			</table>
	</form>
			
			
</body>
</html>
<script type="text/javascript">
	function closewin()
	{
		window.parent.closeWin('新增子系统');
	}
	
	function save()
	{
		if(!$("#form1").form('validate')){  
			return;
		}
		$.ajax({
			url:"<%=basePath%>subsys/doAdd.xhtml",
			data:$("#form1").serialize(),
			type:"post",
			async:false,
			success:function(msg)
			{
				
				if(msg=="success"){
					$.hyjx.alert("提示信息","操作成功，请继续操作！","info", function(){
						parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('新增子系统');
		   			});	
				}
				if(msg=="failure"){
					$.hyjx.alert("提示信息","操作失败，请重新操作！","info", function(){
		   			});	
				}
				if(msg=="repeat"){
					$.hyjx.alert("提示信息","系统编码或系统名称重复！","info", function(){
		   			});	
				}
				if(msg=="notoken")
				{
					$.hyjx.alert("提示信息","请不要重复提交！","info", function(){
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