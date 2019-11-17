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
<title></title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	
	$(function() {
        var ck=$("#role_typeHidden").val();
        if(ck=='1'){
            $("#functd").html('功能');
		}else{
            $("#functd").html('数据');
		}

        ck=$("#validityHidden").val();
        if(ck=='Y'){
            $("#validitytd").html('是');
        }else{
            $("#validitytd").html('否');
        }

		$(".hy-menutree").menutree({
			checkedvalue:"<c:out value="${model.menuCodes }"/>",
			showOperate:"1",
			checkbox:"1",
			isreadonly:"1"
		});
		
		if($("#role_type").val()=='1'){
			$("#role_type_org").hide();
			$("#role_type_menu").show();
		}else{
			$("#role_type_menu").hide();
			$("#role_type_org").show();
		}
	});
	
	function closeLayer(){
		var layerTitle='信息详细';
		window.parent.closeWin(layerTitle);
	}
	</script>
</head>
<body style="background:#fff">
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<input type="hidden" value="<c:out value="${model.role_id }"/>"  id="role_id" name="role_id">
	<input type="hidden" value="<c:out value="${model.org_code }"/>"  id="org_code" name="org_code" >
	<input type="hidden" value="<c:out value="${model.depart_code }"/>"  id="depart_code" name="depart_code">
	<input type="hidden" value="<c:out value="${model.create_user_id }"/>"  id="create_user_id" name="create_user_id">
	<input type="hidden" value="<c:out value="${model.create_time }"/>"  id="create_time" name="create_time">
	<input type="hidden" value="<c:out value="${model.role_type }"/>"  id="role_type" name="role_type">
	
	<table  class="table-query">
		<tr>
			<th width="15%">角色名称</th>
			<td colspan="3">
				<c:out value="${model.role_name }"/>	
			</td>
		</tr>
		<tr>
			<th>角色类型
				<input type="hidden" value="<c:out value="${model.role_type }"/>"  id="role_typeHidden">
			</th>
			<td colspan="3" id="functd">

			</td>
		</tr>
		<tr>
			<th >角色描述</th>
			<td colspan="3">
				<c:out value="${model.role_desc }"/>
			</td>
		</tr>
		<tr>
			<th>是否有效
				<input type="hidden" value="<c:out value="${model.validity }"/>"  id="validityHidden">
			</th>
			<td colspan="3" id="validitytd">
			</td>
		</tr>
		<tr id="role_type_menu">
			<th>功能权限:</th>
			<td colspan="3" >
				<ul class="hy-menutree"  ></ul>
			</td>
		</tr>
		<tr id="role_type_org">
			<th>数据权限:</th>
			<td colspan="3" >
				<div class="easyui-panel" style="padding:5px" >
					<ul id="datatree" class="hy-orgtree" multiselect="1" 
						checkedvalue="<c:out value="${model.orgCodes }"/>" 
						rootid="<c:out value="${model.org_code }"/>"
						isreadonly="1" ></ul>
				</div>
			</td>
		</tr>
			<td colspan="4" style="text-align:center" valign="bottom">
				<div class="buttons">
                       <button class="btn"  onclick="closeLayer();" type="button">关 闭</button>
                </div>	
			</td>
		</tr>
	</table>
</form>
</body>
</html>