<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>图片上传</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
		.detail-list1 tbody td p.detail{ margin: 5px 0 5px 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<!-- 图片上传组件 -->
	<div class="content">
		<h1 class="public-title"><b>图片上传组件</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>图片上传组件支持IE8及以上浏览器的图片缩略图适配大小，支持点击放大预览
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式一</strong>
								<p class="detail">
									&lt;div class="hy-imgupload" dataRight="0" vchr_domain="undefined" vchr_entityid="undefined">&lt;/div>
								</p>
								<p class="detail">效果预览：</p>
								<div class="hy-imgupload" dataRight="0" vchr_domain="undefined" vchr_entityid="undefined" style="margin-left:45px;"></div>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式二</strong>
								<p class="detail">
									&lt;div id="image2">&lt;/div>
								</p>
								<pre>
		$("#image2").imgupload({
			vchr_domain:"test",
			vchr_entityid:"undefined",
			imageWidth:"80",
			imageHeight:"80"
		});
								</pre>
								<p class="detail">效果预览：</p>
								<div id="image2" style="margin:10px 0 0 45px;"></div>
							</td>
						</tr>
						<tr>
							<td>
								<strong>单纯展示图片</strong>
								<p class="detail">
									&lt;div class="hy-imgupload" dataRight="0" wordRight="0" vchr_domain="undefined" vchr_entityid="undefined">&lt;/div>
								</p>
								<p class="detail">效果预览：</p>
								<div class="hy-imgupload" dataRight="0" wordRight="0" vchr_domain="undefined" vchr_entityid="undefined" style="margin-left:45px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
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
						<td>vchr_domain</td>
						<td>一级目录</td>
						<td>是</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>vchr_entityid</td>
						<td>业务id</td>
						<td>是</td>
						<td></td>
						<td></td>
						<td>相关模块的业务id,使用的时候需要动态传入，具体就是一条记录的主键id</td>
					</tr>
					<tr>
						<td>imageWidth</td>
						<td>展示图片的宽度</td>
						<td>否</td>
						<td>100</td>
						<td></td>
						<td>整数，不带像素单位</td>
					</tr>
					<tr>
						<td>imageHeight</td>
						<td>展示图片的高度</td>
						<td>否</td>
						<td>100</td>
						<td></td>
						<td>整数，不带像素单位</td>
					</tr>
					<tr>
						<td>dataRight</td>
						<td>数据权限</td>
						<td>否</td>
						<td>1</td>
						<td>1或0</td>
						<td>0没有数据权限（不显示删除选项，不显示上传按钮）；1有数据权限（显示删除选项，显示上传按钮）</td>
					</tr>
					<tr>
						<td>wordRight</td>
						<td>是否展示图片名称，大小</td>
						<td>否</td>
						<td>1</td>
						<td>1或0</td>
						<td>0不展示图片名称，大小；1展示图片名称，大小</td>
					</tr>
					<tr>
						<td>maxFileCount</td>
						<td>上传累计最大数量</td>
						<td>否</td>
						<td>5</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>nameSuffix</td>
						<td>允许上传文件的类型，用”,”分割</td>
						<td>否</td>
						<td>png,jpg,jpeg</td>
						<td></td>
						<td>jpg	文件上传类型，多个类型用逗号分隔</td>
					</tr>
					<tr>
						<td>osmFlag</td>
						<td>是否生成大中小三种图（只在分布式存储有效）</td>
						<td>否</td>
						<td>0</td>
						<td></td>
						<td>分布式存储，是否生成大中小三种图1：是，0：否</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script src="<%=basePath %>js/ajaxfileupload.js" ></script>
	<script>
		$(function () {
			$("#image2").imgupload({
                vchr_domain:"test",
                vchr_entityid:"undefined",
                imageWidth:"80",
                imageHeight:"80"
			});
        });
	</script>
</body>
</html>