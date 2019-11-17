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
	<title></title>
</head>

<body>
	<!-- 左侧树 begin-->
	<div class="left-tree">
		<h2>资源目录</h2>
		<!-- 搜索 -->
		<form class="searchForm1" action="" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<!-- 操作按钮 -->
		<div class="operate">
			<img class="img-btn" src="<%=basePath %>images/tree-add.png" title="添加"/>&nbsp;&nbsp;&nbsp;
			<img class="img-btn" src="<%=basePath %>images/tree-up.png" title="上移"/>&nbsp;&nbsp;&nbsp;
			<img class="img-btn" src="<%=basePath %>images/tree-down.png" title="下移"/>&nbsp;&nbsp;&nbsp;
			<img class="img-btn" src="<%=basePath %>images/tree-del.png" title="删除"/>
		</div>
		<!-- 此处是树 -->
		<h3 class="easyui-tree-title">数据中心</h3>
		<ul class="easyui-tree">
			<li>
				<span>许可</span>
				<ul>
					<li data-options="state:'closed'">
						<span>主体登记（3）</span>
						<ul>
							<li>
								<span>企业(机构)</span>
							</li>
							<li>
								<span>主要人员</span>
							</li>
							<li>
								<span>投资人</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体历史登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>主体登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>许可证登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
				</ul>
			</li>
			<li data-options="state:'closed'">
				<span>案件</span>
				<ul>
					<li data-options="state:'closed'">
						<span>主体登记（3）</span>
						<ul>
							<li>
								<span>企业(机构)</span>
							</li>
							<li>
								<span>主要人员</span>
							</li>
							<li>
								<span>投资人</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体历史登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>主体登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>许可证登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
				</ul>
			</li>
			<li data-options="state:'closed'">
				<span>监管</span>
				<ul>
					<li data-options="state:'closed'">
						<span>主体登记（3）</span>
						<ul>
							<li>
								<span>企业(机构)</span>
							</li>
							<li>
								<span>主要人员</span>
							</li>
							<li>
								<span>投资人</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个体历史登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>名称登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>主体登记历史（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>许可证登记（0）</span>
						<ul>
							<li>目录1</li>
							<li>目录2</li>
							<li>目录3</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- 左侧树 end-->

	<!-- 右侧div or 右侧iframe（只需加class="right-area"） -->
	<div class="right-area">
		<!-- 内容 begin -->
		<div class="content" style="padding-top: 10px;">
			<!-- <h1 class="public-title"><b>企业（机构）</b></h1> -->
			<form class="query-list" method="post">
				<table class="table-query">
					<tbody>
						<tr>
							<th width="120">备案编号</th>
							<td>
								<input class="easyui-textbox" data-options="required:true" type="text"/>
							</td>
							<th width="120">生产企业名称</th>
							<td>
								<input class="easyui-textbox" type="text"/>
							</td>
							<th width="120">出口企业名称</th>
							<td>
								<input class="easyui-textbox" type="text"/>
							</td>
						</tr>
						<tr>
							<th>出口产品名称</th>
							<td>
								<input class="easyui-textbox" type="text"/>
							</td>
							<th>是否境内备案</th>
							<td>
								<input name="judge" type="radio" />是
								<input name="judge" type="radio" />否
							</td>
							<th>注册号/备案号</th>
							<td>
								<input class="easyui-textbox" type="text"/>
							</td>
						</tr>
						<tr>
							<th>销往国家</th>
							<td>
								<select class="easyui-combobox">
									<option value="1">中国</option>
									<option value="2">美国</option>
									<option value="3">意大利</option>
								</select>
							</td>
							<th>备案日期</th>
							<td colspan="3">
								<input class="easyui-datebox" type="text" style="width:110px;" />
								至
								<input class="easyui-datebox" type="text" style="width:110px;" />
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<input class="btn btn-info" type="button" value="查　询" />
								<input class="btn" type="button" value="重　置" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>

		<div class="content"  style="padding-top: 10px;">
			<!-- 查询结果列表 begin -->
			<table class="table-result">
				<thead>
					<tr>
						<th>序号</th>
						<th>抽查任务名称</th>
						<th>申请部门</th>
						<th>计划抽查日期</th>
						<th>执行状态</th>
						<th width="170">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>涉嫌虚假注册类企业定向抽查</td>
						<td>北京市工商局</td>
						<td>2017-01-03至2017-07-27</td>
						<td>待执行</td>
						<td>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">查看</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">导出抽查任务</a>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>涉嫌虚假注册类企业定向抽查</td>
						<td>北京市工商局</td>
						<td>2017-01-03至2017-07-27</td>
						<td>待执行</td>
						<td>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">查看</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">导出抽查任务</a>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>涉嫌虚假注册类企业定向抽查</td>
						<td>北京市工商局</td>
						<td>2017-01-03至2017-07-27</td>
						<td>待执行</td>
						<td>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">查看</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0)" style="width:70px;">执行</a>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td>涉嫌虚假注册类企业定向抽查</td>
						<td>北京市工商局</td>
						<td>2017-01-03至2017-07-27</td>
						<td>待执行</td>
						<td>
							<a class="btn btn-info btn-sm" href="javascript:void(0)">查看</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0)" style="width:70px;">执行</a>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 内容 end -->
		</div>
	</div>
</body>
</html>
