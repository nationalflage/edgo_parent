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
		   	url: "<%=basePath %>codetable/doAdd.xhtml",
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
		   },error:function(msg)
		   {
			   $.hyjx.alert("提示信息","代码值["+$("#code").val()+"]重复","error", function(){
				   $("#code").focus();
			   });
		   }
		}); 
	}
	</script>
</head>
<body>
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<table  class="table-query">
	<tbody>
			<tr>
			<th>名称</th>
			<td>
				<input type="text" value="<c:out value="${model.name }"/>" name="name" id="name" class="easyui-textbox" required="true" validType="length[0,20]"/>
			</td>
			<th>代码值</th>
			<td>
				<input type="text" value="<c:out value="${model.code }"/>" name="code" id="code" class="easyui-textbox" required="true"  data-options="required:true,validType:['alphanum','length[1,20]']"/>
			</td>
		</tr>
		<tr>
				<th>父代码</th>
			<td>
				<input type="text" value="<c:out value="${model.parentcode }"/>" name="parentcode" id="parentcode" class="easyui-textbox" validType="length[0,50]"/>
			</td>
			
			<th>代码表</th>
			<td>
				<input type="text" value="<c:out value="${codetable }"/>" name="codetable" id="codetable"  class="easyui-textbox" required="true" validType="length[0,50]" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>顺序号</th>
			<td>
				<input type="text" value="<c:out value="${model.orderid }"/>" name="orderid" id="orderid" class="easyui-textbox" required="true"  data-options="validType:['number','length[0,6]']"/>
			</td>
			<th>是否有效</th>
			<td>
			<input type="radio" id="r1" name="validflag" value="1" checked="checked">
			<label for="r1">是</label>
			<input type="radio" id="r2" name="validflag" value="0">	
			<label for="r2">否</label>
				
			</td>

		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4" >
					<div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="window.parent.closeWin('信息添加')">关 闭</button>
                    </div>	
			</td>
		</tr>
		</tfoot>
	</table>
</form>
</body>
</html>