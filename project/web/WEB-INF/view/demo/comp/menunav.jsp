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
	<title>一级导航</title>
	<style>
		.detail-list1 td{color:#333;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>示例--一级导航</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>在给定的区域内按顺序生成当前子系统的一级菜单导航；横向排列</td>
						</tr>
						<tr>
							<td><strong>依赖：</strong>无</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p style="margin-left:45px;">
									&lt;ul class="navigation hy-menunav" id="tagId1" homeurl="&lt;%=basePath %>index/home.xhtml" menuurl="&lt;%=basePath %>index.xhtml" activemenuid="home"></ul>
								</p>
								<p style="margin-left:45px;">
									效果预览：<br>
								<ul class="navigation hy-menunav" id="tagId1" homeurl="<%=basePath %>index/home.xhtml" menuurl="<%=basePath %>index.xhtml" activemenuid="home"></ul>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p style="margin-left:45px;">&lt;ul class="navigation" id="tagId2" >&lt;/ul></p>
								<pre>
			$("#tagId2").menunav({
				homeurl:"<%=basePath %>index/home.xhtml",
				menuurl:"<%=basePath %>index.xhtml",
				activemenuid:"home"
			});
								</pre>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;"><ul class="navigation" id="tagId2" ></ul></p>
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
					<tbody>
						<tr>
							<td>homeurl</td>
							<td>首页地址</td>
							<td>否</td>
							<td><%=basePath%>index/home.xhtml</td>
							<td></td>
							<td>可自定义首页地址</td>
						</tr>
						<tr>
							<td>menuurl</td>
							<td>一级菜单地址</td>
							<td>是</td>
							<td><%=basePath%>index/index.xhtml</td>
							<td></td>
							<td>可自定义一级菜单地址</td>
						</tr>
						<tr>
							<td>activemenuid</td>
							<td>当前页面id</td>
							<td>是</td>
							<td></td>
							<td></td>
							<td>当前页面id</td>
						</tr>
					</tbody>
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
            $("#tagId2").menunav({
                homeurl:"<%=basePath %>index/home.xhtml",
                menuurl:"<%=basePath %>index.xhtml",
                activemenuid:"home"
            });
        });
	</script>
</body>
</html>