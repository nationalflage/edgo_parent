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
	<title>手风琴</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td div.detail{ margin: 10px 0 10px 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
    <div class="content">
		<h1 class="public-title"><b>手风琴</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>折叠面板提供多个面板（panel），同时显示一个或多个面板（panel）。每个面板都有展开和折叠的内建支持。点击面板头部可展开或折叠面板主体。面板内容可通过 ajax 指定 'href' 属性来加载。用户可定义被选中的面板。如果未指定，则默认选中第一个。<br/>
								<strong>备注：</strong><span class="red">只推荐通过标记创建折叠面板，添加 'easyui-accordion'这个类，否则样式显示可能会有问题</span>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式</strong>
								<p>
									<pre>
	&lt;div class="easyui-accordion" style="width:500px;height:300px;">
		&lt;div title="关于">
			关于
		&lt;/div>
		&lt;div title="帮助">
			帮助
		&lt;/div>
		&lt;div title="其他">
			其他
		&lt;/div>
	&lt;/div>
									</pre>
								</p>
								<p>效果预览：</p>
								<div class="detail">
									<div class="easyui-accordion" id="aa" style="width:500px;height:300px;">
										<div title="关于">
											关于
										</div>
										<div title="帮助">
											帮助
										</div>
										<div title="其他">
											其他
										</div>
									</div>
								</div>
									<pre>
		$('#aa').accordion('add', {
			title: 'New Title',
			content: 'New Content',
			selected: false
		});
									</pre>
								<p>
									<input class="btn btn-info" type="button" value="添加一个面板" onclick="addPanel()" />
								</p>
								<p>
									<input class="btn btn-info" type="button" value="移除一个面板" onclick="removePanel()" />&nbsp;&nbsp;&nbsp;&nbsp;$("#aa").accordion("remove",0);
								</p>
								<p>
									<input class="btn btn-info" type="button" value="选择指定的面板" onclick="selectPanel()" />&nbsp;&nbsp;&nbsp;&nbsp;$('#aa').accordion('select',"帮助");
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取一个面板" onclick="getPanel()" />&nbsp;&nbsp;&nbsp;&nbsp;var aa=$('#aa').accordion('getSelected',0);
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中面板的index" onclick="getPanelIndex()" />&nbsp;&nbsp;&nbsp;&nbsp;var p = $('#aa').accordion('getSelected');  if (p){var index = $('#aa').accordion('getPanelIndex', p);}
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>展开多个面板，改变默认展开的面板</strong>
								<p>
									&lt;div class="easyui-accordion" data-options="multiple:true,selected:1" style="width:500px;">&lt;/div>
								</p>
								<p>效果预览：</p>
								<div class="detail">
									<div class="easyui-accordion" data-options="multiple:true,selected:1" style="width:500px;">
										<div title="关于">
											关于
										</div>
										<div title="帮助">
											帮助
										</div>
										<div title="其他">
											其他
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<strong>折叠面板容器的尺寸适应它的父容器。</strong>
								<p>
									&lt;div class="easyui-accordion"  data-options="fit:true" style="width:500px;height:300px;"> &lt;/div>
								</p>
								<p>效果预览：</p>
								<div class="detail">
									<div class="easyui-accordion" data-options="fit:true" style="width:500px;height:300px;">
										<div title="关于">
											关于
										</div>
										<div title="帮助">
											帮助
										</div>
										<div title="其他">
											其他
										</div>
									</div>
								</div>
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
						<td>fit</td>
						<td>设置为 true，就使折叠面板容器的尺寸适应它的父容器</td>
						<td>否</td>
						<td>false</td>
						<td>true / false</td>
						<td></td>
					</tr>
					<tr>
						<td>multiple</td>
						<td>设置为 true，则可同时展开多个面板</td>
						<td>否</td>
						<td>false</td>
						<td>true / false</td>
						<td></td>
					</tr>
					<tr>
						<td>selected</td>
						<td>初始化选中的面板索引</td>
						<td>否</td>
						<td>0</td>
						<td></td>
						<td>面板索引值</td>
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
						<th width="20%">方法名</th>
						<th width="25%">中文含义</th>
						<th width="10%">参数</th>
						<th width="15%">返回值</th>
						<th width="30%">使用示例</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>options</td>
						<td>返回折叠面板的选项</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“options”)</td>
					</tr>
					<tr>
						<td>resize</td>
						<td>调整折叠面板的尺寸。</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“resize”)</td>
					</tr>
					<tr>
						<td>getSelected</td>
						<td>获取第一个选中的面板</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“getSelected”)</td>
					</tr>
					<tr>
						<td>select</td>
						<td>选择指定的面板。'which' 参数可以是面板的标题（title）或索引（index）。</td>
						<td>which</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“select”,which)</td>
					</tr>
					<tr>
						<td>getPanel</td>
						<td>获取指定的面板。'which' 参数可以是面板的标题（title）或索引（index）。</td>
						<td>which</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“getPanel”,which)</td>
					</tr>
					<tr>
						<td>getPanelIndex</td>
						<td>获取指定的面板索引。</td>
						<td>panel</td>
						<td></td>
						<td class="text-left">
							<pre>
