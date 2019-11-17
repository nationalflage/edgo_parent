<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
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
		   	url: "<%=basePath %>codetable/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		   				parent.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
				}else{
					$.hyjx.alert("提示信息","代码值重复！","error", function(){});
				}
		   }
		}); 
	} 
	</script>
</head>
<body>
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<table  class="table-query">
			<tr>
			<th>名称</th>
			<td>
				<input type="text" value="<c:out value="${model.name }"/>" id="name" name="name" size="40" class="easyui-textbox" required="true" validType="length[0,20]"/>
			</td>
			<th>代码值</th>
			<td>
				<input type="text" value="<c:out value="${model.code }"/>" id="code" name="code" size="40" class="easyui-textbox"  validType="length[0,20]"/>
			</td>

		</tr>
		<tr>
			<th>父代码</th>
			<td>
				<input type="text" value="<c:out value="${model.parentcode }"/>" id="parentcode" name="parentcode" size="40" class="easyui-textbox"  validType="length[0,50]"/>
			</td>
				<th>代码表</th>
			<td>
			<c:out value="${model.codetable }"/>
			 <input type="hidden" name="codetable" id="codetable" value='<c:out value="${model.codetable }"/>'/>
<%-- 				<input type="text" value="<c:out value="${model.codetable }"/>" id="codetable" name="codetable" size="40" class="easyui-textbox" required="true" validType="length[0,50]"/> --%>
			</td>
			
		</tr>
		<tr><th>顺序号</th>
			<td>
				<input type="text" value="<c:out value="${model.orderid }"/>" id="orderid" name="orderid" size="40" class="easyui-textbox" required="true"   data-options="validType:['number','length[0,6]']"/>
			</td>
		
			<th >是否有效</th>
			<td >
				<input type="radio" name="validflag" <c:if test="${model.validflag  eq '1'}">checked="checked"</c:if> value='1'/> 是
				<input type="radio" name="validflag" <c:if test="${model.validflag  eq '0'}">checked="checked"</c:if> value='0'/> 否
			</td>
			<th></th>
			<td>
			
			</td>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="window.parent.closeWin('信息修改');">关 闭</button>
                    </div>
			</td>
		</tr>
	</table>
	<input type="hidden" name="old_code" value='<c:out value="${model.code }"/>'>
</form>
</body>
</html>