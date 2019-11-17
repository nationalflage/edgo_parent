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
	<title>验证码</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>验证码</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>使用org.patchca组件生成验证码,数字加字母、干扰线。
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1</strong>
								<p>
									&lt;img class="hy-checkcode"/>
								</p>
								<p>效果预览：</p>
								<p>
									<img class="hy-checkcode"/>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2</strong>
								<p>
									&lt;img id="ck" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$("#ck").checkcode();
								</p>
								<p>效果预览：</p>
								<p>
									<img id="ck" />
								</p>
								<script>
	                                $("#ck").checkcode();
								</script>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
