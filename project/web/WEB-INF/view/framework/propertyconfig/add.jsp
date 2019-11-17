<%@page import="com.hyjx.framework.component.propertyconfig.PropertyConfigModel"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">

    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	
	function save(){
	
		var url="<%=basePath %>propertyconfig/doAddPropertyConfig.xhtml";
		if($("#optType").val()!=""){
			url="<%=basePath %>propertyconfig/doEditPropertyConfig.xhtml";
		}else{
			$("#property_value_hidden").val($("#property_value").val());
		}
		  
		if(!$("#form1").form("validate"))
		return ;
		var data = $("#form1").serialize();
		$.ajax({
			type: "post",
		   	url: url,
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","属性保存成功！","info", function(){
						parent.rightFrame.$('#tt').datagrid("reload");
		   				closeLayer();
		   			});
				}else if("repeat" == msg){
					$.hyjx.alert("提示信息","该属性键已经存在！请重新换一个属性键！","error", function(){});
				}else{
					$.hyjx.alert("提示信息","属性保存失败，请重试！","error", function(){});
				}
		   }
		});
	}
	
	function closeLayer(){
		var layerTitle='添加属性';
		if($("#optType").val()!=""){
			layerTitle='修改属性';
		}
		window.parent.closeWin(layerTitle);
	}
	
	</script>
</head>
<body style="background-color: #fff">
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	<input type="hidden" value="${model.property_key}"  id="optType" name="optType">
	
	<table  class="table-query">
		<tr>
			<th width="10%">属性键</th>
			<td colspan="3">
				<c:if test="${model.property_key!=null}">
			<input type="text" value="${model.property_key}"  id="property_key" 
				disabled="disabled"
				class="easyui-textbox" required="true" validType="length[0,40]" style="width:560px;" />
				<input type="hidden" value="${model.property_key}" name="property_key"/>
				</c:if> 
					<c:if test="${model.property_key==null}">
					<input type="text" value="${model.property_key}" name="property_key" id="property_key" 
				class="easyui-textbox" required="true" validType="length[0,40]" style="width:560px;"/>
				</c:if> 	
			</td>
			
			
		</tr>
		<tr>
			<th width="10%">属性值</th>
			<%-- <%=(String)request.getAttribute("keyvalue") %> --%>
<%-- 			<%=((PropertyConfigModel)request.getAttribute("model")).getProperty_value() %>
 --%>			<br>
<%-- 			<%=((PropertyConfigModel)request.getAttribute("model")).getProperty_value() %>
((PropertyConfigModel)request.getAttribute("model")).getProperty_value()
 --%>			<td colspan="3">
				<input type="text" value="" name="property_value" id="property_value" class="easyui-textbox" 
					validType="length[0,400]" style="width:560px;height: 90px;" data-options="multiline:true"/>
					<input type="hidden" name="property_value_hidden" id="property_value_hidden" />
			</td>
		</tr>
		<%-- <tr>
			<th>属性类型</th>
			<td colspan="3">
				<input type="radio" id="property_type1" name="property_type" value="1" <c:if test="${model.property_type  eq '1'}">checked="checked"</c:if>  checked="checked" /> 系统级别
				<input type="radio" id="property_type2" name="property_type" value="2" <c:if test="${model.property_type  eq '2'}">checked="checked"</c:if> /> 项目级别
			</td>
		</tr> --%>
		<tr>
			<th width="10%">枚举值</th>
			<td colspan="3">
				<input type="text" value="${model.property_enum}" name="property_enum" id="property_enum" class="easyui-textbox" 
					validType="length[0,50]" style="width:560px;height: 90px;" data-options="multiline:true"/>
			</td>
		</tr>
		<tr>
			<th width="10%">备注</th>
			<td colspan="3">
				<input type="text" value="${model.note}" name="note" id="note" class="easyui-textbox" 
					validType="length[0,50]" style="width:560px;height: 90px;" data-options="multiline:true"/>
			</td>
		</tr>
		
		<tr>
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
<script>
<%
PropertyConfigModel model =((PropertyConfigModel)request.getAttribute("model"));

//str=str.replaceAll("@", "\"");
if(model.getProperty_value()!=null){
	String str =model.getProperty_value();
%>
var t="<%=str%>";
 var temp=t.split("@");
 var ggg="";
 var fin="";
 
 for(var i=0;i<temp.length;i++){
	 //alert(temp[i]);
	 fin=fin+temp[i];
	 fin=fin+"\"";
 }
 fin = fin.substring(0, fin.length-1)
 ggg=temp[0]
//alert(fin);
$("#property_value").val(fin);
<%
}
%>
</script>