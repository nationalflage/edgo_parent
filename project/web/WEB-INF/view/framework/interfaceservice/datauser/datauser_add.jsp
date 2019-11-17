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

<body style="background-color: #fff">
<form id="form1"  method="post" action="">
				<%-- <input type="hidden" value="<c:out value="${model.userid }"/>"  id="userid" name="userid"> --%>
	<table  class="table-query">
			<tr>
			<th>用户登录名</th>
			<td>
				<input data-options="required:true" type="text"  id="userlogname" name="userlogname" size="40" class="easyui-textbox" validType="length[1,15]"/>
			</td>
			<th>用户名</th>
			<td>
				<input data-options="required:true" type="text"  id="username" name="username" size="40" class="easyui-textbox" validType="length[1,15]"/>
			</td>
		</tr>
		<tr>
			<th>用户类型</th>
			<td>
				<input type="text" data-options="required:true" id="usertype" name="usertype" size="40" class="easyui-textbox"/>
			</td>
			<th>私钥</th>
			<td>
				<input type="text"  id="privatekey" name="privatekey" size="40" class="easyui-textbox" validType="length[1,28]"/>
			</td>
		</tr>
		<tr>
		<th>限定IP范围(正则表达式)</th>
			<td colspan="3">
				<input  class="easyui-textbox" id="restrictedips" name="restrictedips" data-options="multiline:true" validType="length[0,98]" style="width:460px;;height:50px;"/>
				<div>如：192.168.1.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d) 代表ip范围为192.168.1.0-192.168.1.255</div>
			</td>
		</tr>
		<tr>
			<th width="15%">是否有效</th>
			<td width="30%">
				<input type="radio" name="validity"  value="1" checked="checked"/> 是
				<input type="radio" name="validity"  value="0"/> 否
			</td>
		
		
			<%-- <th width="15%">是否有效</th>
			
			<td width="30%">
				<input type="radio" name="validity" <c:if test="${model.validity  eq '0'}">checked="checked"</c:if> value="0"/> 否
				<input type="radio" name="validity" <c:if test="${model.validity  eq '1'}">checked="checked"</c:if> value="Y"/> 是
			</td> --%>
			<%-- <td>
				<input type="text" value="<c:out value="${model.validity }"/>" id="validity" name="validity" size="40" class="easyui-textbox" validType="length[0,1]"/>
			</td> --%>
			
		</tr>
		<tr>
		<th>用户所需参数</th>
			<td colspan="3">
				<input  class="easyui-textbox" value="<c:out value="${model.parameter}"/>" id="parameter" name="parameter" data-options="multiline:true" validType="length[0,120]" style="width:460px;;height:50px;"/>
			<br>
			参数样例：{'p1':'01','p2':'2'}(p1,p2代表参数名,01,2 代表参数对应的值)
			</td>
		</tr>
		
		<tfoot>
            <tr height="100">
                <td colspan="4">
                    <input type="button" class="btn btn-info" value="保　存" onclick="save1();"/>
                    <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('数据用户添加')"/>
                    
                </td>
            </tr>
        </tfoot>
        
	</table>
</form>
</body>
</html>

<script type="text/javascript">

$(document).ready(function(){
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
});



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
		   	url: "<%=basePath %>datauser/userConfirm.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
		    		$.ajax({
		    			type: "POST",
		    		   	url: "<%=basePath %>datauser/doAdd.xhtml",
		    		   	data: data,
		    		   	success: function(msg){
		    		    	if("success" == msg){
		    					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		    		   				parent.rightFrame.$('#tt').datagrid("reload");
		    		   				window.parent.closeWin('数据用户添加');
		    		   			});
		    				}else{
		    					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
		    				}
		    		   }
		    		}); 
				}else{
					$.hyjx.alert("提示信息","信息添加失败，用户登录名相同！","error", function(){});
				}
		   }
		}); 
	} 
	
	</script>