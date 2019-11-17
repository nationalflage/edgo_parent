<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改配置信息</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">  
	function save(){
		if(!$("#myform").form('validate')){  //验证表单
			return;
		}
		var data = $("#myform").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=path %>/properties/doEditAll.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","操作成功，请继续操作！","info", function(){
		   				parent.location.href=parent.location.href;
		   				window.parent.closeWin('修改');
		   			});
				}else{
					$.hyjx.alert("提示信息","维护信息错误，请稍候重试！","error", function(){});
				}
		   }
		}); 
	} 
	</script>
</head>

<body>
<form id="myform" class="query-list" >
	<table  align="center" class="table-query">
		<tr>
			<th >${propertiesModel.key }</th>
			<td colspan="4"  >
				<input type="text" value="${propertiesModel.value }" name="${propertiesModel.key }" style="width:100%" class="easyui-textbox" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				<button class="btn" type="button" onclick="save()">保存</button>
				<button class="btn btn-info" type="button" onclick="window.parent.closeWin('修改');">关闭</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>