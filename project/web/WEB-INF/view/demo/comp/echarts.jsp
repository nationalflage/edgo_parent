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
	<title>echarts</title>
	<style>
		.detail-list1 td{color:#333;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>示例--Echarts</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>为应用系统提供柱图、饼图、折线图的展现支持。</td>
						</tr>
						<tr>
							<td><strong>依赖：</strong>&lt;script  src="<%=basePath%>js/echarts.min.js">&lt;/script></td>
						</tr>
						<tr>
							<td><strong>调用方式1：</strong>
								<p style="margin-left:45px;">
									&lt;div class="hy-echarts" id="tagId1" code="02" style="width: 600px; height: 400px;">&lt;/div>
								</p>
								<p style="margin-left:45px;">
									效果预览：<br>
									<div class="hy-echarts" id="tagId1" code="02" style="width: 600px; height: 400px;"></div>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p style="margin-left:45px;">&lt;div id="tagId2" style="width: 600px; height: 400px;">&lt;/div></p>
								<pre>
			$("#tagId2").echarts({
				code:'02'
			});
								</pre>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;"><div id="tagId2" style="width: 600px; height: 400px;"></div></p>
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
							<td>code</td>
							<td>后台配置的echarts定义的编码</td>
							<td>是</td>
							<td></td>
							<td>后台 pub_echarts 表定义的编码</td>
							<td></td>
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
	<script src="<%=basePath%>js/echarts.min.js"></script>
	<script>
		$(function () {
            $("#tagId2").echarts({
                code:'02'
            });
        });
	</script>
</body>
</html>