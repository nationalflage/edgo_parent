<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>查询列表</title>
</head>
<body>
	<h1 class="public-title">查询条件列表</h1>
    <!-- 查询条件列表 -->
    <form class="query-list" id="form1" data-options="novalidate:true" method="post">
        <table class="table-query">
            <tbody>
                <tr>
                    <th width="10%">组织机构代码</th>
                    <td>
                        <input class="easyui-textbox"  type="text" name="orgcode"/>
                    </td>
                    <th width="10%">组织机构名称</th>
                    <td>
                         <input class="easyui-textbox" type="text" name="orgname"/>
                    </td>
                    <th>行政区划</th>
                    <td >
                    	<input class="easyui-combobox" id="districtid" name="districtid" type="text" style="width:100%">
                    </td>
                </tr>
            </tbody>
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
        <div id="tb" class="operate">
        	<a class="easyui-linkbutton" href="#" iconCls="icon-ok" plain="true" onclick="selectItem()">确定</a>
        </div>
        <table class="easyui-datagrid" id="tt" >
        </table>
    </div>
    <!-- 查询结果列表 end -->
	<script>
		$(function(){
			doQuery();
			$.ajax({
				url:'<%=basePath%>selectServlet?codetable=region',
				datatype:"json",
				success:function(res)
				{
					$("#districtid").combobox({
						editable:false,
						valueField:'code',
					    textField:'name' ,
					    panelHeight:'auto',
					    data:JSON.parse(res).result
					});
				},
				error:function(res)
				{
					//alert(res.responseText);
				}
			});
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>orginfo/queryList.xhtml',
				queryParams: data_attr,
				
				singleSelect: true,
				rownumbers: true,
				pagination: true,
				pageNumber: 1,
				columns:[[
						{field:'orgname',title:'组织机构名称',width:200,halign:'center'},
						{field:'orgcode',title:'组织机构代码',width:120,halign:'center'},
						{field:'principal',title:'法定代表人',width:80,halign:'center'},
						{field:'createdate',title:'成立日期',width:110,halign:'center'},
						{field:'regfunds',title:'注册资金(元)',width:120,align:'right',halign:'center'},
						{field:'districtid',title:'行政区划',width:100,align:'center',halign:'center'}
					
				]]
			});	
		}
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
		function add()
	 	{
	 		openWinW('<%=basePath %>orginfo/gotoAdd.xhtml',"信息添加","800px","460px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>orginfo/gotoEdit.xhtml?id='+id,"信息修改","800px","460px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>orginfo/gotoDelete.xhtml?ids="+id,
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
	 		openWinW('<%=basePath %>orginfo/gotoView.xhtml?id='+id,"信息详细","800px","500px",false,false);
	 	}
	 	function excelExport(){
	 		var url='<%=basePath%>orginfo/doExcelExport.xhtml';
	 		 location.href = url;
	 	}
	 	function selectItem(){
	 		var row = $('#tt').datagrid('getSelected');
	 		if (row){
	 			window.parent.parent.closeWin('选择组织机构',row);
	 		}else{
	 			$.hyjx.alert("提示","未选择数据！","info", function(){ });
	 		}
	 	}
	</script>
</body>
</html>