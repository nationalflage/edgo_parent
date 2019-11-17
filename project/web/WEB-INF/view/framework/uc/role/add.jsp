<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hyjx.framework.service.UserCenterService" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>添加编辑</title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function save(){
		var menuCodes = getMenuChecked();
		var orgCodes = getOrgChecked();

        var role_name=$("#role_name").val();
        if($.trim(role_name)==''){
            $.hyjx.alert("提示信息","角色名称不能为空格");
            return;
        }
		
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		
		var url="<%=basePath %>role/doAdd.xhtml?menuCodes="+menuCodes+"&orgCodes="+orgCodes;
		if($("#optType").val()=='2'){
			url="<%=basePath %>role/doEdit.xhtml?menuCodes="+menuCodes+"&orgCodes="+orgCodes;
		}
		
		$.ajax({
			type: "POST",
		   	url: url,
		   	data: data,
		   	success: function(msg){
			    if("notunique"==msg){
                    $.hyjx.alert("提示信息","角色名称已存在，不能重复添加","error", function(){});
				}else if("success" == msg){
					$.hyjx.alert("提示信息","角色保存成功！","info", function(){
						parent.rightFrame.$('#tt').datagrid("reload");
		   				closeLayer();
		   			});
				}else{
					$.hyjx.alert("提示信息","角色保存失败，请重试！","error", function(){});
				}
		   }
		});
	}

	function getMenuChecked(){
		var nodes = $('.hy-menutree').tree('getChecked');
		var s = "";
		var operateIds="";
		var sysIds="";
		for(var i=0; i<nodes.length; i++){
			if(nodes[i].id.indexOf("operate")==0)
				operateIds+="3"+nodes[i].code+",";
			else if(nodes[i].parent_id==""||nodes[i].parent_id==null)
				sysIds+="1"+nodes[i].id+",";
			else
			s += "2"+nodes[i].code+",";
		}
		return s+operateIds+sysIds;
		
	/* 	var values  = $('.hy-menutree').menutree('getCheckedValues');
		return values ; */
	}
	
	function getOrgChecked(){
		var nodes = $('#datatree').tree('getChecked');
		var s = '';
		for(var i=0; i<nodes.length; i++){
			if (s != '') s += ',';
			s += nodes[i].id;
		}
		return s;
	}

	$(function() {
        var ck=$("#role_typeHidden").val();
        $("input[name='role_type'][value='"+ck+"']").attr("checked",true);

        ck=$("#validityHidden").val();
        $("input[name='validity'][value='"+ck+"']").attr("checked",true);

		$(".hy-menutree").menutree({
			checkedvalue:"<c:out value="${model.menuCodes }"/>",
			showOperate:"1",
			checkbox:"1",
			isreadonly:"0",
			showAll:"0",
			applyRight:"0"
		});
		
		switchType();
		$("input[name=role_type]").click(function() {
			switchType();
		});
	});
	function switchType() {
		switch ($("input[name=role_type]:checked").attr("id")) {
		case "role_type1":
			$("#role_type_org").hide();
			$("#role_type_menu").show();
			break;
		case "role_type2":
			$("#role_type_menu").hide();
			$("#role_type_org").show();
			break;
		default:
			break;
		}
	}
	function closeLayer(){
		var layerTitle='添加角色';
		if($("#optType").val()=='2'){
			layerTitle='修改角色';
		}
		window.parent.closeWin(layerTitle);
	}
	
	</script>
</head>
<body style="background:#fff">
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<input type="hidden" value="<c:out value="${optType }"/>"  id="optType" name="optType">
	<input type="hidden" value="<c:out value="${model.role_id }"/>"  id="role_id" name="role_id">
	<input type="hidden" value="<c:out value="${model.org_code }"/>"  id="org_code" name="org_code" >
	<input type="hidden" value="<c:out value="${model.depart_code }"/>"  id="depart_code" name="depart_code">
	<input type="hidden" value="<c:out value="${model.create_user_id }"/>"  id="create_user_id" name="create_user_id">
	<input type="hidden" value="<c:out value="${model.create_time }"/>"  id="create_time" name="create_time">
	
	<table  class="table-query">
		<tr>
			<th width="20%">角色名称</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.role_name }"/>" name="role_name" id="role_name" 
					class="easyui-textbox" required="true" validType="length[0,20]" style="width:560px;"/>
			</td>
		</tr>
		<tr>
			<th>角色类型</th>
			<td colspan="3">
				<input type="hidden" value="<c:out value="${model.role_type }"/>"  id="role_typeHidden">
				<label><input type="radio" id="role_type1" name="role_type" value="1" /> 功能</label>
				<label><input type="radio" id="role_type2" name="role_type" value="2" /> 数据</label>
			</td>
		</tr>
		<tr>
			<th >角色描述</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.role_desc }"/>" name="role_desc" id="role_desc" class="easyui-textbox" 
					validType="length[0,200]" style="width:560px;height: 90px;" data-options="multiline:true" defaultHtmlEscape="false"/>
			</td>
		</tr>
		<tr>
			<th>是否有效</th>
			<td colspan="3">
				<input type="hidden" value="<c:out value="${model.validity }"/>"  id="validityHidden">
				<label><input type="radio" name="validity" value="Y"/> 是</label>
					<label><input type="radio" name="validity" value="N"/> 否</label>
			</td>
		</tr>
		<tr id="role_type_menu">
			<th>功能权限:</th>
			<td colspan="3" >
				<ul class="hy-menutree" ></ul>
			</td>
		</tr>
		<tr id="role_type_org">
			<th>数据权限:</th>
			<td colspan="3" >
				<ul id="datatree" class="hy-orgtree" multiselect="1" 
					checkedvalue="<c:out value="${model.orgCodes }"/>" rootid="<%=UserCenterService.getCurrentUserInfo().getDataOrgCode() %>"></ul>
			</td>
		</tr>
		
			<td colspan="4" style="text-align:center" valign="bottom">
				<div class="buttons">
                       <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                       <button class="btn"  onclick="closeLayer();" type="button">关 闭</button>
                </div>	
			</td>
		</tr>
	</table>
</form>
</body>
</html>