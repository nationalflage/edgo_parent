<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title></title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    </head>
<body>

			<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
			<input type="hidden" name="user_id" id="user_id" value="${userModel.user_id}">
			<input type="hidden" name="depart_id" id="depart_id" value="${userModel.user_id}">
			<table  class="table-query">
				<tr>
				<th width="15%">登录名</th><td width="30%">
				${userModel.user_account }
				<th width="15%">密码</th><td>-</td>
				</tr>
				<tr>
				<th width="15%">姓名</th><td width="30%">
					${userModel.user_name }
				<th width="15%">性别</th>
				<td  width="30%">
					 ${userModel.user_sex=='M' ? '男' : userModel.user_sex}
				</td>

				</tr>
				<tr>
				<th width="15%">办公电话</th><td  width="30%">
					${userModel.office_tel }
				</td>
				<th width="15%">电子邮件</th><td  width="30%">
					${userModel.email }
				</td>
				
				</tr>
				<tr>
				<th width="15%">传真</th><td  width="30%">
					${userModel.office_fax }
				</td>
				<th width="15%">移动电话</th><td  width="30%">
				${userModel.mobile }
				
				</td>
				
				</tr>
				<tr>
				<th width="15%">是否有效</th><td  width="30%">
					<input type="radio" name="validity" <c:if test="${userModel.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是
				<input type="radio" name="validity" <c:if test="${userModel.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否
				
				</td>
				</tr>
				
			</table>
			
			<table id="tt" style="width:100%;"></table>
			<table  class="table-query">
			<tfoot>
				<tr>
				<td>
				<center>
                        <button class="btn"  onclick="closewin();">关 闭</button>
                 </center> 
				</td>
				</tr>
				</tfoot>
				</table>	

		</form>
			
			
</body>
</html>
<script type="text/javascript">
	function closewin()
	{
		window.parent.closeWin('查看详细');
	}
	
	$(function(){
		doQuery();
	});
	
	function doQuery(){
		var data_attr = $("#form1").serialize();
		$('#tt').datagrid({
			url: '<%=basePath %>role/queryList.xhtml',
			queryParams: data_attr,
			
			singleSelect: true,
			rownumbers: true,
			pagination: false,
			pageNumber: 1,
			frozenColumns:[[
			                {field:'role_id',checkbox:true}
						]],
			columns:[[
					{field:'role_name',title:'角色名称',width:100},
					{field:'role_desc',title:'角色描述',width:100},
					{field:'role_type',title:'角色类型',width:100}
					
				
			]],
			onLoadSuccess : function(data){
				var id = $("#user_id").val();
				var url2 = '<%=path%>/user/doUserRole.xhtml?id='+id;
				$.ajax({
					type: "POST",
				   	url: url2,
				   	success: function(msg){
				   		var rows = $("#tt").datagrid("getRows"); 
						for(var i=0; i<rows.length; i++){
							var rid=','+rows[i].role_id+',';
							var index1=msg.indexOf(rid);
							if(index1>0){
								$("#tt").datagrid("selectRow", i);
							}
						}
				   	}
				});
			}
		});	
	}
</script>