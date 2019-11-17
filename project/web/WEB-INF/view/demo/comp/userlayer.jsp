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
	<title>人员层</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>人员层</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>以弹出层的方式选择人员；按单位和按部门展现人，支持多选</td>
						</tr>
						<tr>
							<td><strong>依赖：</strong>无</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;input class='easyui-textbox hy-userlayer' id='tagId1' type='text'/>
								</p>
								<p>
									效果预览：<br>
								<input class='easyui-textbox hy-userlayer' id='tagId1' type='text' />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;input class='easyui-textbox' id='tagId2' type='text'/></p>
								<pre>
		$("#tagId2").userlayer({
			departtype : '2',
			rootid : '010000'
		});
								</pre>
								<p>效果预览：</p>
								<p><input class='easyui-textbox' id='tagId2' type='text'  /></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>submitcode测试实例</strong>
								<p>
									&lt;input class='easyui-textbox hy-userlayer' id='tagId3' type='text' submitcode="userName"/>
								</p>
								<p>
									效果预览：<br>
									<input class='easyui-textbox hy-userlayer' id='tagId3' type='text' submitcode="userName" /><br/>
									<input class="btn btn-info" type="button" value="弹出当前输入框的name" onclick="alert($('#tagId3_submit').attr('name'))"/>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>getValue方法</strong>
								<p>
									&lt;input class="btn btn-info" type="button" value="getValue" onclick="showValue()"/>
								</p>
								<pre>
		function showValue() {
            var value=$('#tagId1').userlayer('getValue');
            alert(value);
        }
								</pre>
								<p>
									<input class="btn btn-info" type="button" value="getValue" onclick="showValue()"/>
								</p>
							</td>
						</tr>
						<tr>
							<td><strong>getText方法</strong>
								<p>
									&lt;input class="btn btn-info" type="button" value="getText" onclick="showText()"/>
								</p>
								<pre>
		function showText() {
             var text=$('#tagId1').userlayer('getText');
            alert(text);
        }
								</pre>
								<p>
									<input class="btn btn-info" type="button" value="getText" onclick="showText()"/>
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
							<td>departtype</td>
							<td>展示类型</td>
							<td>是</td>
							<td></td>
							<td>1单位 2部门 </td>
							<td></td>
						</tr>
						<tr>
							<td>rootid</td>
							<td>根节点</td>
							<td>否</td>
							<td>当前登录用户所属单位编码</td>
							<td>010000</td>
							<td>根节点单位编码</td>
						</tr>
						<tr>
							<td>submitcode</td>
							<td>所需向后台提交的name值</td>
							<td>否</td>
							<td></td>
							<td>userName</td>
							<td>后台收到的Model中将接收到userName的值</td>
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
					<tbody>
						<tr>
							<td>getValue</td>
							<td>取选中节点id串，以逗号分隔</td>
							<td></td>
							<td>,110,</td>
							<td class="text-left">$('#tagId').userlayer('getValue');</td>
						</tr>
						<tr>
							<td>getText</td>
							<td>取选中节点name串，以逗号分隔</td>
							<td></td>
							<td>,人员A,人员B,</td>
							<td class="text-left">$('#tagId').userlayer('getText');</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function () {
            $("#tagId2").userlayer({
                departtype : '1',
                rootid : '010000'
            });
        });
        function showValue() {
            var value=$('#tagId1').userlayer('getValue');
            alert(value);
        }
        function showText() {
             var text=$('#tagId1').userlayer('getText');
            alert(text);
        }
	</script>
</body>
</html>