<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<title>信息查看</title>
</head>
<body>
	<table class="table-query">
		<tbody>
			<tr>
				<th>组织机构名称</th>
				<td>${model.orgname }</td>
				<th>组织机构代码</th>
				<td>${model.orgcode }</td>
			</tr>
			<tr>
				<th>法定代表人</th>
				<td>${model.principal }</td>
				<th>身份证号</th>
				<td>${model.idcard }</td>
			</tr>
			<tr>
				<th>经营范围与主要产品</th>
				<td>${model.busiscope }</td>
				<th>成立日期</th>
				<td>${model.createdate }</td>
			</tr>
			<tr>
				<th>注册资金(元)</th>
				<td>${model.regfunds }</td>
				<th>货币种类</th>
				<td>${model.moneytype }</td>
			</tr>
			<tr>
				<th>经营地址</th>
				<td>${model.address }</td>
				<th>行政区划</th>
				<td>${model.districtName }</td>
			</tr>
			<tr>
				<th>联系人</th>
				<td>${model.linkman }</td>
				<th>联系电话</th>
				<td>${model.linkphone }</td>
			</tr>
		</tbody>
		<tfoot>
        	<tr height="100">
            	<td colspan="4">
                	<input class="btn" type="button" value="关　闭" onclick="window.parent.closeWin('信息详细')"/>
            	</td>
        	</tr>
     	</tfoot>
	</table>
</body>
</html>