var p = $('#aa').accordion('getSelected');
if (p){
	var index = $('#aa').accordion('getPanelIndex', p);
	alert(index);
}
							</pre>
						</td>
					</tr>
					<tr>
						<td>add</td>
						<td>添加一个新的面板。默认情况下，新添加的面板会被选中。如需添加一个未被选中的新面板，请传递 'selected' 属性，并将其设置为 false。</td>
						<td>options</td>
						<td></td>
						<td class="text-left">
							<pre>
$('#aa').accordion('add', {
	title: 'New Title',
	content: 'New Content',
	selected: false
});
							</pre>
						</td>
					</tr>
					<tr>
						<td>remove</td>
						<td>移除指定的面板。'which' 参数可以是面板的标题（title）或索引（index）。</td>
						<td>which</td>
						<td></td>
						<td class="text-left">$(“#accordion”).accordion(“remove”,which)</td>
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
						<td>onSelect</td>
						<td>当面板被选中时触发。</td>
						<td>title,index</td>
						<td class="text-left">
	                        <pre>
$('#aa').accordion({
	onSelect:function (title,index) {
		alert(title);
	}
});
	                        </pre>
						</td>
					</tr>
					<tr>
						<td>onAdd</td>
						<td>当添加一个新面板时触发。</td>
						<td>title,index</td>
						<td class="text-left">
	                        <pre>
$('#aa').accordion({
	onAdd:function (title,index) {
		alert(title);
	}
});
	                        </pre>
						</td>
					</tr>
					<tr>
						<td>onBeforeRemove</td>
						<td>当移除一个面板之前触发，返回 false 就取消移除动作。</td>
						<td>title,index</td>
						<td class="text-left">
	                        <pre>
$('#aa').accordion({
	onBeforeRemove:function (title,index) {
		alert(title);
	}
});
	                        </pre>
						</td>
					</tr>
					<tr>
						<td>onRemove</td>
						<td>当移除一个面板时触发。</td>
						<td>title,index</td>
						<td class="text-left">
	                        <pre>
$('#aa').accordion({
	onRemove:function (title,index) {
		alert(title);
	}
});
	                        </pre>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
    </div>
	<script>
		function addPanel() {
            $('#aa').accordion('add', {
                title: 'New Title',
                content: 'New Content',
                selected: false
            });
        }
        function removePanel() {
            $("#aa").accordion("remove",0);
        }
        function selectPanel() {
            $('#aa').accordion('select',"帮助");
        }
        function getPanel() {
			var aa=$('#aa').accordion('getSelected',0);
			alert(aa);
        }
        function getPanelIndex() {
            var p = $('#aa').accordion('getSelected');
            if (p){
                var index = $('#aa').accordion('getPanelIndex', p);
                alert(index);
            }
        }
	</script>
</body>
</html>