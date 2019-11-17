<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>信息修改</title>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=path %>/message/doEdit.xhtml",
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
			<input type="hidden" value=<c:out value="${model.msgid }"/>  id="msgid" name="msgid">
	<table  class="table-list">
			<tr>
			<th>标题</th>
			<td>
				<input type="text" value=<c:out value="${model.title }"/> id="title" name="title" size="40" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
			<th>内容</th>
			<td>
				<input type="text" value=<c:out value="${model.content }"/> id="content" name="content" size="40" class="easyui-textbox" required="true" validType="length[0,300]"/>
			</td>
		</tr>
		<tr>
			<th>发送人</th>
			<td>
				<input type="text" value=<c:out value="${model.fromuser }"/> id="fromuser" name="fromuser" size="40" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
			<th>业务主键</th>
			<td>
				<input type="text" value=<c:out value="${model.bus_pkey }"/> id="bus_pkey" name="bus_pkey" size="40" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
		</tr>
		<tr>
			<th>发送时间</th>
			<td>
				<input type="text" value=<c:out value="${model.sendtime }"/> id="sendtime" name="sendtime" size="40" class="easyui-textbox" required="true" validType="length[0,7]"/>
			</td>
			<th>消息类型</th>
			<td>
				<input type="text" value=<c:out value="${model.type }"/> id="type" name="type" size="40" class="easyui-textbox" required="true" validType="length[0,22]"/>
			</td>
		</tr>
		<tr>
			<th>失效时间</th>
			<td>
				<input type="text" value=<c:out value="${model.invalidtime }"/> id="invalidtime" name="invalidtime" size="40" class="easyui-textbox" required="true" validType="length[0,7]"/>
			</td>
			<th>对应业务的URL</th>
			<td>
				<input type="text" value=<c:out value="${model.bus_url }"/> id="bus_url" name="bus_url" size="40" class="easyui-textbox" required="true" validType="length[0,100]"/>
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