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
	<title>二维码</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>二维码</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>使用com.swetake.util.Qrcode组件生成二维码。
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式一</strong>
								<p>
									&lt;img class="hy-qrcode" text="二维码内容" />
								</p>
								<p>效果预览：</p>
								<p>
									<img class="hy-qrcode" text="二维码内容" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式二</strong>
								<p>
									&lt;img id="qr" />
								</p>
								<pre>
		$("#qr").qrcode({
			text:"测试"
		});
								</pre>
								<p>效果预览：</p>
								<p>
									<img id="qr">
									<script>
	                                    $("#qr").qrcode({
	                                        text:"测试"
	                                    });
									</script>
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
					<tbody>
						<tr>
							<td>text</td>
							<td>二维码内容</td>
							<td>是</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>size</td>
							<td>二维码尺寸</td>
							<td>否</td>
							<td>7</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
