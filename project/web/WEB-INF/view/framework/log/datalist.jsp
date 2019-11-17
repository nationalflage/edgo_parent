<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>信息列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>logbusiness/queryDataList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'timestamp',title:'操作时间',width:140},
						{field:'oper_id',title:'操作人ID',width:80},
						{field:'oper_name',title:'操作人名称',width:80},
						{field:'ip_address',title:'IP地址',width:100},
						{field:'exec_time',title:'执行时间',width:60,formatter:function(value, rowData, rowIndex){
							if(value=="null")
								return "";
							else
								return value+"ms";
						}},
						{field:'module_name',title:'模块名称',width:100},
						{field:'oper_desc',title:'操作描述',width:500},
						{field:'log_id',title:'操作',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return  "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"
    		        		 ;
    		        	}
    		        }
				]],
				onDblClickRow:function(index,row){
					view(row.log_id);
				}
			});	
		}
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
	 	function view(id)
	 	{
	 		openWinW('<%=basePath %>logbusiness/gotoView.xhtml?id='+id,"信息详细","800px","400px",false,false);
	 	}
	 	function delMonthData(){
	 		$.ajax({
    			url: "<%=basePath %>logbusiness/deleteMonthData.xhtml",
    			type: "POST",
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
	 	
	</script>
  </head>
  
  <body>
<div class="result-list">
    <h1 class="public-title">日志列表</h1>
    <div id="tb" class="operate">
       <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="delMonthData()" style="display: none;"></a>
    </div>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>
	</div>
  </body>
</html>
