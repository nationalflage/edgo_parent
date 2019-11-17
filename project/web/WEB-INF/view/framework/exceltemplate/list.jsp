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
    <script type="text/javascript">
       
        function clearAll()
        {
        	$("#form1").form("clear");
        }
        function add()
        {
        	openWinW('<%=basePath%>excelTemplate/gotoAdd.xhtml', '新增excel模板', '850px', '280px', true, false);
        }
        
        function del(id)
        {
        	$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>excelTemplate/doDelete.xhtml?pub_excel_template_id="+id,
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
        	openWinW('<%=basePath%>excelTemplate/gotoEdit.xhtml?pub_excel_template_id='+id, '修改excel模板', '900px', '250px', true, false);
        }
        function view(v)
        {
        	openWinW('<%=basePath%>excelTemplate/gotoView.xhtml?pub_excel_template_id='+v, '查看详细', '600px', '300px', true, false);
        }
        function query()
        {
         	var data = $("#form1").serialize(); 
        	$('#tt').datagrid({
        		    url:'<%=basePath %>excelTemplate/queryAll.xhtml',
        		    queryParams:data,
    				rownumbers: true,
    				pageNumber: 1,
        		    columns:[[
        		        {field:'module_ch_name',title:'模块中文名',width:'15%',showTitle:true},
        		        {field:'module_en_name',title:'模块英文名',width:'15%',align:'left'},
        		        {field:'is_direct_import',title:'直接入库',width:'10%',align:'left',formatter:function(value, rowData, rowIndex){
        		        	if(value == "Y")
        		        	{
        		        		return "是";
        		        	}else if(value == "N")
        		        	{
        		        		return "否";	
        		        	}
        		        }},
        		        {field:'sql_id',title:'sql_id',width:'15%',align:'left',
        		        	formatter: function (value, rowData, rowIndex) {
       		        		if(rowData.is_direct_import=="Y"){
       		        			return value;
       		        		}
       		        	}	},
        		        {field:'class_name',title:'model类名',width:'15%',align:'left',showTitle:true},
        		        {field:'table_name',title:'表的名字',width:'10%',align:'left',
        		        	formatter: function (value, rowData, rowIndex) {
        		        		if(rowData.is_direct_import=="Y"){
           		        			return value;
           		        		}
       		        	   }	
        		        },
        		        {field:'pub_excel_template_id',title:'操作',width:105,
        		        	formatter: function (value, rowData, rowIndex) {
        		        		 return "<span title='查看' class='btn-view' onclick=view("+"\'"+value+"\'"+")></span>"+
        		        		  "<span title='编辑' class='btn-edit' onclick=edit("+"\'"+value+"\'"+")></span>"+
        		        		"<span title='删除' class='btn-delete' onclick=del("+"\'"+value+"\'"+")></span>"
        		        		+"<img title='编辑模板列' class='btn-img' src='<%=basePath %>images/setting.png' onclick='gotoColumns(\""+value+"\")' />";
        		        	}	
        		        }
        		        
        		    ]]
        		});	
        }
        $(document).ready(function(){
			query();
        });
        
        function gotoColumns(pub_excel_template_id){
            window.parent.document.getElementById("rightFrame").src="<%=basePath%>exceltemplatecolumn/gotoExcelTemplateColumn.xhtml?pub_excel_template_id="+pub_excel_template_id;
        }
    </script>
</head>
<body>
    <!-- 查询条件列表 -->
    <div class="content">
    <h1 class="public-title"><b>模板查询</b></h1>
    <form id="form1" class="query-list" name="form1"  method="post" action="" data-options="novalidate:true">
<%--     	<input type="hidden" id="depart_id" name="depart_id"  value="<c:out value="${user.depart_id }"/>"/> --%>
        
        <!-- query table -->
        <table class="table-query">
        <tbody>
            <tr>
                <th width="10%">模块中文名</th>
                <td >
                <input class="easyui-textbox" type="text" name="module_ch_name"/>
                </td>
                <th width="10%">模块英文名</th>
                <td >
                <input class="easyui-textbox" type="text" name="module_en_name"/>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6" >
                    <button class="btn btn-info" type="button" onclick="query()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>
                </td>
            </tr>
             </tfoot>
        </table>
    </form>
	</div>
	<div class="content" >
    <!-- 查询结果列表 -->
    <div class="result-list">
        <h1 class="title"><b>模板查询列表</b></h1>
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
		<table id="tt" class="easyui-datagrid"></table>
    </div>
    </div>
</body>
</html>
<script>
$('#bmtree').combotree({
	 onClick:function(node){
		 $("#depart_id").val(node.attributes);
	 }
});

</script>