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
	<title>大框搜索</title>
</head>
<body>
<div class="content">
	<h1 class="public-title"><b>手工提取</b></h1>
	<!-- search begin -->
	<form class="searchForm2" method="post" action="">
		<ul class="tabs-nav tabs-nav3">
			<li class="active"><a href="javascript:void(0)">标签一</a></li>
			<li><a href="javascript:void(0)">标签二</a></li>
			<li><a href="javascript:void(0)">标签三</a></li>
		</ul>
		<input class="text" type="text" style="width:600px;" />
		<input class="btn btn-info" type="button" value="搜&nbsp;索"/>
		<label><input type="checkbox"/>保存关键词</label>
		<a class="color" href="javascript:void(0)">检索管理></a>
		<a class="color" href="javascript:void(0)">检索记录></a>
		<p class="small">常用关键词：<span class="color">食品</span><span class="color">药品</span><span class="color">保健品</span><span class="color">化妆品</span><span class="color">医疗器械</span><span class="color">预包装</span></p>
	</form>
	<!-- search end -->
	<!-- 查询结果列表 begin-->
	<div class="result-list">
		<h1 class="title total">系统自动匹配主题数共 <span class="color">5</span>条</h1>
		<div class="operate">
			<a href="javascript:void(0)" class="btn btn-info">匹配</a>
			<a href="javascript:void(0)" class="btn">全部匹配</a>
		</div>
		<table class="easyui-datagrid" data-options="pagination:true,singleSelect:false,rownumbers:true">
			<thead>
				<tr>
					<th data-options="field:'name1'" checkbox='true'></th>
					<th data-options="field:'name2',width:200">企业名称</th>
					<th data-options="field:'name3',width:280">处罚决定书文号</th>
					<th data-options="field:'name4',width:160">处罚决定书签发日期</th>
					<th data-options="field:'name5',width:190">违法行为类型</th>
					<th data-options="field:'name6',width:160">处罚种类</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td>北京市环保局</td>
					<td>京环保监察罚字【2017】24号</td>
					<td> 2017-01-22</td>
					<td>固体废弃物超标</td>
					<td>罚款50万元</td>
				</tr>
				<tr>
					<td></td>
					<td>北京市环保局</td>
					<td>京环保监察罚字【2017】24号</td>
					<td> 2017-01-22</td>
					<td>固体废弃物超标</td>
					<td>罚款50万元</td>
				</tr>
				<tr>
					<td></td>
					<td>北京市环保局</td>
					<td>京环保监察罚字【2017】24号</td>
					<td> 2017-01-22</td>
					<td>固体废弃物超标</td>
					<td>罚款50万元</td>
				</tr>
				<tr>
					<td></td>
					<td>北京市环保局</td>
					<td>京环保监察罚字【2017】24号</td>
					<td> 2017-01-22</td>
					<td>固体废弃物超标</td>
					<td>罚款50万元</td>
				</tr>
				<tr>
					<td></td>
					<td>北京市环保局</td>
					<td>京环保监察罚字【2017】24号</td>
					<td> 2017-01-22</td>
					<td>固体废弃物超标</td>
					<td>罚款50万元</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 查询结果列表 end -->
</div>
</body>
</html>
