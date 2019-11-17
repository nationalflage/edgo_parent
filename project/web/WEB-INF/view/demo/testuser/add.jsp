<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>
<body>
    <form id="form1" class="query-list" method="post" action="">
        <table class="table-query">
            <tbody>
               <tr>
			<th>组织机构名称</th>
			<td>
				<input type="text" value="${model.orgname }" name="orgname" id="orgname" class="easyui-textbox" required="true"  validType="length[0,100]"/>
			</td>
			<th>组织机构代码</th>
			<td> 
				<input type="text" value="${model.orgcode }" name="orgcode" id="orgcode" class="easyui-textbox" required="true" validType="length[0,20]"/>
			</td>
		</tr>
		<tr>
			<th>法定代表人</th>
			<td>
				<input type="text" value="${model.principal }" name="principal" id="principal" class="easyui-textbox"  validType="length[0,30]"/>
			</td>
			<th>身份证号</th>
			<td>
				<input type="text" value="${model.idcard }" name="idcard" id="idcard" class="easyui-textbox"  validType="length[0,18]"/>
			</td>
		</tr>
		<tr>
			<th>经营范围与主要产品</th>
			<td>
				<input type="text" value="${model.busiscope }" name="busiscope" id="busiscope" class="easyui-textbox"  validType="length[0,200]"/>
			</td>
			<th>成立日期</th>
			<td>
				<input type="text" value="${model.createdate }" name="createdate" id="createdate" class="easyui-textbox"  />
			</td>
		</tr>
		<tr>
			<th>注册资金(元)</th>
			<td>
				<input type="text" value="${model.regfunds }" name="regfunds" id="regfunds" class="easyui-textbox"  validType="length[0,22]"/>
			</td>
			<th>货币种类</th>
			<td>
				<input type="text" value="${model.moneytype }" name="moneytype" id="moneytype" class="easyui-textbox"  validType="length[0,20]"/>
			</td>
		</tr>
		<tr>
			<th>经营地址</th>
			<td>
				<input type="text" value="${model.address }" name="address" id="address" class="easyui-textbox"  validType="length[0,100]"/>
			</td>
			<th>行政区划</th>
			<td>
				<select class="easyui-combobox hy-codeselect" type="text" codetable="district" name="districtid" id="districtid"/>
			</td>
		</tr>
		<tr>
			<th>联系人</th>
			<td>
				<input type="text" value="${model.linkman }" name="linkman" id="linkman" class="easyui-textbox"  validType="length[0,30]"/>
			</td>
			<th>联系电话</th>
			<td>
				<input type="text" value="${model.linkphone }" name="linkphone" id="linkphone" class="easyui-textbox"  validType="length[0,30]"/>
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
		   	url: baseUrl+"testuser/doAdd.xhtml",
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