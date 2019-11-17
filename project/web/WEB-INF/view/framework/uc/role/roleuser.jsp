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
    <title></title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/component/ztree/css/zTreeStyle/zTreeStyle.css">
	<script type="text/javascript" src="<%=basePath %>js/component/ztree/jquery.ztree.all.min.js"></script>

	<style>
		.add-remove{width:100%;background-color: #fff;border:1px solid #ebebeb;border-radius: 5px;overflow: hidden;box-shadow: 0 0 10px #ddd inset;}
		.add-remove .ar-title{height:40px;line-height:40px;background-color: #f0f0f0;font-size:16px;color:#333;letter-spacing:1px;font-weight:normal;padding: 0 12px;margin:0;}
		.add-remove .ar-con{height:260px;font-size: 13px;color: #333;padding: 10px;overflow: auto;}
		.add-remove .ar-con label input{vertical-align: -2px;}
		.add-remove .ar-p{margin:5px 0;}
	</style>
</head>
<body>

<!-- 角色对应关系 begin -->
<div class="content" style="margin:0;">
	<input type="hidden" id="roleId" value="<c:out value="${model.role_id }"/>">
	<h1 class="public-title"><b>角色与用户对应关系</b></h1>
	<div class="detail-list" style="padding: 8px 15px;">
		<table class="detail-list1">
			<thead>
			<tr>
				<td width="40%"></td>
				<td width="20%"></td>
				<td width="40%"></td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">角色名称：<strong><c:out value="${model.role_name }"/></strong></td>
				<td >角色类型：<strong> <c:out value="${model.roleTypeName }"/></strong></td>
			</tr>
			<tr>
				<td colspan="3">创建单位：<strong><c:out value="${model.org_name }"/></strong>
				</td>

			</tr>
			<tr>
				<td>
					<input type="hidden" id="userInfos" value="<c:out value="${userInfos }"/>">
					<!-- 添加/移除 begin -->
					<div class="add-remove">
						<h2 class="ar-title">已关联用户</h2>
						<div class="ar-con" id="selectedUsers">
						</div>
					</div>
					<!-- 添加/移除 end -->
				</td>
				<td align="center">
					<img src="<%=basePath%>images/user-add.png" alt="添加按钮" style="cursor:pointer;" onclick="add()"/><br/>
					<img src="<%=basePath%>images/user-remove.png" alt="移除按钮" style="cursor:pointer;margin-top:30px;" onclick="remove()"/>
				</td>
				<td>
					<!-- 添加/移除 begin -->
					<div class="add-remove">
						<h2 class="ar-title">所有用户</h2>
						<div class="ar-con">
							<ul id='allUsers' class="ztree hy-usertree" multiselect="1" departtype="3">

							</ul>
						</div>
					</div>
					<!-- 添加/移除 end -->
				</td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" align="center" >
						<button class="btn btn-info" onclick="save();" style="margin-top: 8px;margin-bottom: -3px">保 存</button>
						<button class="btn"  onclick="closewin();" style="margin-top: 8px;margin-bottom: -3px">关 闭</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<!-- 角色对应关系 end -->
</body>
</html>
<script type="text/javascript">
    $(function () {
        var userInfos='['+$("#userInfos").val()+']';
        var userInfosJson=eval('('+userInfos+')');
        for(var i=0; i<userInfosJson.length; i++) {
        	//if(userInfosJson[i]==undefined) continue;
            var userName = userInfosJson[i].name;
            var userId=userInfosJson[i].id;

            var insertHtml='<p class="ar-p" id="'+userId+'"><label><input type="checkbox"/>'+userName+'</label></p>';
            $('#selectedUsers').append(insertHtml);
        }
    });
	function closewin()
	{
		window.parent.closeWin('对应用户设置');
	}
	function add() {
        var userInfos=$("#userInfos").val();
        var treeObj=$.fn.zTree.getZTreeObj("allUsers");
		var nodes=treeObj.getCheckedNodes(true); //
		if(nodes=="")
		{
			 $.hyjx.alert("提示","请选择用户，并在选择的用户前打勾！","info", function(){ });
			 return;
		}
        for(var i=0;i<nodes.length;i++){
            var name=nodes[i].name;
            var id=nodes[i].id;
            var pId=nodes[i].pId;

            if(userInfos.indexOf(id) > 0 ){
            }else{
                if(userInfos.length==0){
                    userInfos="{id:'"+id+"',name:'"+name+"',pId:'"+pId+"'}";
				}else {
                    userInfos+=",{id:'"+id+"',name:'"+name+"',pId:'"+pId+"'}";
				}
			}
			var user=$("#"+id).length;
			if(user==0){
                var insertHtml='<p class="ar-p" id="'+id+'"><label><input type="checkbox"/>'+name+'</label></p>';
                $('#selectedUsers').append(insertHtml);
			}
        }
        $("#userInfos").val(userInfos);
    }
    function remove() {
        $('#selectedUsers').find("p").each(function (i) {
            var userObj=$(this);
            var cc=$(this).find("label").find("input").prop("checked");
            if(cc){
                $(this).remove();
            }
        });
    }

    function save() {
	    var roleId=$("#roleId").val();
	    var ids="";
        $('#selectedUsers').find("p").each(function (i) {
            var id=$(this).attr("id");
			ids+=id+",";
        });

        $.ajax({
            url: "<%=basePath %>role/saveRoleUser.xhtml",
			data:{id:roleId,ids:ids},
			type:"POST",
			dataType:"text",
            success: function(msg){
                if("success" == msg) {
                    $.hyjx.alert("提示","设置成功！","info", function(){ closewin();});
                }else {
                    $.hyjx.alert("提示","保存失败，请检查！","info", function(){ });
                }
            }
        });
    }


</script>