<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>添加</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<script type="text/javascript">
	function save() {
		if (!$("#form1").form('validate')) {
			return;
		}
		$("#form1").submit();
	}
	function fnToCondition(id, c) {
		if ($("tr[id2='" + c + "']").length > 0) {
			alert("列已存在，请删除后再添加。");
			return;
		//alert($("tr[id2='"+c+"']").length);
		//$("tr[id2='"+c+"']").remove();
		}
		$("#ch1").css("display", "");
		$("#tr1").css("display", "");

		var num = parseInt($('#conditionConfigNum').val(), 10) + 1;
		var tr = $("#temptable tr").eq(0).clone();

		tr.attr('style', 'display:"";');
		tr.attr('id', 'conditionConfig' + num);
		tr.attr('id2', c);
		tr.html(tr.html().replace(/\[\d+\]/g, '[' + num + ']'));
		tr.appendTo("#conditionConfig");
		//tr.html(tr.html().replace(/\[\d+\]/g,'['+num+']'));
		$("#conditionConfigNum").val(num);
		var titleName = $('[name="pageConfig.listConfigList[' + $(id).attr('name').replace('toCondition', '') + '].titleName"]:last').val();
		var columnName = $('[name="pageConfig.listConfigList[' + $(id).attr('name').replace('toCondition', '') + '].columnName"]:last').val();
		$('[name="pageConfig.conditionConfigList[' + num + '].columnName"]:last').val(columnName);
		$('[name="pageConfig.conditionConfigList[' + num + '].description"]:last').val(titleName + '：');
		$('[name="pageConfig.conditionConfigList[' + num + '].sql"]:last').val('AND ' + columnName + ' LIKE \'%##' + columnName + '##%\'');

	}
</script>
</head>
<body>
	<div class="content" style="margin: 0;">
		<form id="form1" class="query-list" method="post"
			action="<%=basePath%>customquery/doAdd.xhtml"
			data-options="novalidate:true">
			<table class="table-query" id="table1">
				<tr>
					<th width="20%">查询名称</th>
					<td width="30%"><input type="text"
						value="${model.query_name }" style="width: 80%" name="query_name"
						id="query_name" class="easyui-textbox" required="true"
						validType="length[0,30]" /></td>
					<th>查询类型</th>
					<td><select id="query_type" name="query_type"
						class="easyui-combobox">
							<option value="query">普通查询</option>
							<option value="advance"<c:if test="${model.query_type=='advance' }">selected=selected</c:if>>高级查询</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>查询SQL</th>
			<td colspan="3">
				<input type="text" value="${model.query_sql=='' ? 'select * from sys_right_user' : model.query_sql }" style="width: 80%"  name="query_sql" id="query_sql" class="easyui-textbox" required="true" validType="length[0,4000]"/>
				<input type="hidden" name="query_sql_old" value="<c:out value="${model.query_sql }"/>">
			</td>

		</tr>
		<tr>
			<th>描述</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.query_desc }"/>" style="width: 80%"  name="query_desc" id="query_desc" class="easyui-textbox" validType="length[0,100]"/>
			</td>
		</tr>
		<tr>
					<th width="15%">是否有效</th><td width="30%">
					<input type="radio" name="validity" <c:if test="${model.validity=='Y' }">checked="checked"</c:if> value="Y"/> 是
					<input type="radio" name="validity" <c:if test="${model.validity=='N' }">checked="checked"</c:if> value="N"/> 否
				</td>
		</tr>
		</table>
		
		<c:forEach items="${model.pageConfig.listConfigList}" var="listConfig" varStatus="status">
		<c:if test="${status.index ==0 }">
		<h1 class="public-title">列表设置</h1>
		<textarea cols="150" readonly="readonly" rows="3" style="border-style: none;font-size: 12px;overflow: hidden;">操作类型配置示例：<a href='##PATH##?id=##TASKNAME##&a=##STATUS##'>查看</a>其中##PATH##是固定变量，表示web项目的相对路径，##TASKNAME##表示取TASKNAME列的值。 日期类型：时间控件需要配置两个条件，用@@分割，前一个时间值为##字段名_START##，后一个为##字段名_END##。</textarea>
		<hr style="width: 90%;float: left;">
		<table>
			<tr>
			<th>字段名</th>
			<th>中文名</th>
			<th>显示位置</th>
			<th>是否显示</th>
			<th>类型</th>
			<th>对应码表</th>
			<th style="display: none;">列宽</th>
			<th>顺序</th>
			</tr>
		</c:if>
		<c:if test="${listConfig.columnName !=null }">
		<tr>
		<td>
			<input type="text" name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].columnName" value="<c:out value="${listConfig.columnName}"></c:out>"  style="width:150px;${listConfig.isShow=='I' ? 'background-color:#FBE2E2;':''}" ${listConfig.isShow=='I' ? 'disabled="disabled"' : ''}/>
		</td>
		<td>
			<input type="text" name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].titleName" value="<c:out value="${listConfig.titleName}"></c:out>"  style="width:150px;"/>
		</td>
		<td>
              <select name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].align" style="width:100px;">
                <option value="style='text-align:left;'" ${listConfig.align == 'style=\'text-align:left;\'' ? 'selected' : ''}>左对齐</option>
                <option value="style='text-align:center;'" ${listConfig.align == 'style=\'text-align:center;\'' ? 'selected' : ''}>居中</option>
                <option value="style='text-align:right;'" ${listConfig.align == 'style=\'text-align:right;\'' ? 'selected' : ''}>右对齐</option>
              </select>
            </td>
            <td>
              <select name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].isShow" style="width:50px;" >
                <option value="Y" ${listConfig.isShow == 'Y' ? 'selected="selected"' : ''}>是</option>
                <option value="N" ${listConfig.isShow == 'N' ? 'selected="selected"' : ''}>否</option>
              </select>
            </td>
            <td>
              <select name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].type" style="width:100px;">
                <option value="value" ${listConfig.type == 'value' ? 'selected="selected"' : ''}>字段值</option>
                <option value="standard" ${listConfig.type == 'standard' ? 'selected="selected"' : ''}>码表</option>
