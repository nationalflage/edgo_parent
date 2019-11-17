<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/ExtFieldTag.tld" prefix="extfield" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>

</head>
<body  >
<div class="content" style="margin: 0">
	<h1 class="public-title"><b>修改部门信息</b></h1>
    
	<form id="form2" class="query-list" method="post" action="" data-options="novalidate:true" >
	<input type="hidden" name="depart_id" id="depart_id" value="${model.depart_id}">
	<input type="hidden" name="depart_code_full" id="depart_code_full" value="${model.depart_code_full}">
	<input type="hidden" name="depart_parent_id" id="depart_parent_id" value="${model.depart_parent_id}">
	
	<table  class="table-query">
		<tbody>
			<tr>
			<th width="15%">部门编码</th>
			<td width="30%"><input class="easyui-textbox" type="text" readonly="readonly" required="true" name="depart_code" id="depart_code" value="${model.depart_code}" data-options="validType:['number','length[1,30]']"/> </td>
			<th width="15%">部门名称</th>
			<td width="30%"><input class="easyui-textbox" type="text" required="true" name="depart_name" id="depart_name" value="${model.depart_name }" validType="length[1,30]"/></td>
			</tr>
	
			<tr>
			<th width="15%">部门类型</th>
			<td width="30%">
				<label><input type="radio" name="depart_type" <c:if test="${model.depart_type  eq '1'}">checked="checked"</c:if> value="1"/> 单位</label>
				<label><input type="radio" name="depart_type" <c:if test="${model.depart_type  eq '0'}">checked="checked"</c:if> value="0"/> 部门</label>
			</td>
			<th width="15%">部门层级</th>
			<td width="30%">
<%-- 				<select  class="easyui-combobox hy-codeselect" type="text" style="width:180px;" codetable="bmcj" name="depart_level" id="depart_level" text="${model.depart_level}" required="required"/> --%>
				
				<input class="easyui-combobox hy-codeselect" name="depart_level" id="depart_level" prompt="请选择" text="${model.depart_level}" codetable="bmcj" required=true ></input>

			</td>
			</tr>
			
			<tr>
			<th width="15%">部门性质</th>
			<td width="30%">
				<select class="easyui-combobox hy-codeselect" type="text" style="width:180px;" codetable="bmxz" name="depart_funca" id="depart_funca"  text="${model.depart_funca}"/>
			</td>
<!-- 			<th>部门所属单位</th> -->
<!-- 			<td> -->
<%-- 				<input class="easyui-combotree bmtree" type="text"  canSelectFolder="true"  unittree="1" name="depart_belon_unit_code" id="depart_belon_unit_code" checkedvalue="${model.depart_belon_unit_code}" /> --%>
<!-- 			</td> -->
			<th width="15%">所属区划</th>
			<td width="30%">
				<select class="easyui-combobox hy-codeselect" id="region" codetable="region" style="width:180px;" parentcode="10" type="text" name="district_code" text="${model.district_code}"/>
				<input type="hidden" id="city" value="10">
			</td>
			</tr>
			<tr>
			<th width="15%">办公电话</th>
			<td width="30%">
			<input class="easyui-textbox" type="text" name="office_tel" id="office_tel" value="${model.office_tel}" data-options="validType:'phonenumber'"/>
			</td>
			<th width="15%">传真号码</th>
			<td width="30%">
				<input class="easyui-textbox" type="text" name="office_fax" id="office_fax" value="${model.office_fax}" data-options="validType:'cznumber'"/>
			</tr>
			
			<tr>
<!-- 			<th width="15%">手机号码</th> -->
<!-- 			<td width="30%"> -->
<%-- 				<input class="easyui-textbox" type="text" name="mobile" id="mobile" value="${model.mobile}" data-options="validType:'mobile'"/> --%>
<!-- 			</td> -->
			<th width="15%">通讯地址</th>
			<td width="30%">
				<input class="easyui-textbox" type="text" name="conta_add" id="conta_add" value="${model.conta_add}" validType="length[1,50]"/>
			</td>
			<th width="15%">邮政编码</th>
			<td width="30%">
				<input class="easyui-textbox" type="text" name="postal_code" id="postal_code" value="${model.postal_code}" data-options="validType:'postcode'"/>
			</td>			
			</tr>
			
			<tr>


			<th width="15%">顺序号</th>
			<td width="30%">
				<input class="easyui-textbox" type="text" required="true" name="order_no" id="order_no" value="${model.order_no}" data-options="validType:['number','length[1,4]']" />
			</td>
			<th width="15%">是否有效</th>
			<td width="30%">
				<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'Y'}">checked="checked"</c:if> value="Y"/> 是</label>
				<label><input type="radio" name="validity" <c:if test="${model.validity  eq 'N'}">checked="checked"</c:if> value="N"/> 否</label>
			</td>
			</tr>
			<tr>
<!-- 			<th width="15%">部门联系人</th> -->
<!-- 			<td width="30%"> -->
<%-- 			<input class="easyui-textbox" type="text" name="depart_conta_perso" id="depart_conta_perso" value="${model.depart_conta_perso}"  validType="length[1,32]"/> --%>
<!-- 			</td> -->

			</tr>
			
		</tbody>
		<tfoot>
           <tr >
               <td colspan="4">
					<input type="button" class="btn btn-info" onclick="if(!save(this))return;if($(this).val()=='正在保存...')return;$(this).val('正在保存...');" value="保存" />
				   <input type="button" class="btn" onclick="javascript:location.href='<%=basePath%>depart/gotoView.xhtml?id=${model.depart_code}'" value="详细信息" />
			   </td>
           </tr>
       </tfoot>
	</table>
	</form>
</div>
</body>
</html>

<script>
	function save(b){
		if(!$("#form2").form('validate')){
			return false;
		}
		$.ajax({
				    			url:"<%=basePath%>depart/doEdit.xhtml",
		 		    			data:$("#form2").serialize(),
		 		    			type:"post",
		 		    			async:false,
		 		    			success:function(msg1)
		 		    			{
		 		    				$.hyjx.alert("提示信息","保存成功！","info", function(){parent.reloadTree($("#depart_name").val());});
		 		    				$(b).val("保存");
		 		    			},
		 		    			error:function(msg2)
		 		    			{
		 		    				$.hyjx.alert("提示信息","保存失败！","info", function(){});
		 		    			}
		 		    		});
// 		var data_attr = $("#form2").serialize();
<%-- 		var url ="<%=basePath%>depart/validate.xhtml"; --%>
// 		$.ajax({
// 			type: "POST",
// 		   	url: url,
// 		   	data: data_attr,
// 		   	success: function(msg){
// 		    	if("success" == msg){

// 				}else{
// 					$.hyjx.alert("提示信息","名称或编码已被占用，请重新输入！","info", function(){});
// 				}
// 		   	}
// 		});
	}
</script>