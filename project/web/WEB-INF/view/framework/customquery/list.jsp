<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <title>信息列表</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>customquery/queryConfigList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'query_name',title:'查询名称',width:200,sortable:true},
						{field:'query_type',title:'查询类型',width:100,formatter:function(a,b,c){
							if(a=='query')
								return "普通查询";
							else if(a=='advance')
								return "高级查询";
						},sortable:true},
						{field:'create_date',title:'创建时间',width:130,sortable:true},
						{field:'validity',title:'是否有效',width:100,sortable:true,formatter:function(value,rowData,rowIndex){
							if(value=='Y') return '是';
							else return '否';
						}},
					{field:'query_id',title:'操作',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"'"+")></span>"+
      		        		"<span title=删除  class=btn-delete onclick=del("+"\'"+value+"'"+")></span>"+
      		        		"<span title=查看  class=btn-view onclick=view("+"\'"+value+"'"+")></span>"
      		        		;
    		        	}
    		        }
				]]
			});	
		}
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
		function add()
	 	{
	 		openWinW('<%=basePath %>customquery/gotoAdd.xhtml',"信息添加","1000px","600px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>customquery/gotoAdd.xhtml?query_id='+id+'&action_type=edit',"信息修改","1000px","600px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>customquery/gotoDelete.xhtml?ids="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
    				   		}else {
    				   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
	 	}
	 	function view(id)
	 	{
	 		window.open("<%=basePath%>customquery/customqueryList.xhtml?query_id="+id);
	 	}
	</script>
  </head>

<body>
	<div class="content" style="display: none;">
		<form id="form1" name="form1" class="query-list" method="post"
			action="" data-options="novalidate:true" >
			<h1 class="public-title">
				<b>查询条件</b>
			</h1>
	
			<table class="table-query">
				<tr>
					<th>名称</th>
					<td><input class="easyui-textbox" type="text" required="true"
						name="user_name" /></td>
				</tr>
				<tr>
					<td class="" colspan="4" align="center">
						<button class="btn btn-info" type="button" onclick="doQuery()">查
							询</button>
						<button class="btn" onclick="clearAll();" type="button">清
							空</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="content">
		<div class="result-list">
			<h1 class="public-title">
				<b>自定义查询列表</b>
			</h1>
			<div id="tb" class="operate">
				<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
			</div>
			<table id="tt" style="width: 100%;"></table>
		</div>
	</div>
</body>
</html>
