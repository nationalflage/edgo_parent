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
	<title>页面导航</title>
	<style>
		.detail-list1 td{color:#333;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>示例--页面导航</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>
								在给定的区域内按顺序生成当前一级菜单的所有子菜单导航（树型）
								<span style="color: red">【需在自适应布局下才能正常显示】</span>
							</td>
						</tr>
						<tr>
							<td><strong>依赖：</strong>无</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p style="margin-left:45px;">
									&lt;div class="left-menu hy-pagemenu" id="tagId1" />
								</p>
								<p style="margin-left:45px;">
									效果预览：<br>
								<div class="container" style="margin-top: 0;">
									<!-- 左侧菜单栏-->
									<div  class="leftArea">
										<div class="left-menu hy-pagemenu" id="tagId1" />
									</div>
								</div>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p style="margin-left:45px;">&lt;ul class="left-menu" id="tagId2">&lt;/ul></p>
								<pre>
			$("#tagId2").pagemenu({});
								</pre>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;">
								<div class="container" style="margin-top: 0;">
									<!-- 左侧菜单栏-->
									<div  class="leftArea">
										<ul class="left-menu" id="tagId2"></ul>
									</div>
								</div>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 属性 -->
			<div class="detail-list">
				<h3 class="title"><strong>属性</strong></h3>
				<table class="detail-list2">
					<thead>
						<tr>
							<th width="15%">属性名</th>
							<th width="15%">中文含义</th>
							<th width="10%">是否必填</th>
							<th width="15%">默认值（非必填项）</th>
							<th width="25%">值集/示例</th>
							<th width="20%">备注</th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- 方法 -->
			<div class="detail-list">
				<h3 class="title"><strong>方法</strong></h3>
				<table class="detail-list2">
					<thead>
						<tr>
							<th width="10%">方法名</th>
							<th width="25%">中文含义</th>
							<th width="20%">参数</th>
							<th width="15%">返回值</th>
							<th width="30%">使用示例</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<script>
        $(function () {
            $("#tagId2").pagemenu({

			});
        });
	</script>
</body>
</html>