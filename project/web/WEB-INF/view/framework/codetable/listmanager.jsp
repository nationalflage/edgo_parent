<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hyjx.framework.service.UserCenterService" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>codetable/queryManagerList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'codetable',title:'码表',width:200,sortable:true},
						{field:'remark',title:'名称',width:200,sortable:true},
						{field:'codelevel',title:'类型',width:200,sortable:true,formatter:function(a,b,c){
							if(a=="1")
								return "系统级";
							else if(a=="2")
								return "用户级";
						}},
						{field:'code2',title:'操作',width:150,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		var ret= "<span title=修改 class=btn-edit onclick=edit("+"\'"+rowData.codetable+"\',"+rowData.codelevel+")></span>";
    		        		var tempAdmin="<%=UserCenterService.getCurrentUserInfo().getUserIsAdmin() %>";
    		        		if(rowData.codelevel=="2" || tempAdmin=="1")
    		        		{
	     		        		ret+="<span title=删除  class=btn-delete onclick=del("+"\'"+rowData.codetable+"\'"+")></span>";
    		        		}
    		        		return ret;
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
	 		openWinW('<%=basePath %>codetable/gotoManagerAdd.xhtml',"信息添加","600px","225px",false,false);
	 	}
	 	function edit(id,codelevel)
	 	{
	 		openWinW('<%=basePath %>codetable/gotoList.xhtml?codetable='+id+'&codelevel='+codelevel,"码表信息修改","750px","570px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","该代码信息有可能已被使用，确认删除吗？",function(result){
    			if(result == true){
    				$.ajax({
						data:"ids="+id,
						type:"POST",
    				   	url: "<%=basePath %>codetablemanager/gotoDelete.xhtml",
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
    				   		}else {
    				   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
    				   		}
    				   	},
    				   	error:function(msg)
    				   	{
    				   		$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
    				   	}
    				}); 
    			}
	 		});
	 	}
	 	function view(id,codetable)
	 	{
	 		openWinW('<%=basePath %>codetable/gotoView.xhtml?id='+id+'&codetable='+codetable,"信息详细","800px","500px",false,false);
	 	}
	</script>
  </head>
  
  <body>
  	<div class="content">
  	<h1 class="public-title"><b>码表查询</b></h1>
    <form id="form1" name="form1" class="query-list" method="post" action="" data-options="novalidate:true" 	>
    <input type="hidden" id="isadmin" name="isadmin" value=<c:out value="${sessionScope._USERINFO_.userIsAdmin}"/>>
    
	<table class="table-query">
	<tbody>
		<tr>
			<th>码表</th>
			<td>
				<input class="easyui-textbox" type="text" name="codetable"/>
			</td>
			<th>名称</th>
			<td>
				<input class="easyui-textbox" type="text" name="remark"/>
			</td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4" >
					<button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>  
			</td>
		</tr>
		</tfoot>
	</table>
</form>
</div>

<div class="content">
<div class="result-list">
	<h1 class="public-title"><b>码表列表</b></h1>
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>

	</div>
	</div>
  </body>
</html>
