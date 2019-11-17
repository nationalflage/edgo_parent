<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >    
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
						parent.rightFrame.location.href=parent.rightFrame.location.href;
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
	<table align="center" class="table-list">
		<c:forEach var="property" items="${properties}" >
		<tr>
			<th>${property.key }</th>
			<td colspan="4" >
			
				<textarea rows=<fmt:formatNumber type="number" value="${fn:length(property.value)/100}" maxFractionDigits="0"/> cols="80" name="${property.key }">${property.value }</textarea>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align:center;">
				<button class="btn" type="button" onclick="save()">保存</button>
				<button class="btn btn-info" type="button" onclick="window.parent.closeWin('修改');">关闭</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>