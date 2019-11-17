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
	<title>其余树</title>
</head>
<body>
	<!-- 基础树 -->
	<div class="left-tree">
		<h2>基础树</h2>
		<!-- search -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<h3 class="easyui-tree-title">基础树</h3>
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
	
	<!-- 线树 -->
	<div class="left-tree" style="left:240px;">
		<h2>线树</h2>
		<!-- search -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<h3 class="easyui-tree-title">线树</h3>
		<ul class="easyui-tree" data-options="lines:true">
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
	
	<!-- 复选框树 -->
	<div class="left-tree" style="left:468px;">
		<h2>复选框树</h2>
		<!-- search -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<h3 class="easyui-tree-title">复选框树</h3>
		<ul class="easyui-tree" data-options="checkbox:true">
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
	
	<!-- 可拖拉节点的树 -->
	<div class="left-tree" style="left:697px;">
		<h2>可拖拉节点的树</h2>
		<!-- search -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<h3 class="easyui-tree-title">可拖拉节点的树</h3>
		<ul class="easyui-tree" data-options="dnd:true">
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
	
	<!-- 可编辑的树 -->
	<div class="left-tree" style="left:925px;">
		<h2>可编辑的树</h2>
		<!-- search -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入关键词'" style="width: 100%" />
		</form>
		<h3 class="easyui-tree-title">可编辑的树</h3>
		<ul class="easyui-tree" data-options="onClick: function(node){$(this).tree('beginEdit',node.target);}">
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
</body>
</html>
