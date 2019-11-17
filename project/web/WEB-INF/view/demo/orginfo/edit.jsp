<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>信息修改</title>
</head>
<body>
	<form class="query-list" id="form1" method="post">
		<input id="orgid" name="orgid" type="hidden" value="${model.orgid }">
		<table  class="table-query">
			<tbody>
				<tr>
					<th>组织机构名称</th>
					<td>
						<input class="easyui-textbox" id="orgname" name="orgname" type="text" value="${model.orgname }" size="40" required="true" validType="length[0,100]"/>
					</td>
					<th>组织机构代码</th>
					<td>
						<input class="easyui-textbox" id="orgcode" name="orgcode" type="text" value="${model.orgcode }" size="40" required="true" validType="length[0,20]"/>
					</td>
				</tr>
				<tr>
					<th>法定代表人</th>
					<td>
						<input class="easyui-textbox" id="principal" name="principal" type="text" value="${model.principal }" size="40" validType="length[0,30]"/>
					</td>
					<th>身份证号</th>
					<td>
						<input class="easyui-textbox" id="idcard" name="idcard" type="text" value="${model.idcard }" size="40" validType="length[0,18]"/>
					</td>
				</tr>
				<tr>
					<th>经营范围与主要产品</th>
					<td>
						<input class="easyui-textbox" id="busiscope" name="busiscope" type="text" value="${model.busiscope }" size="40" validType="length[0,200]"/>
					</td>
					<th>成立日期</th>
					<td>
						<input class="easyui-datebox" id="createdate" name="createdate" value="${model.createdate }" type="text" style="width:95px;" />
					</td>
				</tr>
				<tr>
					<th>注册资金(元)</th>
					<td>
						<input class="easyui-textbox" id="regfunds" name="regfunds" type="text" value="${model.regfunds }" size="40" validType="length[0,22]"/>
					</td>
					<th>货币种类</th>
					<td>
						<input class="easyui-textbox" id="moneytype" name="moneytype" type="text" value="${model.moneytype }" size="40" validType="length[0,20]"/>
					</td>
				</tr>
				<tr>
					<th>经营地址</th>
					<td>
						<input class="easyui-textbox" id="address" name="address" type="text" value="${model.address }" size="40" validType="length[0,100]"/>
					</td>
					<th>行政区划</th>
					<td>
						<select class="easyui-combobox hy-codeselect" id="districtid" name="districtid" type="text" codetable="district" text="${model.districtid}"/>
					</td>
				</tr>
				<tr>
					<th>联系人</th>
					<td>
						<input class="easyui-textbox" id="linkman" name="linkman" type="text" value="${model.linkman }" size="40" validType="length[0,30]"/>
					</td>
					<th>联系电话</th>
					<td>
						<input class="easyui-textbox" id="linkphone" name="linkphone" type="text" value="${model.linkphone }" size="40" validType="length[0,30]"/>
					</td>
				</tr>
			</tbody>
			<tfoot>
                <tr height="100">
                    <td colspan="4">
                        <input class="btn btn-info" type="button" value="保　存" onclick="save();"/>
                        <input class="btn" type="button" value="关　闭" onclick="window.parent.closeWin('信息修改')"/>
                    </td>
                </tr>
            </tfoot>
		</table>
	</form>
	<script>
		$(function(){
		
		});
		function save(){
			if(!$("#form1").form('validate')){
				return;
			}
			var data = $("#form1").serialize();
			$.ajax({
				type: "POST",
			   	url: "<%=basePath %>orginfo/doEdit.xhtml",
			   	data: data,
			   	success: function(msg){
			    	if("success" == msg){
						$.hyjx.alert("提示信息","信息修改成功！","info", function(){
			   				parent.rightFrame.$('#tt').datagrid("reload");
			   				window.parent.closeWin('信息修改');
			   			});
					}else{
						$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
					}
			   }
			}); 
		} 
	</script>
</body>
</html>

