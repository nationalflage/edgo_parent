<%@page import="com.hyjx.framework.service.UserCenterService"%>
<%@page import="com.hyjx.framework.uc.user.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String userOrgCode=UserCenterService.getCurrentUserOrgCode();
	String userIsAdmin=UserCenterService.getCurrentUserInfo().getUserIsAdmin();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp" ></jsp:include>
	<title>人员层</title>
	<style>
		.datagrid-header td, .datagrid-body td, .datagrid-footer td{
			border-left: none;
			border-right: none;
		}
	</style>
	<script type="text/javascript">
		var selectedUsers = {};
		function onOrgTreeClick(node){
			$("#departCode").val(node['attributes']);
			$("#orgCode").val(node['code']);
			query();
		}
    
		$(function() {
			query();
		});

		function clearAll()
		{
			$("#userAccount").textbox('setValue','');
			$("#userName").textbox('setValue','');
			$("#includChild").val("1");
			$("#includChildBox").get(0).checked=true;
		}
    
		function ok()
		{
			window.parent.parent.closeWin('选择用户',selectedUsers);
		}
		function JSONLength(obj) {
			var size = 0, key;
			for (key in obj) {
			if (obj.hasOwnProperty(key)) size++;
			}
			return size;
		};
		function query()
		{
			if ($("#includChildBox").get(0).checked){
				$("#includChild").val("1");
			}else{
				$("#includChild").val("0");
			}

			var data = $("#form1").serialize();
			$('#tt').datagrid({
				url:'<%=basePath %>user/queryUserList.xhtml',
				queryParams:data,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
					{field:'user_account',title:'登录名',width:'35%',align:'left',sortable:true},
					{field:'user_name',title:'用户名',width:'35%',align:'left',sortable:true},
					{field:'user_sex',title:'性别',width:'25%',align:'left',sortable:true,formatter:function(value, rowData, rowIndex){
						if(value == "M")
						{
							return "男";
						}else if(value == "F")
						{
							return "女";
						}
					}}
				]],
				onDblClickRow: function (rowIndex, rowData) {
					var userId=rowData.user_id;
					var userName=rowData.user_name;
					selectedUsers[userId]=rowData;
					var insertHtml1='<p>'+userName+'<button class="btn-close" id="'+userId+'"></button></p>';
					$('.orange-border').find('.label-content').append(insertHtml1);

					// 点击叉号，移除已选区的该标签
					$('#'+userId).on('click',function() {
						$(this).parent('p').remove();
						delete selectedUsers[userId];
					});
				}
			});
		}
    
    
 	
</script>
</head>
<body style="background-color: #fff">

	<table border="0" width="100%" cellspacing="15px">
			<tr>
				<td rowspan="2" width="200px" height="100%" valign="top" class="theme-border">
					<ul id="tree" class="hy-orgtree" departtype="2" onclick="onOrgTreeClick" />
				</td>
				<td rowspan="2" class="theme-border">
						<h1 class="public-title"><b>用户查询</b></h1>
						<form id="form1" class="query-list" name="form1"  method="post" action="" data-options="novalidate:true">
							<input type="hidden" id="orgCode" name="orgCode" value="<c:out value="${bean.orgCode}"/>"/>
							<input type="hidden" id="departCode" name="departCode" value="<c:out value="${bean.departCode}"/>"/>
							<input type="hidden" id="includChild" name="includChild" value="1"/>
							<input type="hidden" id="userIsAdmin" name="userIsAdmin" value="0">
							<input type="hidden" id="levelId" name="levelId" >

							<!-- query table -->
							<table class="table-query">
								<tbody>
								<tr>
									<td colspan="4">
										<label><input type="checkbox" name="includChildBox" id="includChildBox" checked="checked"/>包含下级</label>
									</td>
								</tr>
								<tr>
									<th >用户姓名</th>
									<td ><input class="easyui-textbox" type="text" name="userName" id="userName" style="width:150px;"/></td>
									<th >登录名</th>
									<td ><input class="easyui-textbox" type="text" name="userAccount" id="userAccount" style="width:150px;"/></td>
								</tr>
								</tbody>
								<tfoot>
								<tr>
									<td colspan="4" >
										<button class="btn btn-sm btn-info" type="button" onclick="query()">查 询</button>
										<button class="btn btn-sm" onclick="clearAll();" type="button">清 空</button>
									</td>
								</tr>
								</tfoot>
							</table>
						</form>

						<!-- 查询结果列表 -->
						<div class="result-list">
							<h1 class="title"><b>用户查询列表（双击选择）</b></h1>
							<table id="tt" class="easyui-datagrid"></table>
						</div>
					</div>
				</td>
				<td width="230px" valign="top" style="position:relative;" class="orange-border">
					<h4 class="headline">
						已选用户
					</h4>
					<div class="label-content">

					</div>
				</td>
			  </tr>
			  <tr>
				<td align="center" height="30px">
					<button class="btn btn-info" style="width: 100%;margin: 0;font-size: 16px;" onclick="ok();" type="button">确　定</button>
				</td>
			</tr>
	</table>
</body>
</html>