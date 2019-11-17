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
	<title>资源目录</title>
</head>
<body>
	<!-- 左侧树 begin-->
	<div class="left-tree">
		<h2>资源目录</h2>
		<!-- 搜索 -->
		<form class="searchForm1" method="post">
			<input class="easyui-searchbox" data-options="prompt:'请输入搜索关键词'" style="width: 100%" />
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
	<iframe class="right-area" name="treeFrame" id="treeFrame" src="<%=basePath %>demo/gotoTreeRight.xhtml" frameborder="0"  allowtransparency="true" onload="treeFrameHeight()"></iframe>
</body>
</html>
