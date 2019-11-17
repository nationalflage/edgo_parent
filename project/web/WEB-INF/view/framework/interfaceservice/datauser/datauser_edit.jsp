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
<form id="form1"  method="post" action="" >
				<input type="hidden" value="<c:out value="${model.userid }"/>"  id="userid" name="userid">
	<table  class="table-query">
			<tr>
			<th>用户登录名</th>
			<td>
				<input type="text" value="<c:out value="${model.userlogname }"/>" id="userlogname" name="userlogname" size="40" class="easyui-textbox" validType="length[1,15]" data-options="required:true" />
			</td>
			<th>用户名</th>
			<td>
				<input type="text" value="<c:out value="${model.username }"/>" id="username" name="username" size="40" class="easyui-textbox" validType="length[1,15]" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>用户类型</th>
			<td>
				<input type="text" data-options="required:true"  value="<c:out value="${model.usertype }"/>" id="usertype" name="usertype" size="40" class="easyui-textbox"/>
			</td>
			<th>私钥</th>
			<td>
				<input type="text" value="<c:out value="${model.privatekey }"/>" id="privatekey" name="privatekey" size="40" class="easyui-textbox" validType="length[0,28]"/>
			</td>
		</tr>
		<tr>
		<th>限定IP范围(正则表达式)</th>
			<td colspan="3">
				<input value="<c:out value="${model.restrictedips }"/>" class="easyui-textbox" id="restrictedips" name="restrictedips" data-options="multiline:true" validType="length[0,98]" style="width:460px;;height:50px;"/>
				<div>如：192.168.1.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d) 代表ip范围为192.168.1.0-192.168.1.255</div>
			</td>
			
		
			<%-- <td>
				<input type="text" value="<c:out value="${model.restrictedips }"/>" id="restrictedips" name="restrictedips" size="40" class="easyui-textbox" validType="length[0,200]"/>
			</td> --%>
		</tr>
		<tr>
			<th width="15%">是否有效</th>
			<td width="30%">
				<input type="radio" name="validity" <c:if test="${model.validity  eq '1'}">checked="checked"</c:if> value="1"/> 是
				<input type="radio" name="validity" <c:if test="${model.validity  eq '0'}">checked="checked"</c:if> value="0"/> 否
			</td>
		</tr>
		<tr>
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
                    <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息修改')"/>
                    
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
		   	url: "<%=basePath %>datauser/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
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
		   	cache:false,
		   	data: data,
		   	success: function(msg){
		   	
		    	if("success" == msg){
		    		$.ajax({
		    			type: "POST",
		    		   	url: "<%=basePath %>datauser/doEdit.xhtml",
		    		   	data: data,
		    		   	success: function(msg){
		    		    	if("success" == msg){
		    					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		    		   				parent.rightFrame.$('#tt').datagrid("reload");
		    		   				window.parent.closeWin('信息修改');
		    		   			});
		    				}else{
		    					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
		    				}
		    		   }
		    		}); 
				}else{
					$.hyjx.alert("提示信息","信息修改失败，用户登录名相同！","error", function(){});
				}
		   }
		}); 
	} 
	</script>