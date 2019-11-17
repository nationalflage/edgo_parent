<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>查询条件和查询结果列表</title>
</head>
<body>
	<div class="content">
	    <!-- 查询条件列表 -->
	    <h1 class="public-title">用户查询</h1>
	    <form class="query-list" id="form1" name="form1" data-options="novalidate:true"  method="post">
		<%-- <input type="hidden" id="depart_id" name="depart_id"  value="${user.depart_id }"/> --%>
	        <!-- query table -->
	        <table class="table-query">
	        	<tbody>
		            <tr>
		                <th width="10%">用户名</th>
		                <td ><input class="easyui-textbox" name="user_name" type="text"/></td>
		                <th width="10%">登录名</th>
		                <td ><input class="easyui-textbox" name="user_account" type="text"/></td>
		                <th width="10%">部门</th>
		                <td>
		                    <input class="easyui-combotree bmtree" id="bmtree" editable="true" style="width:200px;">
		                </td>
		            </tr>
	            </tbody>
	            <tfoot>
		            <tr>
		                <td colspan="6" >
		                    <button class="btn btn-info" type="button" onclick="query()">查 询</button>
		                    <button class="btn" type="button" onclick="clearAll();">清 空</button>
		                </td>
		            </tr>
	             </tfoot>
	        </table>
	    </form>
	    <!-- 查询结果列表 -->
	    <div class="result-list">
	        <h1 class="title">用户查询列表</h1>
	        <div id="tb" class="operate">
	            <a class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-template'" href="<%=basePath %>demo/exportData.xhtml?en_module_name=user&template=1" onclick="javascript:void(0);">下载模板</a>
	            <a class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-import'" href="javascript:void(0)" onclick="gotoImport()">导入</a>
	            <a class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'" href="<%=basePath %>demo/exportData.xhtml?en_module_name=user" onclick="javascript:void(0);">导出</a>
	        </div>
			<table class="easyui-datagrid" id="tt"></table>
		</div>
	</div>
    <script>
        function clearAll()
        {
        	$("#form1").form("clear");
        	document.getElementById("depart_id").value='';
        }
        function add()
        {
        	openWinW('<%=basePath%>user/gotoImport.xhtml', '新增用户', '900px', '600px', true, false);
        }
        function gotoImport()
        {
            // alert(123);
        	openWinW('<%=basePath%>common/gotoImport.xhtml?en_module_name=user', '用户信息导入', '900px', '600px', true, false);
        }
        function del()
        {
        	var row = $('#tt').datagrid('getSelected');
        	var id=row.user_id;
        	$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>user/gotoDelete.xhtml?ids="+id,
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
        function edit(id)
        {
        	openWinW('<%=basePath%>user/gotoEdit.xhtml?user_id='+id, '修改用户', '900px', '480px', true, false);
        }
        function view(v)
        {
        	openWinW('<%=basePath%>user/gotoView.xhtml?user_id='+v, '查看详细', '900px', '480px', true, false);
        }
        function query()
        {
         	var data = $("#form1").serialize(); 
        	$('#tt').datagrid({
        		    url:'<%=basePath %>user/queryUserList.xhtml',
        		    queryParams:data,
        		    singleSelect: true,
    				rownumbers: true,
    				pagination: true,
    				pageNumber: 1,
        		    columns:[[
        		        {field:'user_account',title:'登录名',width:'15%'},
        		        {field:'user_name',title:'用户名',width:'10%',align:'left'},
        		        {field:'user_sex',title:'性别',width:'10%',align:'left',formatter:function(value, rowData, rowIndex){
        		        	if(value == "M")
        		        	{
        		        		return "男";
        		        	}else if(value == "F")
        		        	{
        		        		return "女";	
        		        	}
        		        }},
        		        {field:'office_tel',title:'办公电话',width:'10%',align:'left'},
        		        {field:'mobile',title:'手机',width:'15%',align:'left'},
        		        {field:'email',title:'电子邮件',width:'15%',align:'left'},
        		        {field:'validity',title:'是否有效',width:'10%',align:'left',formatter:function(value, rowData, rowIndex){
        		        	if(value=="Y") return "是";
        		        	else return "否";
        		        }}
        		    ]]
        		});	
        }
        $(document).ready(function(){
			query();
			$("#user_sex").combobox({
				valueField:'code', //值字段
	            textField:'name', //显示的字段
	            panelHeight:'auto',
	            url:'<%=basePath%>selectServlet?codetable=sex',
	            value:'请选择...',
	            editable:false
			});
        });
        function setNodeId(id){
        	$("#depart_id").val(id);
        }
        $('#bmtree').combotree({
			onClick:function(node){
				$("#depart_id").val(node.attributes);
			}
        });
    </script>
</body>
</html>