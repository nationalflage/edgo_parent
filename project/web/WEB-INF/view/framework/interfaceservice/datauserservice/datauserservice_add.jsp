<%@ page language="java" import="com.hyjx.framework.service.SessionManager" pageEncoding="utf-8"%>
<%
String userid= SessionManager.getString("userid");
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

<body >
<div class="content">
	<h1 class="public-title"><b>查询条件</b></h1>
    <form id="form1"  method="post" action="" data-options="novalidate:true">
	<table class="table-query">
		<tr>
		
		<th >服务名称：</th>
			<td >
				<input class="easyui-textbox" type="text" name="srvname" id="srvname" value="<c:out value="${model.depart_level}"/>"/>
			</td>
			<th >服务类型：</th>
			
			<td >
				<input type="text" value="<c:out value="${model.srvtype }"/>" id="srvtype" name="srvtype" style="width:100px;" class="easyui-textbox" />
			</td>
			
			 <td >
                    <input type="button" class="btn btn-info" value="查询" onclick="doQuery();"/>
<!--                     <input type="button" class="btn btn-info" value="关闭" onclick="window.parent.parent.closeWin('选择服务');"/> -->
                    <input type="button" class="btn btn-warn" value="重置" onclick="$('#form1').form('clear')"/>
             </td>
			
		</tr>
		
		
        
	</table>
	</form>
</div>
<div class="content">
		<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title">服务列表</h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
    <!-- 查询结果列表 end -->
	
	


</div>
  </body>
</html>

<script type="text/javascript">
		$(function(){
			doQuery();
			$.ajax({
				url:'<%=basePath%>selectServlet?codetable=interface_srv_type',
				datatype:"json",
				success:function(res)
				{
					$("#srvtype").combobox({
						editable:false,
						valueField:'code',
					    textField:'name' ,
					    panelHeight:'auto',
					    data:JSON.parse(res).result
					});
				},
				error:function(res)
				{
				}
			});
		});
		function doQuery(){
			//alert("1");
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>userservice/showService.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				singleSelect:false,
				columns:[[
						{ field:'ck',checkbox:true },
					
						{field:'srvname',title:'服务名称',width:100},
						{field:'srvtype',title:'服务类型',width:100},
						{field:'querysql',title:'查询SQL',width:150}
				]]
			});	
		}
		function add(){
			var checkedItems = $('#tt').datagrid('getChecked');
			var names = [];
			$.each(checkedItems, function(index, item){
			var srvid=item.srvid;
			
			var userids="<%=userid %>";
			
			var temp="<%=basePath %>userservice/doAddSingle.xhtml?srvid="+srvid+"&userid="+userids;
			$.ajax({
				url: "<%=basePath %>userservice/doAddSingle.xhtml?srvid="+srvid+"&userid="+userids,
				cache:false,
				success: function(msg){
					if("success" == msg) {
						parent.rightFrame.treeFrame.$('#tt').datagrid("reload");
						//parent.$('#tt').datagrid("reload");
						window.parent.parent.closeWin('选择服务');
					}else {
					
					}
				}
				});
			});
			
			
		}
	</script>
