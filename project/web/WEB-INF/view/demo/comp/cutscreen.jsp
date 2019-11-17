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
	<title>截屏上传</title>
	<style>
		.detail-list1 td{color:#333;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>示例--截屏上传</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>在网页上自定义截取屏幕，生成图片并上传；
								注意：需下载安装截屏控件（自动下载）
							</td>
						</tr>
						<tr>
							<td>
								<strong>依赖：</strong>
								&lt;script src="&lt;%=basePath %>js/component/jquery.md5.js">&lt;/script><br/>
		                        &lt;script src="&lt;%=basePath %>js/component/niuniu/niuniucapture.js">&lt;/script><br/>
								&lt;script src="&lt;%=basePath %>js/component/niuniu/capturewrapper.js">&lt;/script>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p style="margin-left:45px;">
									&lt;input class="hy-cutscreen" id="tagId1" type="button" value="截屏" />
								</p>
								<p style="margin-left:45px;">
									效果预览：<br>
									<input class="hy-cutscreen" id="tagId1" type="button" value="截屏" />
								</p>
							</td>
						</tr>		
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p style="margin-left:45px;">&lt;input id="tagId2" type="button" value="截屏" /></p>
								<pre>
			$('#tagId2'). cutscreen({});
								</pre>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;"><input id="tagId2" type="button" value="截屏" /></p>
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
	<script src="<%=basePath %>js/component/jquery.md5.js"></script>
	<script src="<%=basePath %>js/component/niuniu/niuniucapture.js"></script>
	<script src="<%=basePath %>js/component/niuniu/capturewrapper.js"></script>
	<script src="<%=basePath %>js/component/niuniu/jquery.json-2.3.min.js"></script>
	<script>
		$(function () {
            $('#tagId2'). cutscreen({});
        });
	</script>
</body>
</html>