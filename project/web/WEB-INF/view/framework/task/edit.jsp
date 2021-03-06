<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>信息修改</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
        var ck=$("#startflowsysHidden").val();
        $("input[name='startflowsys'][value='"+ck+"']").attr("checked",true);

        ck=$("#issingletonHidden").val();
        $("input[name='issingleton'][value='"+ck+"']").attr("checked",true);

		$("#tasktype").combobox("setValue","<c:out value="${model.tasktype }"/>");
	})
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>task/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		   				//parent.rightFrame.$('#tt').datagrid("reload");
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
		   }
		}); 
	} 
	</script>
</head>
<body>
<body style="background-color: #fff">
<div class="content" style="margin: 0 0;">
<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
	<input type="hidden" value="<c:out value="${model.taskid }"/>"  id="taskid" name="taskid">
	<table  class="table-query">
		<tr>
			<th width="20%">任务名称</th>
			<td>
				<input type="text" value="<c:out value="${model.taskname }"/>" id="taskname" name="taskname" size="80" class="easyui-textbox" required="true" validType="length[0,255]"  style="width: 400px;"/>
			</td></tr>
		<tr>
			<th>任务类型</th>
			<td>
				<select name="tasktype" id="tasktype" class="easyui-combobox"  required="true" data-options="editable:false">
					<option value="1">SpringBean对象</option>
					<option value="2">Java类</option>
					<option value="3">sql语句</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>bean对象id、java类、sql语句</th>
			<td>
				<input type="text" value="<c:out value="${model.classname }"/>" id="classname" name="classname" size="80" class="easyui-textbox" required="true" validType="length[0,255]" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<th>方法名称</th>
			<td>
				<input type="text" value="<c:out value="${model.methodname }"/>" name="methodname" id="methodname" class="easyui-textbox" required="true" validType="length[0,50]" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<th>参数1</th>
			<td>
				<input type="text" value="<c:out value="${model.param1 }"/>" name="param1" id="param1" class="easyui-textbox" validType="length[0,50]" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<th>CRON表达式</th>
			<td>
				<input type="text" value="<c:out value="${model.cronexp }"/>" id="cronexp" name="cronexp" size="80" class="easyui-textbox" required="true" validType="length[0,255]" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<th>随系统启动</th>
			<td>
				<input type="hidden" value="<c:out value="${model.startflowsys }"/>"  id="startflowsysHidden">

				<label><input type="radio" name="startflowsys" value="1"/> 是</label>
				<label><input type="radio" name="startflowsys" value="0"/> 否</label>
			</td>
		</tr>
		<tr>
			<th>是否单例</th>
			<td>
				<input type="hidden" value="<c:out value="${model.issingleton }"/>"  id="issingletonHidden">
				<label><input type="radio" name="issingleton" value="1"/> 是</label>
				<label><input type="radio" name="issingleton" value="0"/> 否</label>
			</td>
		</tr>
		<tr>
			<th>单例启动IP</th>
			<td>
				<input type="text" value="<c:out value="${model.ipaddress }"/>" name="ipaddress" id="ipaddress" class="easyui-textbox" validType="length[0,40]" style="width: 400px;"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="window.parent.closeWin('信息修改');">关 闭</button>
                    </div>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>