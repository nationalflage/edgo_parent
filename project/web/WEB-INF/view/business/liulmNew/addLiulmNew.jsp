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
    <table  class="table-query">
        <tbody>
			<tr>
				<th>姓名</th>
				<td>
					<input name="name" id="nn" class="easyui-textbox"  type="text" data-options="required:true,validType:length[0,50]"/>
				</td>
				<th>性别</th>
				<td>
					<c:forEach items="${sexList}" var="sex">
						<label><input name="sex" type="radio"  id="sex" value="<c:out value='${sex.code}'/>"	/>
							<c:out value='${sex.name}'/></label>
					</c:forEach>
				</td>
			</tr>
            <tr>
                <th>年龄</th>
                <td>
					<input name="age" class="easyui-textbox" data-options="validType:['number','length[0,3]']"/>
				</td>
				<th>出生日期</th>
				<td>
					<input name="birthday" class="easyui-datebox"  type="text" style="width:110px;" />
				</td>
			</tr>
            <tr>
                <th>出生省</th>
				<td>
					<select name="csdProvince" class="easyui-combobox hy-codeselect" codetable="district" name="province" id="province" style="width: 140px;" >
					</select>
				</td>
				<th>出生市</th>
				<td>
					<select name="csdCity" class="easyui-combobox hy-codeselect" name="city" codetable="district" parentobject="province" id="city" style="width: 140px;" >
					</select>
				</td>
			</tr>
            <tr>
                <th>出生县</th>
                <td>
					<select name="csdArea" class="easyui-combobox hy-codeselect" name="area" codetable="district" parentobject="city" id="csdArea" style="width: 140px;" >
					</select>
				</td>
                <th>具体门牌号</th>
                <td>
					<input type="text" name="csdAddress" id="csdAddress"
						   class="easyui-textbox"  data-options="validType:length[0,50]"/>
				</td>
			</tr>
            <tr>
                <th>部门名称</th>
                <td>
					<input name="deptName" id="tagId8" class="easyui-combotree" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'"/>
				</td>
                <th>爱好</th>
                <td>
					<c:forEach items="${ahList}" var="ah">
						<input name="hobby" type="checkbox"  id="hobby" value="<c:out value='${ah.code}'/>"	/>
						<c:out value='${ah.name}'/>
					</c:forEach>
				</td>
			</tr>
            <tr>
                <th>创建人姓名</th>
                <td>
					<input type="hidden" value="${model.createdId }"  id="createdId" name="createdId">
					<input type="text" name="createdName" id="createdName" value="${model.createdName }"  readonly="readonly"
						   class="easyui-textbox"  data-options="validType:length[0,50]"/>
				</td>
                <th>创建人部门名称</th>
                <td>
					<input type="hidden" value="${model.createdDeptId }"  id="createdDeptId" name="createdDeptId">
					<input type="text" name="createdDeptName" id="createdDeptName" value="${model.createdDeptName }"  readonly="readonly"
						   class="easyui-textbox"  data-options="validType:length[0,50]"/>
				</td>
			</tr>
            <tr>
                <th>擅长领域</th>
                <td>
					<select name="scly" class="easyui-combobox hy-codeselect" codetable="liulm_scly" id="scly" style="width: 140px;" >
					</select>
				</td>
            </tr>
	</tbody>
	<tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息添加')"/>
                
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
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>liulmnew/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.messager.alert("提示信息","信息添加成功！","info", function(){
					    alert("即将刷新");
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				alert("刷新完毕");
		   				window.parent.closeWin('信息添加');
		   			});
				}else{
					$.messager.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	</script>