<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>
<body>
<div class="content" style="margin: 0">
	<h1 class="public-title"><b>修改菜单信息</b></h1>
<form id="form1" class="gray-bg" method="post" action="" data-options="novalidate:true" >
	<input type="hidden" name="menu_code_full" value="<c:out value="${model.menu_code_full }"/>">
	<input type="hidden" name="levelId" value="<c:out value="${model.levelId }"/>"/>
	<input type="hidden" name="menu_parent_code" value="<c:out value="${model.menu_parent_code }"/>"/>
	<input type="hidden" name="is_leaf_node" value="<c:out value="${model.is_leaf_node }"/>"/>

	<table  class="table-query">
		<tr>
			<th>菜单编码</th>
			<td>
				<input type="text"  readonly="readonly" value="<c:out value="${model.menu_code }"/>" id="menu_code" name="menu_code" size="40" class="easyui-textbox"  required="true" data-options="validType:['number','length[1,20]']"/>
			</td>
			<!-- 			<th>菜单全编码</th> -->
			<!-- 			<td> -->
			<%-- 				<input type="text" value="<c:out value="${model.menu_code_full }"/>" id="menu_code_full" name="menu_code_full" size="40" class="easyui-textbox" required="true" validType="length[0,400]"/> --%>
			<!-- 			</td> -->
			<th>菜单名称</th>
			<td>
				<input type="text" value="<c:out value="${model.menu_name }"/>" id="menu_name" name="menu_name" size="40" class="easyui-textbox" required="true"   data-options="validType:['unnormal','length[1,10]']"/>
			</td>
		</tr>
		<tr>
			<th>菜单描述</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.menu_desc }"/>" style="width:80%;"  id="menu_desc" name="menu_desc"   class="easyui-textbox" data-options="validType:['unnormal','length[1,200]']"/>
			</td>
		</tr>
		<tr>
			<th>功能入口</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.func_entra }"/>" style="width:80%;" id="func_entra" name="func_entra"  class="easyui-textbox"   data-options="validType:['unnormal','length[1,100]']"/>
			</td> 
		</tr>
		<tr>
			<th>顺序号</th>
			<td>
				<input type="text" value="<c:out value="${model.order_no }"/>" id="order_no" name="order_no" size="40" class="easyui-numberbox" required="true" data-options="validType:['integer','length[1,5]']"/>
			</td>

			<th>图标名称</th>
			<td>
				<input type="text" value="<c:out value="${model.iconname }"/>" name="iconname" id="iconname" class="easyui-textbox"  data-options="validType:['integer','length[1,20]']"/>
			</td>

		</tr>
		<tr>
			<th>是否有效</th>
			<td>
				<input type="radio" name="validity" <c:if test="${model.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是
				<input type="radio" name="validity" <c:if test="${model.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否

			</td>
			<th></th>
			<td>

			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
				<div class="buttons">
					<button class="btn btn-info" onclick="save();" type="button">保 存</button>
					<c:if test="${model.is_leaf_node=='Y'}">
						<button class="btn btn-info" onclick="menuright();" type="button">操作权限</button>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>

<script>
    function save(){

        if(!$("#form1").form('validate')){
            return;
        }
        var data = $("#form1").serialize();
        $.ajax({
            type: "POST",
            url: "<%=basePath %>menu/doEdit.xhtml",
            data: data,
            success: function(msg){
                if("success" == msg){
                    $.hyjx.alert("提示信息","信息修改成功！","info", function(){
                        if(document.all){//IE
                            parent.relaod();
                            window.parent.closeWin('信息修改');
                        }else{
                        	parent.$('#hy-menutree').tree('reload');
                            window.parent.closeWin('信息修改');
                        }
                    });
                }else{
                    $.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
                }
            }
        });
    }

    function menuright(){

        openWinW('<%=basePath%>menu/gotoMenuFunc.xhtml?menu_code='+$("#menu_code").val(), '操作权限', '900px', '600px', true, false);

    }
</script>