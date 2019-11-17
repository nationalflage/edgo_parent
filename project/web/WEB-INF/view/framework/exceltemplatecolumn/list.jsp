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
        function add()
        {
        var pub_excel_template_id="<%=request.getParameter("pub_excel_template_id")==null?"":request.getParameter("pub_excel_template_id")%>";
        	openWinW('<%=basePath%>exceltemplatecolumn/gotoAdd.xhtml?pub_excel_template_id='+pub_excel_template_id, '新增模板列', '700px', '300px', true, false);
        }
        
        function del(id)
        {
        	
        	$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>exceltemplatecolumn/doDelete.xhtml?pub_excel_template_column_id="+id,
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
          var pub_excel_template_id="<%=request.getParameter("pub_excel_template_id")==null?"":request.getParameter("pub_excel_template_id")%>";
          openWinW('<%=basePath%>exceltemplatecolumn/gotoEdit.xhtml?pub_excel_template_column_id='+id+"&pub_excel_template_id="+pub_excel_template_id, '修改模板列', '700px', '300px', true, false);
        }
        function view(v)
        {
        	openWinW('<%=basePath%>exceltemplatecolumn/gotoView.xhtml?pub_excel_template_column_id='+v, '查看详情', '900px', '400px', true, false);
        }
        function query()
        {
         	var data = $("#form1").serialize();
        	$('#tt').datagrid({
        		    url:'<%=basePath %>exceltemplatecolumn/query.xhtml',
        		   queryParams:data,
    				rownumbers: true,
    				pageNumber: 1,
        		    columns:[[
        		        {field:'ch_column_name',title:'中文列名',width:'15%',showTitle:true},
        		        {field:'en_column_name',title:'英文列名',width:'10%',align:'left'},
        		        {field:'excel_field_no',title:'字段顺序',width:'10%',align:'left'},
        		        {field:'max_length',title:'最大长度',width:'10%',align:'left'},
        		        {field:'data_type',title:'字段类型',width:'10%',align:'left',formatter: function (value, rowData, rowIndex) {
   		        		 
        		        	if(value=="String")
        		        		return "字符串";
        		        	if(value=="Date")
        		        		return "日期";
        		        	if(value=="Number")
        		        		return "数字";
		        	}},
        		        {field:'is_null',title:'是否必填',width:'10%',align:'left',formatter:function(value, rowData, rowIndex){
        		        	if(value=="Y") return "是";
        		        	else return "否";
        		        }},
        		         {field:'is_primary_key',title:'主键',width:'10%',align:'left',formatter:function(value, rowData, rowIndex){
        		        	if(value=="Y") return "是";
        		        	else return "否";
        		        }},
        		         {field:'date_formate',title:'日期格式',width:'10%',align:'left'},
        		        {field:'pub_excel_template_column_id',title:'操作',width:110,
        		        	formatter: function (value, rowData, rowIndex) {
        		        		 return "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"+
        		        		  "<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>"+
        		        		"<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>";
        		        	}	
        		        }
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
        
        function clearAll()
        {
        	$("#form1").form("clear");
        }
        
         function back(){
        	window.parent.document.getElementById("rightFrame").src="<%=basePath%>excelTemplate/gotoExcelTemplate.xhtml";
        }
    </script>
</head>
<body>
<div class="content">
    <!-- 查询条件列表 -->
    <!-- <h1 class="public-title">excel模板列查询</h1> -->
    <form id="form1"  name="form1"  method="post" action="" data-options="novalidate:true">
    <input type="hidden" name="pub_excel_template_id" value="<%=request.getParameter("pub_excel_template_id")==null?"":request.getParameter("pub_excel_template_id")%>" >
        <%-- <table class="table-query">
        <tbody>
            <tr>
                <th width="10%">英文列名</th>
                <td ><input class="easyui-textbox" type="text" name="en_column_name"/></td>
                <th width="10%">中文列名</th>
                <td ><input class="easyui-textbox" type="text" name="ch_column_name"/>
                <input type="hidden" name="excel_template_id" value="<%=request.getParameter("excel_template_id")==null?"":request.getParameter("excel_template_id")%>" >
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
        </table> --%>
    </form>

    <!-- 查询结果列表 -->
    <div class="result-list">
        <h1 class="title">模板列列表</h1>
        <div id="tb" class="operate">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
		<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'" onclick="back()">回退</a>
    </div>
		<table id="tt" class="easyui-datagrid"></table>
    </div>
</div>
</body>
</html>