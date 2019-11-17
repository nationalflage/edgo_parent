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
	<title>右侧树</title>
</head>
<body>
	<!-- 查询条件列表 -->
	<div class="query-list">
		<table class="table-query">
			<tbody>
				<tr>
					<th width="15%">所属数据源：</th>
					<td width="35%">数据中心</td>
					<th width="15%">表类型：</th>
					<td width="35%">表类型</td>
				</tr>
				<tr>
					<th>中文名称：</th>
					<td>主体基本信息表</td>
					<th>已生成表：</th>
					<td>
						<label><input name="judge" type="radio" checked />是</label>
						<label><input name="judge" type="radio"/>否</label>
					</td>
				</tr>
				<tr>
					<th>表描述：</th>
					<td colspan="3">一般在“表结构”这个词，在计算机技术的数据库管理与编程方面用得比较多。2.机技术的数据库管理与编程方面用得比较SQL Server、Oracle等，甚至ACCESS、MYSQL等里面也会用到。</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- tab页 -->
	<ul class="tabs-nav" id="tabs-nav">
		<li class="active" id="tabs_nav1"><a href="javascript:void(0);">表结构管理</a></li>
		<li id="tabs_nav2" ><a href="javascript:void(0);">表字段管理</a></li>
	</ul>
	<div class="tabs-con">
		<div id="tabs_con1">
			<!-- 查询结果列表 begin-->
			<table class="easyui-datagrid" pagination="true">
				<thead>
				<tr>
					<th data-options="field:'name1',width:50">序号</th>
					<th data-options="field:'name2',width:130">所属系统</th>
					<th data-options="field:'name3',width:150">表名</th>
					<th data-options="field:'name4',width:130">表中文名称</th>
					<th data-options="field:'name5',width:130">是否已经生成</th>
					<th data-options="field:'name6',width:100">表类型</th>
					<th data-options="field:'name7',width:130">创建日期</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>2</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>3</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>4</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>5</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>6</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>7</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>8</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>9</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>10</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>11</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>12</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>13</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				<tr>
					<td>14</td>
					<td>数据中心</td>
					<td>SYS_RIGHT_DEPART</td>
					<td>部门表</td>
					<td>是</td>
					<td>系统表</td>
					<td>2017.03.20 16:40</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div id="tabs_con2" style="display: none;">2</div>
	</div>
</body>
</html>
