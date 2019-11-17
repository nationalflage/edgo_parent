<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
			<table  class="table-query">
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
				<th width="15%">登录名</th><td width="30%">
					<input class="easyui-textbox" type="text" required="true" name="user_account" value="<c:out value="${model.user_account }"/>" validType="length[0,10]"/>
				</td>
				<th width="15%">密码</th><td width="30%"><input class="easyui-textbox" type="password" id="user_pwd" name="user_pwd"  
					 validType="length[4,10]"	/></td>
				<td rowspan="4" valign="middle" align="center">
					<div class="hy-imageupload"  id="pic1"  imgid="aaa" edit="1" filename="<c:out value="${model.picture_name}"/>"  picture_name="picture_name"   vchr_entityid="<c:out value="${model.user_id }"/>"></div>
				</td>
				</tr>
				<tr>
				<th width="15%">姓名</th><td width="30%">
					<input name="user_name" class="easyui-textbox" type="text" required="true" value="<c:out value="${model.user_name }"/>" validType="length[0,10]"/></td>
				<th width="15%">性别</th>
				<td  width="30%">
					<input type="hidden" value="<c:out value="${model.user_sex }"/>"  id="sexHidden">
					<label><input type="radio" name="user_sex" value="M"/> 男</label>
					<label><input type="radio" name="user_sex" value="F"/> 女</label>
				</td>
				</tr>
				<tr>
				<th width="15%">移动电话</th><td  width="30%"><input name="mobile" class="easyui-textbox" type="text" value="<c:out value="${model.mobile }"/>" data-options="validType:'mobile'"/> </td>
				
				<th width="15%">电子邮件</th><td  width="30%"><input name="email" class="easyui-textbox" type="text"  data-options="validType:['email','length[1,30]']" value="<c:out value="${model.email }"/>"/> </td>
				
				</tr>
				<tr>
				<th width="15%">办公电话</th><td  width="30%"><input name="office_tel" class="easyui-textbox" type="text"  value="<c:out value="${model.office_tel }"/>" data-options="validType:'phonenumber'"/></td>
				<th width="15%">传真</th><td  width="30%">
				<input name="office_fax" class="easyui-textbox" type="text" value="<c:out value="${model.office_fax }"/>" data-options="validType:'cznumber'"/>
				</td>
				
				</tr>
				<tr>
				<th width="15%">是否有效</th>
				<td colspan="4">
					<input type="hidden" value="<c:out value="${model.validity }"/>"  id="validityHidden">
					<label><input type="radio" name="validity"  value="Y"/> 是</label>
					<label><input type="radio" name="validity"  value="N"/> 否</label>
				</td>
				</tr>
				<tr>
					<th>用户对应角色</th>
					<td colspan="4">
						<!-- 标签选择区 begin -->
			        	<div class="selectArea">
			             <!-- 左侧：已选标签 -->
			            <div class="selectArea-left">
			                <h4 class="headline">备选角色（双击选择）</h4>
			                <div class="page-content">
			                    
			                </div>
			            </div>
			            
			            <!-- 右侧：已选标签 -->
			            <div class="selectArea-right">
			                <h4 class="headline">
			                    	已选角色
			                    <!-- <p class="nav1">
			                    	<span class="active">全部</span>/<span>功能</span>/<span>数据</span>
			                    </p> 
								<img class="img-btn" src="<%=basePath%>images/icon-search2.png" alt="搜索按钮"/>
			                    -->
			                </h4>
			                <div class="page-content">
			                    
			                </div>
			                <!-- <div class="page-buttons">
			                    <img class="last-page" src="images/last-page.png" title="上一页"/>
			                    <img class="next-page" src="images/next-page.png" title="下一页"/>
			                </div> -->
			            </div>
			            
			           
			        </div>
			        <!-- 标签选择区 end-->
					</td>
				</tr>
			<extfield:extfield tableName="sys_right_user" dataId="${model.user_id}" pkName="user_id" operateType="${optType}"/>

			</table>
			<table  class="table-list"  style="width: 100%">
				<tr>
				<td colspan="4" align="center" >
				<center>
					<input type="button" class="btn btn-info" onclick="save();" value="保 存" />
                    <input type="button" class="btn"  onclick="closeLayer();" value="关 闭" />
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
		var layerTitle='添加用户';
		if($("#optType").val()=='2'){
			layerTitle='修改用户';
		}
		window.parent.parent.closeWin(layerTitle);
	}
	
	$(function(){
        var ck=$("#sexHidden").val();
        $("input[name='user_sex'][value='"+ck+"']").attr("checked",true);
        ck=$("#validityHidden").val();
        $("input[name='validity'][value='"+ck+"']").attr("checked",true);
        ck=$("#").val();
        if(ck=='1'){
            $("#user_pwd").attr("required","true");
		}

		var roleIds=$("#roleIds").val();
		var orgRoles=$("#orgRoles").val();
		var orgRoleJson=strToJson(orgRoles);
		var roleId;
		var strs= new Array();//定义一数组
		strs=roleIds.split(","); //字符分割
		//待选
		for(var i=0; i<orgRoleJson.length; i++)
		{
			var roleName = orgRoleJson[i].name;
			var roleId= orgRoleJson[i].id;
			var index=roleIds.indexOf(roleId);
			if(index<0){
				var insertHtml2='<span class="label1">'+roleName+'<button class="btn-close" id="'+roleId+'"></button></span>'
				$('.selectArea-left').find('.page-content').append(insertHtml2);
			}
		} 
		//已对应
		for (i=0;i<strs.length ;i++ )
		{
			roleId=strs[i];
			var roleName = getRoleName(roleId,orgRoleJson);
			if(roleName!=''){
				var insertHtml1='<span class="label1">'+roleName+'<button class="btn-close" id="'+roleId+'"></button></span>'
				$('.selectArea-right').find('.page-content').append(insertHtml1);
			}
		}
		

		// 双击待选区的标签时，从备选区移除
		$('.selectArea-left').on('dblclick','.label1',function() {
			var insertText1 = $(this).text();
			var rid=$(this).find('.btn-close').attr('id');
			var rIds=$("#roleIds").val();
			$("#roleIds").val(rIds+","+rid);
			var insertHtml1='<span class="label1">'+insertText1+'<button class="btn-close" id="'+rid+'"></button></span>'
			$('.selectArea-right').find('.page-content').append(insertHtml1);
			$(this).remove();
		});
		
		//page-content
		
		// 点击叉号，移除已选区的该标签
		$('.selectArea-right').on('click','.btn-close',function() {
			var insertText2 = $(this).parent('.label1').text();
			var rid=$(this).attr('id');
			var insertHtml2='<span class="label1">'+insertText2+'<button class="btn-close" id="'+rid+'"></button></span>'
			$('.selectArea-left').find('.page-content').append(insertHtml2);
			$(this).parent('.label1').remove();
			
			var rIds=$("#roleIds").val();
			$("#roleIds").val(rIds.replace(','+rid,'').replace(rid,''));
		});
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
	
	//保存数据
	function save()
	{
		if(!$("#form1").form('validate')){
			return;
		}

		saveData();
		
	}

	function saveData(){
		var url="<%=basePath%>user/doAdd.xhtml?optType=1";
		if($("#optType").val()=='2'){
			url="<%=basePath%>user/doEdit.xhtml?optType=2";
		}
		$.ajax({
			url:url,
			data:$("#form1").serialize(),
			type:"post",
			success:function(msg)
			{
                if("notunique"==msg){
                    $.hyjx.alert("提示信息","用户登录名已存在，不能重复添加","error", function(){});
                }else if("success" == msg){
					$.hyjx.alert("提示信息","保存成功！","info", function(){
						parent.rightFrame.treeFrame.$('#tt').datagrid("reload");
		   				closeLayer();
		   			});
				}else if("noadmin"==msg)
				{
					$.hyjx.alert("提示信息","不能使用admin作为登录名","error", function(){});
				}
                else{
					$.hyjx.alert("提示信息","保存失败，请重试！","error", function(){});
				}
			},
			error:function(msg){}			
		});
	}
	function strToJson(str){
		return eval('('+str+')');
	}
</script>