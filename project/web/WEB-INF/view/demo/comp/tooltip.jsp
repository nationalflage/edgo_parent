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
	<title>工具提示</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
		.detail-list1 tbody td p{ margin:5px 0 5px 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
    <div class="content">
		<h1 class="public-title"><b>工具提示</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>当用户移动鼠标指针在某个元素上时，出现提示信息窗口用来显示额外信息。提示内容可以包含任何来自页面的或者通过 ajax 生成的 html 元素。
							</td>
						</tr>
						<tr>
							<td>
								<strong>更新提示框</strong>
								<p>
									&lt;a class="easyui-tooltip" id="tt" data-options="content:'提示信息'" href="javascript:void(0);" style="color: #2acccc;">Hover me&lt; /a> to display tooltip.
								</p>
								<p>效果预览：</p>
								<p>
									<a class="easyui-tooltip" id="tt" data-options="content:'提示信息'" href="javascript:void(0);" style="color: #2acccc;">Hover me</a> to display tooltip.
								</p>
								<p>
									<a class="btn btn-info" href="javascript:void(0);" onclick="getTip();">返回提示对象</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$("#tt").tooltip("tip");
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式二</strong>
								<p>
									&lt;a id="dd" href="javascript:void(0)">鼠标放到这里&lt;/a>
								</p>
								<pre>
	$('#dd').tooltip({
		position: 'right',
		content: 'This is the tooltip message.',
		onUpdate:function (content) {
			alert(content);
		}
	});
								</pre>
								<p>效果预览：</p>
								<p>
									<a id="dd" href="javascript:void(0)" style="color: #2acccc;">鼠标放到这里</a>
								</p>
								<p>
									<a class="btn btn-info" href="javascript:void(0);" onclick="updateTip();">更新提示框</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$("#dd").tooltip("update","更新后的提示内容")
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>随着鼠标移动的工具提示信息</strong>
								<p>
									&lt;a class="easyui-tooltip" data-options="trackMouse:true,content:'移动的提示信息'" href="javascript:void(0);">随着鼠标移动的工具提示&lt; /a>
								</p>
								<p>效果预览：</p>
								<p>
									<a class="easyui-tooltip" data-options="trackMouse:true,content:'移动的提示信息'" href="javascript:void(0);" style="color: #2acccc;">随着鼠标移动的工具提示</a>
								</p>
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
						<td>position</td>
						<td>提示框位置</td>
						<td>否</td>
						<td>bottom</td>
						<td></td>
						<td>'left'、'right'、'top'、'bottom'</td>
					</tr>
					<tr>
						<td>content</td>
						<td>提示框内容。</td>
						<td>是</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>trackMouse</td>
						<td>如果设置为 true，提示框会随着鼠标移动</td>
						<td>否</td>
						<td>false</td>
						<td>true/false</td>
						<td></td>
					</tr>
					<tr>
						<td>showEvent</td>
						<td>引发提示框出现的事件</td>
						<td>否</td>
						<td>mouseenter</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>hideEvent</td>
						<td>引发提示框消失的事件</td>
						<td>否</td>
						<td>mouseleave</td>
						<td></td>
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
				<tbody>
					<tr>
						<td>options</td>
						<td>返回属性选项</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#tooltip”).tooltip(“options”)</td>
					</tr>
					<tr>
						<td>tip</td>
						<td>返回提示（tip）对象</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#tooltip”).tooltip(“tip”)</td>
					</tr>
					<tr>
						<td>update</td>
						<td>更新提示框内容</td>
						<td>content</td>
						<td></td>
						<td class="text-left">$(“#tooltip”).tooltip(“update”,"提示内容")</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 事件 -->
		<div class="detail-list">
			<h3 class="title"><strong>事件</strong></h3>
			<table class="detail-list2">
				<thead>
					<tr>
						<th width="10%">事件名</th>
						<th width="35%">中文含义</th>
						<th width="20%">参数</th>
						<th width="35%">使用示例</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>onUpdate</td>
						<td>当提示框内容更新时触发</td>
						<td>content</td>
						<td class="text-left">
							<pre>
		onUpdate:function (content) {
			alert(content);
		}
							</pre>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
    </div>
	<script>
		$(function () {
            $('#dd').tooltip({
                position: 'right',
                content: 'This is the tooltip message.',
                onUpdate:function (content) {
                    alert(content);
                }
            });
        });
		function updateTip() {
            $("#dd").tooltip("update","更新后的提示内容")
        }
        function getTip(){
		    var tt=$("#tt").tooltip("tip");
		    alert(tt);
		}
	</script>
</body>
</html>