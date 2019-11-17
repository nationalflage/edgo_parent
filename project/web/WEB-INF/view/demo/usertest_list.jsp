<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>用户测试</title>
</head>
<body>
	<h1 class="public-title">查询条件列表</h1>
    <form class="query-list" id="form1" data-options="novalidate:true" method="post">
	<table class="table-query">
		<tfoot>
            <tr>
                <td colspan="6">
                    <input class="btn btn-info" type="button" value="查　询" onclick="doQuery()"/>
                    <input class="btn" type="button" value="重　置" onclick="clearAll()"/>
                </td>
            </tr>
        </tfoot>
	</table>
	</form>
	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title">查询列表</h1>
        <!-- 操作按钮 -->
        <div class="operate" id="tb">
            <a class="easyui-linkbutton" href="#" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        </div>
        <table class="easyui-datagrid" id="tt" ></table>
    </div>
    <!-- 查询结果列表 end -->
	<script>
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>usertest/queryList.xhtml',
				queryParams: data_attr,
				singleSelect: true,
				rownumbers: true,
				pagination: true,
				pageNumber: 1,
				pageSize:20,
				columns:[[
						{field:'userpwd',title:'密码',width:100},
					{field:'username',title:'操作',width:100,halign:'center',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>";
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
	 		openWinW('<%=basePath %>usertest/gotoAdd.xhtml',"信息添加","650px","350px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>usertest/gotoEdit.xhtml?id='+id,"信息修改","650px","350px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>usertest/gotoDelete.xhtml?ids="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.messager.alert("提示","删除操作成功！","info", function(){ });
    				   		}else {
    				   			$.messager.alert("提示","删除失败，请重试！","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
	 	}
	 	function view(id)
	 	{
	 		openWinW('<%=basePath %>usertest/gotoView.xhtml?id='+id,"信息详细","650px","350px",false,false);
	 	}
	</script>
</body>
</html>