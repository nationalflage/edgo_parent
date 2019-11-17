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
	<title>信息添加</title>
</head>
<body>
    <form class="query-list" id="form1" method="post">
        <table class="table-query">
            <tbody>
               <tr>
					<th>组织机构名称</th>
					<td>
						<input class="easyui-textbox" name="orgname" id="orgname" type="text" value="${model.orgname }" required="true"  validType="length[0,100]"/>
					</td>
					<th>组织机构代码</th>
					<td> 
						<input class="easyui-textbox" name="orgcode" id="orgcode" type="text" value="${model.orgcode }" required="true" validType="length[0,20]"/>
					</td>
				</tr>
				<tr>
					<th>法定代表人</th>
					<td>
						<input class="easyui-textbox" name="principal" id="principal" type="text" value="${model.principal }" validType="length[0,30]"/>
					</td>
					<th>身份证号</th>
					<td>
						<input class="easyui-textbox" name="idcard" id="idcard" type="text" value="${model.idcard }" validType="length[0,18]"/>
					</td>
				</tr>
				<tr>
					<th>经营范围与主要产品</th>
					<td>
						<input class="easyui-textbox" name="busiscope" id="busiscope" type="text" value="${model.busiscope }" validType="length[0,200]"/>
					</td>
					<th>成立日期</th>
					<td>
						<input class="easyui-textbox" name="createdate" id="createdate" type="text" value="${model.createdate }" />
					</td>
				</tr>
				<tr>
					<th>注册资金(元)</th>
					<td>
						<input class="easyui-textbox" name="regfunds" id="regfunds" type="text" value="${model.regfunds }" validType="length[0,22]"/>
					</td>
					<th>货币种类</th>
					<td>
						<input class="easyui-textbox" name="moneytype" id="moneytype" type="text" value="${model.moneytype }" validType="length[0,20]"/>
					</td>
				</tr>
				<tr>
					<th>经营地址</th>
					<td>
						<input class="easyui-textbox" name="address" id="address" type="text" value="${model.address }" validType="length[0,100]"/>
					</td>
					<th>行政区划</th>
					<td>
						<select class="easyui-combobox hy-codeselect" name="districtid" id="districtid" type="text" codetable="district"/>
					</td>
				</tr>
				<tr>
					<th>联系人</th>
					<td>
						<input class="easyui-textbox" name="linkman" id="linkman" type="text" value="${model.linkman }" validType="length[0,30]"/>
					</td>
					<th>联系电话</th>
					<td>
						<input class="easyui-textbox" name="linkphone" id="linkphone" type="text" value="${model.linkphone }" validType="length[0,30]"/>
					</td>
				</tr> 
            </tbody>
            <tfoot>
                <tr height="100">
                    <td colspan="4">
                        <input class="btn btn-info" type="button" value="保　存" onclick="save();"/>
                        <input class="btn" type="button" value="关　闭" onclick="window.parent.closeWin('信息添加')"/>
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
	<script >
		$(function(){
		
		});
		function save(){
			if(!$("#form1").form('validate')){
				return;
			}
			var data = $("#form1").serialize();
			$.ajax({
				type: "POST",
			   	url: "<%=basePath %>orginfo/doAdd.xhtml",
			   	data: data,
			   	success: function(msg){
			    	if("success" == msg){
						$.hyjx.alert("提示信息","信息添加成功！","info", function(){
			   				parent.rightFrame.$('#tt').datagrid("reload");
			   				window.parent.closeWin('信息添加');
			   			});
					}else{
						$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
					}
			   }
			}); 
		} 
	</script>
</body>
</html>
