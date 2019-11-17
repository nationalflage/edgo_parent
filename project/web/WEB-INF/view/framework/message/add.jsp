<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>

	<title>添加</title>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=path %>/message/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		   				parent.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息添加');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	</script>
</head>
<body>
<form id="form1" class="gray-bg"  method="post" action="" data-options="novalidate:true" >
	<table  class="table-list">
			<tr>
			<th>标题</th>
			<td>
				<input type="text" value=<c:out value="${model.title }"/> name="title" id="title" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
			<th>内容</th>
			<td>
				<input type="text" value=<c:out value="${model.content }"/> name="content" id="content" class="easyui-textbox" required="true" validType="length[0,300]"/>
			</td>
		</tr>
		<tr>
			<th>发送人</th>
			<td>
				<input type="text" value=<c:out value="${model.fromuser }"/> name="fromuser" id="fromuser" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
			<th>业务主键</th>
			<td>
				<input type="text" value=<c:out value="${model.bus_pkey }"/> name="bus_pkey" id="bus_pkey" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
		</tr>
		<tr>
			<th>发送时间</th>
			<td>
				<input type="text" value=<c:out value="${model.sendtime }"/> name="sendtime" id="sendtime" class="easyui-textbox" required="true" validType="length[0,7]"/>
			</td>
			<th>消息类型</th>
			<td>
				<input type="text" value=<c:out value="${model.type }"/> name="type" id="type" class="easyui-textbox" required="true" validType="length[0,22]"/>
			</td>
		</tr>
		<tr>
			<th>失效时间</th>
			<td>
				<input type="text" value=<c:out value="${model.invalidtime }"/> name="invalidtime" id="invalidtime" class="easyui-textbox" required="true" validType="length[0,7]"/>
			</td>
			<th>对应业务的URL</th>
			<td>
				<input type="text" value=<c:out value="${model.bus_url }"/> name="bus_url" id="bus_url" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
					<div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="closewin();">关 闭</button>
                    </div>	
			</td>
		</tr>
	</table>
</form>
</body>
</html>