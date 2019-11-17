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
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=path %>/upload/doEdit.xhtml",
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
			<input type="hidden" value="${model.vchr_id }"  id="vchr_id" name="vchr_id">
	<table  class="table-list">
			<tr>
			<th>域名称</th>
			<td>
				<input type="text" value="${model.vchr_domain }" id="vchr_domain" name="vchr_domain" size="40" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
			<th>排序</th>
			<td>
				<input type="text" value="${model.vchr_sort }" id="vchr_sort" name="vchr_sort" size="40" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
		</tr>
		<tr>
			<th>使用关联id</th>
			<td>
				<input type="text" value="${model.vchr_entityid }" id="vchr_entityid" name="vchr_entityid" size="40" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
			<th>原文件名称</th>
			<td>
				<input type="text" value="${model.vchr_originname }" id="vchr_originname" name="vchr_originname" size="40" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
			<th>文件存储名称</th>
			<td>
				<input type="text" value="${model.vchr_storagename }" id="vchr_storagename" name="vchr_storagename" size="40" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
			<th>描述</th>
			<td>
				<input type="text" value="${model.vchr_description }" id="vchr_description" name="vchr_description" size="40" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
			<th>文件类型</th>
			<td>
				<input type="text" value="${model.vchr_filetype }" id="vchr_filetype" name="vchr_filetype" size="40" class="easyui-textbox" required="true" validType="length[0,10]"/>
			</td>
			<th>文件长度</th>
			<td>
				<input type="text" value="${model.num_filesize }" id="num_filesize" name="num_filesize" size="40" class="easyui-textbox" required="true" validType="length[0,10]"/>
			</td>
		</tr>
		<tr>
			<th>上传人名称</th>
			<td>
				<input type="text" value="${model.vchr_uploaduser }" id="vchr_uploaduser" name="vchr_uploaduser" size="40" class="easyui-textbox" required="true" validType="length[0,40]"/>
			</td>
			<th>上传人id</th>
			<td>
				<input type="text" value="${model.vchr_uploaduserid }" id="vchr_uploaduserid" name="vchr_uploaduserid" size="40" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
		</tr>
		<tr>
			<th>上传时间</th>
			<td>
				<input type="text" value="${model.date_uploaddate }" id="date_uploaddate" name="date_uploaddate" size="40" class="easyui-textbox" required="true" validType="length[0,19]"/>
			</td>
			<th>null</th>
			<td>
				<input type="text" value="${model.num_state }" id="num_state" name="num_state" size="40" class="easyui-textbox" required="true" validType="length[0,1]"/>
			</td>
		</tr>
		<tr>
			<th>null</th>
			<td>
				<input type="text" value="${model.num_seqid }" id="num_seqid" name="num_seqid" size="40" class="easyui-textbox" required="true" validType="length[0,6]"/>
			</td>
			<th>时间戳</th>
			<td>
				<input type="text" value="${model.lastdate }" id="lastdate" name="lastdate" size="40" class="easyui-textbox" required="true" validType="length[0,19]"/>
			</td>
		</tr>
		<tr>
			<th>数据交换位</th>
			<td>
				<input type="text" value="${model.datexc }" id="datexc" name="datexc" size="40" class="easyui-textbox" required="true" validType="length[0,2]"/>
			</td>
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