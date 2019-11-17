<%@ page language="java" import="com.hyjx.framework.service.UserCenterService" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>信息列表</title>
	  <meta charset="UTF-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
            var ad=$("#isAdminHidden").val();
            var orgCode=$("#org_code").val();
            if(ad=='1'){
                $("#userOrgCodeTh").html("创建单位");
                $("#bmtree").orgtree({
                    rootid:orgCode
				});
			}

			doQuery();
		});
		function doQuery(){
            if(!$("#form1").form('validate')){
                return;
            }
			if($("#isAdminHidden").val()=='1'){
                var currentOrg=$('#bmtree').combotree('getValues');
                $('#org_code').val(currentOrg);
			}
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>role/queryList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'role_name',title:'角色名称',width:'19%',sortable:true},
						{field:'role_type',title:'角色类型',width:'14%',sortable:true,formatter:function(value, rowData, rowIndex){
							if(value=="1")
								return "功能";
							else if(value=="2")
								return "数据";
						}},
						{field:'org_name',title:'角色创建单位',width:'25%'},
						{field:'create_time',title:'创建时间',width:'15%',sortable:true},
						{field:'validity',title:'是否有效',width:'10%',sortable:true,formatter:function(value, rowData, rowIndex){
							if(value=="Y")
								return "是";
							else if(value=="N")
								return "否";
						}},
					{field:'role_id',title:'操作',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 var html = "";
	   		        		 if(rowData.editAble != "1"){
	   		        			html= "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>";
	   		        		 }else{
	   		        			html="<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"+
	    		        		 "<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>"+
	     		        		"<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>"+
                                    "<img title='对应用户设置' class='btn-img' src='<%=basePath %>images/setting.png' onclick='roleUser(\""+value+"\")' />";
	   		        		 }
	   		        		 return html;
    		        	}
    		        }
				]]
			});
		}
	 	function clearAll(){
	 		$("#form1").form("clear");

            $("#userIsAdmin").val($("#isAdminHidden").val());
	 	}
		function add()
	 	{
	 		openWinW('<%=basePath %>role/gotoAdd.xhtml?optType=1',"添加角色","800px","550px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>role/gotoEdit.xhtml?optType=2&id='+id,"修改角色","800px","550px",false,false);
	 	}
        function roleUser(id)
        {
            openWinW('<%=basePath %>role/gotoRoleUser.xhtml?optType=2&id='+id,"对应用户设置","700px","530px",false,false);
        }
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>role/gotoDelete.xhtml?ids="+id,
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
	 		openWinW('<%=basePath %>role/gotoView.xhtml?id='+id,"信息详细","800px","450px",false,false);
	 	}
	</script>
  </head>
  
  <body>
  	<div class="content">
  	<h1 class="public-title"><b>角色查询</b></h1>
	<input type="hidden" value="<c:out value="<%= UserCenterService.getCurrentUserInfo().getUserIsAdmin() %>"/>"  id="isAdminHidden">

    <form id="form1" class="query-list" name="form1" method="post" action="" data-options="novalidate:true">
	    <input type="hidden" id="userIsAdmin" name="userIsAdmin" value="<%= UserCenterService.getCurrentUserInfo().getUserIsAdmin() %>" >

		<table class="table-query">
		<tr>
			<th>角色名称</th>
			<td>
				<input class="easyui-textbox" type="text" name="role_name" data-options="validType:['length[0,10]']"/>
			</td>
			<th id="userOrgCodeTh"></th>
			<td id="userOrgCodeTd" align="left">
				<input type="hidden" id="org_code" name="org_code" value="<c:out value="<%=UserCenterService.getCurrentUserInfo().getOrg_code() %>"/>">
			       	 <input id="bmtree" style="width:200px;display:none" />
			</td>
			<th>是否有效</th>
			<td>
				<label><input type="radio" name="validity"  value="Y"/> 是</label>
				<label><input type="radio" name="validity" value="N"/> 否</label>
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
	    <h1 class="title"><b>角色列表</b></h1>
	        <div id="tb" class="operate">
				<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
	        </div>
		<table id="tt" class="easyui-datagrid"></table>
		</div>
		</div>
  </body>
</html>
