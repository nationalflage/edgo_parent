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
	<title>常用组件</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>单选复选</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>以下这两种方式需要放在&lt;table>&lt;/table>标签中</td>
						</tr>
						<tr>
							<td>
								<strong>radio单选</strong>
								<p style="margin-left:45px;">
									&lt;span class="hy-radio" id="111" name="sex1" options="男:M;女:G" checkoptions="G">&lt;/span>
								</p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;">
									<span class="hy-radio" id="111" name="sex1" options="男:M;女:G" checkoptions="G"></span>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>checkbox复选</strong>
								<p style="margin-left:45px;">&lt;span class="hy-checkbox" id="113" name="sex111" options="男:M;女:G" checkoptions="G,M">&lt;/span></p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;">
									<span class="hy-checkbox" id="113" name="sex111" options="男:M;女:G" checkoptions="G,M"></span>
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
							<th width="5%">是否必填</th>
							<th width="15%">默认值（非必填项）</th>
							<th width="20%">值集/示例</th>
							<th width="30%">备注</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Class</td>
							<td>判断radio组件标识</td>
							<td>是</td>
							<td></td>
							<td>hy-radio</td>
							<td></td>
						</tr>
						<tr>
							<td>Name</td>
							<td>radio名称</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Id</td>
							<td>Radio id</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Options</td>
							<td>Radio组件选项及对应的值</td>
							<td>是</td>
							<td></td>
							<td></td>
							<td>Radio组件有哪些选项</td>
						</tr>
						<tr>
							<td>Checkoptions</td>
							<td>被选中选项的值</td>
							<td>是</td>
							<td></td>
							<td></td>
							<td>Radio组件那些选项被选中</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>