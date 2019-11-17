<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>添加</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=path %>/upload/doAdd.xhtml",
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
			<th>域名称</th>
			<td>
				<input type="text" value="${model.vchr_domain }" name="vchr_domain" id="vchr_domain" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
			<th>排序</th>
			<td>
				<input type="text" value="${model.vchr_sort }" name="vchr_sort" id="vchr_sort" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
		</tr>
		<tr>
			<th>使用关联id</th>
			<td>
				<input type="text" value="${model.vchr_entityid }" name="vchr_entityid" id="vchr_entityid" class="easyui-textbox" required="true" validType="length[0,50]"/>
			</td>
			<th>原文件名称</th>
			<td>
				<input type="text" value="${model.vchr_originname }" name="vchr_originname" id="vchr_originname" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
			<th>文件存储名称</th>
			<td>
				<input type="text" value="${model.vchr_storagename }" name="vchr_storagename" id="vchr_storagename" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
			<th>描述</th>
			<td>
				<input type="text" value="${model.vchr_description }" name="vchr_description" id="vchr_description" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
			<th>文件类型</th>
			<td>
				<input type="text" value="${model.vchr_filetype }" name="vchr_filetype" id="vchr_filetype" class="easyui-textbox" required="true" validType="length[0,10]"/>
			</td>
			<th>文件长度</th>
			<td>
				<input type="text" value="${model.num_filesize }" name="num_filesize" id="num_filesize" class="easyui-textbox" required="true" validType="length[0,10]"/>
			</td>
		</tr>
		<tr>
			<th>上传人名称</th>
			<td>
				<input type="text" value="${model.vchr_uploaduser }" name="vchr_uploaduser" id="vchr_uploaduser" class="easyui-textbox" required="true" validType="length[0,40]"/>
			</td>
			<th>上传人id</th>
			<td>
				<input type="text" value="${model.vchr_uploaduserid }" name="vchr_uploaduserid" id="vchr_uploaduserid" class="easyui-textbox" required="true" validType="length[0,32]"/>
			</td>
		</tr>
		<tr>
			<th>上传时间</th>
			<td>
				<input type="text" value="${model.date_uploaddate }" name="date_uploaddate" id="date_uploaddate" class="easyui-textbox" required="true" validType="length[0,19]"/>
			</td>
			<th>null</th>
			<td>
				<input type="text" value="${model.num_state }" name="num_state" id="num_state" class="easyui-textbox" required="true" validType="length[0,1]"/>
			</td>
		</tr>
		<tr>
			<th>null</th>
			<td>
				<input type="text" value="${model.num_seqid }" name="num_seqid" id="num_seqid" class="easyui-textbox" required="true" validType="length[0,6]"/>
			</td>
			<th>时间戳</th>
			<td>
				<input type="text" value="${model.lastdate }" name="lastdate" id="lastdate" class="easyui-textbox" required="true" validType="length[0,19]"/>
			</td>
		</tr>
		<tr>
			<th>数据交换位</th>
			<td>
				<input type="text" value="${model.datexc }" name="datexc" id="datexc" class="easyui-textbox" required="true" validType="length[0,2]"/>
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