<%--                 <option value="config" ${listConfig.type == 'config' ? 'selected="selected"' : ''}>配置码表</option> --%>
<%--                 <option value="order" ${listConfig.type == 'order' ? 'selected="selected"' : ''}>序号</option> --%>
<%--                 <option value="html" ${listConfig.type == 'html' ? 'selected="selected"' : ''}>HTML</option> --%>
						 <option value="operation" ${listConfig.type == 'operation' ? 'selected="selected"' : ''}>操作</option>
					</select></td>
					<td><input type="text"
						name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].codeTable"
						value="<c:out value="${listConfig.codeTable}"></c:out>"
						style="width: 98%;" /></td>
					<td style="display: none;"><input type="text"
						name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].width"
						value="<c:out value="${listConfig.width}"></c:out>"
						style="width: 50px;" /></td>
					<td><input type="text"
						name="pageConfig.listConfigList[<c:out value="${status.index+1}"></c:out>].order"
						value="<c:out value="${listConfig.order}"></c:out>"
						style="width: 50px;" check="type=int;" /></td>
					<th><a href="javascript:void(0)"
						name="toCondition<c:out value="${status.index+1}"></c:out>"
						onclick="fnToCondition(this,'<c:out value="${listConfig.columnName}"></c:out>');"><nobr>至查询条件</nobr></a>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<h1 id="ch1" class="public-title"
				<c:if test="${model.pageConfig.conditionConfigList ==null }">style="display:none"</c:if>>查询条件</h1>
			<table id="conditionConfig">
				<tr id="tr1"
					<c:if test="${model.pageConfig.conditionConfigList ==null }">style="display:none"</c:if>>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">字段名</th>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">描述</th>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">显示类型</th>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">对应码表</th>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">行宽</th>
					<th width="10%" heightshow="true"
						attributes="style=text-align:center;">SQL表达式</th>
					<!--           <th width="7%" heightshow="true" attributes="style=text-align:center;">顺序</th> -->
					<th width="7%" heightshow="true"
						attributes="style=text-align:center;">操作</th>
				</tr>

				<c:forEach items="${model.pageConfig.conditionConfigList}"
					var="conditionConfig" varStatus="status">
					<c:if test="${status.index == 0 }">
					</c:if>
					<tr id2="<c:out value="${conditionConfig.columnName}"></c:out>">
						<td><input type="text"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].columnName"
							value="<c:out value="${conditionConfig.columnName}"></c:out>" />
						</td>
						<td><input type="text"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].description"
							value="<c:out value="${conditionConfig.description}"></c:out>" />
						</td>
						<td><select
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].type"
							style="width:100px;">
								<option value="input"
									${conditionConfig.type == 'input' ? 'selected="selected"' : ''}>文本框</option>
								<option value="standard"
									${conditionConfig.type == 'standard' ? 'selected="selected"' : ''}>码表</option>
								<%--                 <option value="config" ${conditionConfig.type == 'config' ? 'selected="selected"' : ''}>配置码表</option> --%>
								<option value="date"
									${conditionConfig.type == 'date' ? 'selected="selected"' : ''}>时间控件</option>

						</select></td>
						<td><input type="text"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].codeTable"
							value="<c:out value="${conditionConfig.codeTable}"></c:out>" /></td>
						<td><input type="radio"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].width"
							value="half"
							${ (conditionConfig.width=='half' || conditionConfig==null)?'checked="checked"':''} />半行&nbsp;&nbsp;
							<input type="radio"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].width"
							value="total"
							${ conditionConfig.width=='total'?'checked="checked"':''} />整行</td>
						<td><input type="text"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].sql"
							value="<c:out value="${conditionConfig.sql}"></c:out>" /></td>
						<td style="display: none"><input type="text"
							name="pageConfig.conditionConfigList[<c:out value="${status.index+1}"></c:out>].order"
							style="width: 50px;"
							value="<c:out value="${conditionConfig.order}"></c:out>"
							check="type=int;" /></td>
						<td attributes="style=text-align:center;"><a
							href="javascript:void(0)" onclick="deltr(this);">删除</a></td>
					</tr>
				</c:forEach>

			</table>

			<table class="table-query">
				<tr>
					<td colspan="4" style="text-align:center" valign="bottom">
						<div class="buttons">
							<button class="btn btn-info" onclick="save();" type="button">确定</button>
							<button class="btn" type="button"
								onclick="window.parent.closeWin('信息添加');window.parent.closeWin('信息修改')">关
								闭</button>
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" id="conditionConfigNum" value="0" /> <input
				type="hidden" name="query_id"
				value="<c:out value="${model.query_id }"></c:out>" /> <input
				type="hidden" name="action_type"
				value="<c:out value="${model.action_type}"></c:out>" />

		</form>
		<table id="temptable">
			<tr style="display: none" id2="temptr">
				<td><input type="text"
					name="pageConfig.conditionConfigList[0].columnName" /></td>
				<td><input type="text"
					name="pageConfig.conditionConfigList[0].description" /></td>
				<td><select name="pageConfig.conditionConfigList[0].type"
					style="width:100px;">
						<option value="input">文本框</option>
						<option value="standard">码表</option>
						<option value="date">时间控件</option>
				</select></td>
				<td><input type="text"
					name="pageConfig.conditionConfigList[0].codeTable" /></td>
				<td><input type="radio"
					name="pageConfig.conditionConfigList[0].width" value="half"
					checked="true" />半行&nbsp;&nbsp; <input type="radio"
					name="pageConfig.conditionConfigList[0].width" value="total" />整行</td>
				<td><input type="text"
					name="pageConfig.conditionConfigList[0].sql" /></td>
				<!--           <td> -->
				<!--             <input type="text" name="pageConfig.conditionConfigList[0].order" style="width: 50px;" value=0 check="type=int;"/> -->
				<!--           </td> -->
				<td attributes="style=text-align:center;"><a
					href="javascript:void(0)" onclick="deltr(this);">删除</a></td>
			</tr>
		</table>
	</div>
</body>
</html>

<script>
$(document).ready(function(){
	$("#query_type").val("<c:out value="${model.query_type}"></c:out>");
	if("<c:out value="${model.pageConfig.listConfigList}"></c:out>"!="")
		$("#table1").css("display","none");
	if("<c:out value="${result}"></c:out>"!="")
	{
		$.messager.alert("提示信息","保存成功！在列表页面点击查看即可预览页面。","info", function(){
				try{	
					parent.rightFrame.$('#tt').datagrid("reload");
				}catch(e){}
				try{
					parent.$('#tt').datagrid("reload");
				}catch(e){}
				window.parent.closeWin('信息添加');
				window.parent.closeWin('信息修改');
			});
	}
	$("#conditionConfigNum").val(${fn:length(model.pageConfig.conditionConfigList)});
});
function deltr(tr)
{
	$(tr).parent().parent().remove(); 
}
if("<c:out value="${msg}"></c:out>"!=""){
	$("#query_sql").focus();
	alert("<c:out value="${msg}"></c:out>");
}
</script>