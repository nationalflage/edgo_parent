<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hyjx.framework.service.UserCenterService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String userOrgCode=UserCenterService.getCurrentUserInfo().getDataOrgCode();
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <title>信息列表</title>
     <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>propertyconfig/queryList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'property_key',align:'left',title:'属性键',width:'16%',sortable:true},
						{field:'property_value',align:'left',title:'属性值',width:'35%',sortable:true,formatter:function (value, rowData, rowIndex) {
							if(value!=null&&value.length>30){
								return "<span title='"+value+"'>"+value.substring(0,40)+"...</span>";
							}else 
								return value;
							
						}},
						{field:'property_type',title:'属性类型',width:'10%',sortable:true,formatter:function (value, rowData, rowIndex) {
							if(value=="1")
								return "系统级";
							else if(value=="2")
								return "项目级";
						}},
						{field:'property_enum',title:'枚举值',width:'10%',formatter:function (value, rowData, rowIndex) {
							if(value!=null&&value.length>30){
								return "<span title='"+value+"'>"+value.substring(0,30)+"</span>";
							}else 
								return value;
							
						}},
						{field:'note',title:'备注',width:'10%',showTitle:true,formatter:function (value, rowData, rowIndex) {
							if(value!=null&&value.length>30){
								return "<span title='"+value+"'>"+value.substring(0,30)+"</span>";
							}else 
								return value;
						}},
						{field:'property_id',title:'操作',width:'15%',formatter: function (value, rowData, rowIndex) {
							var html="<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"+
   		        		 "<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>"+
    		        		"<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>";
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
	 		openWinW('<%=basePath %>propertyconfig/gotoAdd.xhtml?optType=1',"添加属性","900px","470px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>propertyconfig/gotoEdit.xhtml?optType=2&id='+id,"修改属性","900px","470px",false,false);
	 	}
        function view(id)
        {
            openWinW('<%=basePath %>propertyconfig/gotoView.xhtml?id='+id,"信息详细","800px","470px",false,false);
        }

	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>propertyconfig/doDelete.xhtml?",
    				   	type:"post",
    				   	data:{id:id},
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

	</script>
  </head>
  
  <body>
  	<div class="content">
  	<h1 class="public-title"><b>属性查询</b></h1>
    <form id="form1" class="query-list" name="form1" method="post" action="" data-options="novalidate:true">
		<table class="table-query">
		<tr>
			<th>属性键</th>
			<td>
				<input class="easyui-textbox" type="text" name="property_key"/>
			</td>
			<th></th>
			<td id="userOrgCodeTd" align="left">
				
			</td>
			<th>属性类型</th>
			<td>
				<label><input type="radio" name="property_type"  value="1" /> 系统级</label>
				<label><input type="radio" name="property_type"  value="2" checked="checked"/> 项目级</label>
			</td>
		</tr>
		<tfoot>
			<td colspan="6">
					<button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>  
			</td>
		</tfoot>
	</table>
	</form>
	</div>
	
	<div class="content">
	<div class="result-list">
	    <h1 class="title"><b>属性列表</b></h1>
	        <div id="tb" class="operate">
				<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
	        </div>
		<table id="tt" class="easyui-datagrid"></table>
		</div>
		</div>
		
  </body>
</html>
