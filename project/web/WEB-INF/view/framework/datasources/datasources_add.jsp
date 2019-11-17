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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
<form id="form1"  method="post" action="">
				<%-- <input type="hidden" value="<c:out value="${model.userid }"/>"  id="userid" name="userid"> --%>
	<table  class="table-query">
			<tr>
			<th>数据源名称</th>
			<td>
				<input data-options="required:true" type="text"  id="datasourcename" name="datasourcename" size="40" class="easyui-textbox" validType="length[0,16]"/>
			</td>
			<th>数据源驱动</th>
			<td>
				<input data-options="required:true" type="text"  id="driverclassname" name="driverclassname" size="40" class="easyui-textbox" validType="length[0,60]"/>
			</td>
		</tr>
		<tr>
			<th>数据库用户名</th>
			<td>
				<input type="text" data-options="required:true" id="username" name="username" size="40" class="easyui-textbox" validType="length[0,16]"/>
			</td>
			<th>数据库密码</th>
			<td>
				<input type="text"  id="password" name="password" size="40" class="easyui-textbox" validType="length[0,16]"/>
			</td>
		</tr>
		<tr>
		<th>连接数据库的url</th>
			<td colspan="3">
				<input  class="easyui-textbox" id="url" name="url" data-options="required:true" validType="length[0,200]" style="width:460px;;height:50px;"/>
			</td>
		</tr>
		<tfoot>
            <tr height="100">
                <td colspan="4">
                    <input type="button" class="btn btn-info" value="保　存" onclick="save1();"/>
                    <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('多数据源添加添加')"/>
                    
                </td>
            </tr>
        </tfoot>
        
	</table>
</form>
</body>
</html>

<script type="text/javascript">

<%-- $(document).ready(function(){
	$.ajax({
		url:'<%=basePath%>selectServlet?codetable=interface_user_type',
		datatype:"json",
		success:function(res)
		{
			$("#usertype").combobox({
				editable:false,
				valueField:'code',
			    textField:'name' ,
			    panelHeight:'auto',
			    data:JSON.parse(res).result
			});
		},
		error:function(res)
		{
			//$.hyjx.alert("提示信息",res.responseText,"info", function(){});
		}
	});
}); --%>



	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>datauser/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息添加');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	
	
	
	function save1(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
		    type: "POST",
		    url: "<%=basePath %>datasource/doAdd.xhtml",
		    data: data,
		    success: function(msg){
		    if("success" == msg){
		    	$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		    	parent.rightFrame.$('#tt').datagrid("reload");
		    	window.parent.closeWin('多数据源添加添加');
		    	});
		    }else{
		    	$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
		    	}
		    }
		    });
		
		
	} 
	
	</script>