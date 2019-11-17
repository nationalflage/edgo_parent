<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
<form id="form1" class="query-list" method="post" action="">
    <input type="hidden" value="${model.id }"  id="id" name="id">
	<table  class="table-query">
        <tbody>
            <tr>
                <th>姓名</th>
                <td>
                    <input name="name" id="name" class="easyui-textbox" value="${model.name}" type="text" data-options="validType:length[0,50]"/>
                </td>
                <th>性别</th>
                <td>
                    <c:forEach items="${sexList}" var="sex">
                        <span class="hy-radio" id="sex" name="sex" options="${sex.name}:${sex.code}" checkoptions="${model.sex}"></span>
                    </c:forEach>
                </td>
            </tr>
			<tr>
                <th>年龄</th>
                <td>
                    <input name="age" id="age" class="easyui-textbox" value="${model.age }" data-options="validType:['number','length[0,3]']"/>
                </td>
                <th>出生日期</th>
                <td>
                    <input name="birthday" class="easyui-datebox" value="${model.birthday}" type="text" style="width:110px;" />
                </td>
			</tr>
			<tr>
                <th>出生省</th>
                <td>
                    <select name="csdProvince" class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdProvince }" id="csdProvince" style="width: 140px;" >
                    </select>
                </td>
                <th>出生市</th>
                <td>
                    <select name="csdCity" class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdCity }" parentcode="${model.csdProvince }" parentobject="csdProvince" id="csdCity" style="width: 140px;" >
                    </select>
                </td>
            </tr>
            <tr>
                <th>出生县</th>
                <td>
                    <select name="csdArea" class="easyui-combobox hy-codeselect" name="area" codetable="district" text="${model.csdArea }" parentcode="${model.csdCity }" parentobject="csdCity" id="csdArea" style="width: 140px;" >
                    </select>
                </td>
                <th>具体门牌号</th>
                <td>
                    <input type="text" name="csdAddress" id="csdAddress" value="${model.csdAddress }"
                           class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
			</tr>
			<tr>
                <th>部门名称</th>
                <td>
                    <input name="deptName" id="tagId8" class="easyui-combotree" value="${model.deptName }"
                           data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'"/>
                </td>
                <th>爱好</th>
                <td>
                    <c:forEach items="${ahList}" var="ah">
                        <span id="hobby" class="hy-checkbox" options="${ah.name}:${ah.code}" checkoptions="${model.hobby}" name="hobby"></span>
                    </c:forEach>
                </td>
			</tr>
			<tr>
                <th>创建人姓名</th>
                <td>
                    <input type="text" name="createdName" id="createdName" value="${model.createdName }"  readonly="readonly"
                           class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
                <th>创建人部门名称</th>
                <td>
                    <input type="text" name="createdDeptName" id="createdDeptName" value="${model.createdDeptName }"  readonly="readonly"
                           class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
			</tr>
			<tr>
                <th>擅长领域</th>
                <td>
                    <select name="scly" class="easyui-combobox hy-codeselect" text="${model.scly}" codetable="liulm_scly" id="scly" style="width: 140px;" >
                    </select>
                </td>
                <input type="hidden" value="${model.modifiedTime }"  id="modifiedTime" name="modifiedTime">
        	</tr>
        </tbody>
		<tfoot>
            <tr height="100">
                <td colspan="4">
                    <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                    <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息修改')"/>
                    
                </td>
            </tr>
        </tfoot>
	</table>
</form>
</body>
</html>

<script type="text/javascript">
	$(function(){

	});
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		alert("数据："+data);
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>liulmnew/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
		   	    alert(msg);
		    	if("success" == msg){
					$.messager.alert("提示信息","信息修改成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
				}else{
					$.messager.alert("提示信息","信息修改失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	</script>