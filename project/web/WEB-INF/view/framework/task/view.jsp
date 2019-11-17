<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <title>列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>task/queryLogList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'taskname',title:'任务名称',width:140},
						{field:'runtime',title:'开始时间',width:158},
						{field:'message',title:'结果信息',width:360,showTitle:true}
				]]
			});	
		}

		function clearLog()
	 	{
	 		var id=$("#taskid").val();
	 		$.hyjx.confirm("提示信息","确定要清除本任务的日志信息吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>task/gotoDeleteLog.xhtml?taskid="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","操作成功！","info", function(){ });
    				   		}else {
    				   			$.hyjx.alert("提示","操作失败","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
	 	}
	</script>
  </head>
  
  <body>
    <form id="form1" name="form1" class="query-list" method="post" action="" data-options="novalidate:true" style="display: none">
    	<input type="hidden" id="taskid" name="taskid" value="<c:out value="${model.taskid}"/>"/>
	</form>
<div class="result-list">
    <h1 class="public-title">日志列表</h1>
        <div id="tb" class="operate">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="clearLog();">清除</a>
        </div>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>
	</div>
  </body>
</html>
