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
				url: '<%=basePath %>task/queryList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'taskname',title:'任务名称',width:150,sortable:true},
						{field:'tasktype',title:'任务类型',width:100,sortable:true,
							formatter:function(value, rowData, rowIndex){ if(value=="1") return "SpringBean"; else if(value=="2") return "Java类"; else return "SQL语句"; }},
						{field:'startflowsys',title:'随系统启动',width:100,sortable:true,
								formatter:function(value, rowData, rowIndex){ if(value=="1") return "是"; else return "否"; }},
						{field:'issingleton',title:'是否单例',width:100,sortable:true,
									formatter:function(value, rowData, rowIndex){ if(value=="1") return "是"; else return "否"; }},
						{field:'methodname',title:'方法名称',width:100,sortable:true},
						{field:'cronexp',title:'CRON表达式',width:120,sortable:true},
						{field:'runstatus',title:'运行状态',width:120},
					{field:'taskid',title:'操作',width:120,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		var html = "";
    		        		 if(rowData.runstatus != "未启动"){
    		        			 html+="<span title=停止  class=btn-stop onclick=stop("+"\'"+value+"\'"+")></span>";
    		        			 html+="<span title=日志 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>";
    		        		 }else{
    		        			 html+="<span title=启动  class=btn-start onclick=start("+"\'"+value+"\'"+")></span>";
    		        			 html+="<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>";
        		        		 html+="<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>";
        		        		 html+="<span title=日志 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>";
    		        		 }
    		        		 return html;
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
	 		openWinW('<%=basePath %>task/gotoAdd.xhtml',"信息添加","700px","530px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>task/gotoEdit.xhtml?id='+id,"信息修改","700px","530px",false,false);
	 	}
        function view(id)
        {
            openWinW('<%=basePath %>task/gotoView.xhtml?id='+id,"日志查看","720px","530px",false,false);
        }

	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>task/gotoDelete.xhtml?ids="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
    				   		}else {
    				   			$.hyjx.alert("提示","操作失败","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
	 	}
	 	function start(id)
	 	{
			$.ajax({
			   	url: "<%=basePath %>task/gotoStart.xhtml?ids="+id,
			   	type:"post",
			   	success: function(msg){
			   			$('#tt').datagrid("reload");
			   	},
			   	error:function(msg)
			   	{
			   		$.hyjx.alert("提示",msg.statusText,"error", function(){ });
			   	}
			}); 
	 	}
	 	function stop(id)
	 	{
			$.ajax({
			   	url: "<%=basePath %>task/gotoStop.xhtml?ids="+id,
			   	type:"post",
			   	success: function(msg){
			   			$('#tt').datagrid("reload");
			   	},
			   	error:function(msg)
			   	{
			   		$.hyjx.alert("提示",msg.statusText,"error", function(){ });
			   	}
			}); 
	 	}

	</script>
  </head>
  
  <body>
  	<div class="content" style="display: none">
    <form id="form1" name="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
    <h1 class="title">查询</h1>
	<table class="table-query">
		<tr>
			<th>名称</th>
			<td>
				<input class="easyui-textbox" type="text" required="true" name="user_name"/>
			</td>
		</tr>
		<tr>
			<td class="" colspan="4" align="center">
					<button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>  
			</td>
		</tr>
	</table>
</form>
</div>

<div class="content">
<div class="result-list">
    <h1 class="public-title"><b>查询列表</b></h1>
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>
	</div></div>
  </body>
</html>
