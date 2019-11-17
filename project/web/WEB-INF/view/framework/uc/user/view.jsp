<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/ExtFieldTag.tld" prefix="extfield" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <title>编辑</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
    </head>
<body>
	<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
		<input type="hidden" value="<c:out value="${model.pwdOld }"/>"  id="pwdOld" name="pwdOld">
		<input type="hidden" value="<c:out value="${optType }"/>"  id="optType" name="optType">
		<input type="hidden" name="user_id" id="user_id" value="<c:out value="${model.user_id}"/>">
		<input type="hidden" name="roleIds" id="roleIds" value="<c:out value="${model.roleIds}"/>">
		<input type="hidden" name="org_code" id="org_code" value="<c:out value="${model.org_code}"/>">
		<input type="hidden" name="depart_code" id="depart_code" value="<c:out value="${model.depart_code}"/>">
		<input type="hidden" name="picture_name" id="picture_name" value="<c:out value="${model.picture_name}"/>">
		<input type="hidden" value="<c:out value="${model.orgRoles }"/>"  id="orgRoles" name="orgRoles">
		
			<table class="table-query">
				<tr>
					<th width="15%">单位</th>
					<td width="30%">
						<c:out value="${model.orgName }"/>
					</td>
					<th width="15%">部门</th>
					<td  width="30%">
						<c:out value="${model.departName }"/>
					</td>
					<td></td>
				</tr>
				<tr>
					<th >登录名</th>
					<td colspan="3">
						<c:out value="${model.user_account }"/> 
					</td>
				
				<td rowspan="4" valign="middle" align="center">
					<div id="aaa" ></div>
                	<div style="display:none;" class="previewImage" id="pic1" imgid="aaa" width="120" height="100" 
                		 filename="<%=basePath %>/upload/getPreview.xhtml?fileName=<c:out value="${model.picture_name}"/>" 
                	></div>
				</td>
				</tr>
				<tr>
				<th >姓名</th>
				<td >
					<c:out value="${model.user_name }"/></td>
				<th >性别<input type="hidden" id="user_sexHidden" value="<c:out value="${model.user_sex}" />"></th>
				<td  id="usersextd">


				</td>
				</tr>
				<tr>
					<th>移动电话</th>
					<td>
						<c:out value="${model.mobile }"/> </td>
					
					<th>电子邮件</th>
					<td>
					<c:out value="${model.email }"/>  </td>
					
				</tr>
				<tr>
					<th>办公电话</th>
					<td>
						<c:out value="${model.office_tel }"/> </td>
					<th>传真</th><td>
						<c:out value="${model.office_fax }"/> 
					</td>
				</tr>
				<tr>
					<th >是否有效
						<input type="hidden" value="<c:out value="${model.validity }"/>"  id="validityHidden">
					</th>
					<td colspan="4" id="validitytd">

					</td>
				</tr>
				<tr>
					<th>创建时间</th>
					<td>
						<fmt:formatDate value="${model.create_time}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<th>更新时间</th><td>
					<fmt:formatDate value="${model.update_time}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				</tr>
				<extfield:extfield tableName="sys_right_user" dataId="${model.user_id}" pkName="user_id" operateType="3" />
				<tr>
					<th>用户对应角色</th>
					<td colspan="4">
			        	<div class="selectArea">
			            <div class="selectArea-left" style="width:97%;height: 180px;">
			                <div class="page-content">
			                    
			                </div>
			            </div>
			        </div>
			        </td>
				</tr>
				<tr>
				<th >功能权限</th>
					<td colspan="4">
						<ul class="hy-menutree" checkedvalue="<c:out value="${model.menuCodes }"/>" 
							showOperate="1" checkbox="1" isreadonly="1" ></ul>
					</td>
				</tr>
				<tr>
					<th >数据权限</th>
					<td colspan="4" style="border-top-style: solid;border-top-width: 1px;margin-top: 5px;border-top-color: gray;">
							<ul id="datatree" class="hy-orgtree" checkedvalue="<c:out value="${model.orgCodes }"/>" 
								rootid="<c:out value="${model.org_code }"/>" isreadonly="1" multiselect="1"></ul>
					</td>
				</tr>
			</table>
			
			<table  class="table-list"  style="width: 100%">
				<tr>
				<td colspan="4" align="center" >
				<center>
                    <button class="btn"  onclick="closeLayer();" type="button">关 闭</button>
                 </center>
				</td>
				</tr>
			</table>
			
		</form>
</body>
</html>
<script type="text/javascript">
	function closeLayer()
	{
		window.parent.parent.closeWin('查看详细');
	}
	
	var changeFlag=0;
	
	$(function(){
		var roleIds=$("#roleIds").val();
		
		var orgRoles=$("#orgRoles").val();
		var orgRoleJson=strToJson(orgRoles);
		var roleId;
		var strs= new Array();//定义一数组
		strs=roleIds.split(","); //字符分割
		
		//已对应
		for (i=0;i<strs.length ;i++ )
		{
			roleId=strs[i];
			var roleName = getRoleName(roleId,orgRoleJson);
			if(roleName!=''){
				var insertHtml1='<span class="label1">'+roleName+'<button class="btn-close" id="'+roleId+'"></button></span>'
				$('.selectArea-left').find('.page-content').append(insertHtml1);
			}
		}

        var vv=$("#validityHidden").val();
        if(vv=='Y'){
            $("#validitytd").html('是');
        }else{
            $("#validitytd").html('否');
        }

        vv=$("#user_sexHidden").val();
        if(vv=='M'){
            $("#usersextd").html('男');
        }else if(vv=='F'){
            $("#usersextd").html('女');
        }
		
	});
	
	function getRoleName(id,roleJsonArray){
		for(var i=0; i<roleJsonArray.length; i++)
		{
			if(id==roleJsonArray[i].id){
				return roleJsonArray[i].name;
			}
		} 
		return "";
	}
	
	function strToJson(str){
		return eval('('+str+')');
	}
	
</script>