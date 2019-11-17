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
	<title>树组件统一必读</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>树组件统一属性方法，框架的4种树都是基于easyUI树的基础上实现的，这4种树都可以使用easyUI自带的方法，这里就不一一列举了</b></h1>
		<div class="detail">
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
							<td>menutree</td>
							<td>菜单树的标识</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>如果使用菜单树此项必填，且值为true</td>
						</tr>
						<tr>
							<td>usertree</td>
							<td>人员树的标识</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>如果使用人员树此项必填，且值为true</td>
						</tr>
						<tr>
							<td>orgtree</td>
							<td>单位部门树的标识</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>如果使用单位部门树此项必填，且值为true</td>
						</tr>
						<tr>
							<td>customtree</td>
							<td>自定义树的标识</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>如果使用自定义树此项必填，且值为true</td>
						</tr>
						<tr>
							<td>url</td>
							<td>获取远程数据的URL</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>animate</td>
							<td>定义当节点展开折叠时是否显示动画效果</td>
							<td>否</td>
							<td>true</td>
							<td>true false</td>
							<td>默认节点展开折叠有动画效果，可以去掉</td>
						</tr>
						<tr>
							<td>checkbox</td>
							<td>定义是否在每个节点前边显示复选框</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>该属性显示复选框与否只针对ul平铺方式的树</td>
						</tr>
						<tr>
							<td>multiple</td>
							<td>定义是否在每个节点前边显示复选框</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>该属性显示复选框与否只针对input输入框类型的树</td>
						</tr>
						<tr>
							<td>readonly</td>
							<td>定义复选框树是否只读</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td>该属性只针对ul平铺方式的复选框树的只读</td>
						</tr>
						<tr>
							<td>checkedvalue</td>
							<td>树的回显，传的值是id值</td>
							<td>否</td>
							<td></td>
							<td>110，110001</td>
							<td>如果是复选框树，可传多个值，将传的值进行级联勾选；如果是普通树，只需要传一个值，将该值选中</td>
						</tr>
						<tr>
							<td>cascadeCheck</td>
							<td>定义是否级联检查</td>
							<td>否</td>
							<td>true</td>
							<td>true false</td>
							<td>该项主要针对复选框树，如果不想级联检查，可以设为false</td>
						</tr>
						<tr>
							<td>onlyLeafCheck</td>
							<td>是否只在叶节点前显示复选框</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
							<td></td>
						</tr>
						<tr>
							<td>editable</td>
							<td>定义用户是否可以直接往文本域中输入文字。</td>
							<td>否</td>
							<td>false</td>
							<td>true false</td>
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
							<th width="15%">方法名</th>
							<th width="25%">中文含义</th>
							<th width="15%">参数</th>
							<th width="15%">返回值</th>
							<th width="30%">使用示例</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>options</td>
							<td>返回树的选项</td>
							<td>无</td>
							<td></td>
							<td class="text-left">$(“#tree”).tree(“options”) <br/> $(“#tree”).combotree(“options”)</td>
						</tr>
						<tr>
							<td>getSelected</td>
							<td>获取选中的节点并返回它，如果没有选中节点，则返回 null。</td>
							<td>无</td>
							<td></td>
							<td class="text-left">获取选中的id值：$(“#tree”).tree(“getSelected”).id；<br/>获取选中的文本值：$(“#tree”).tree(“getSelected”).text
								<br/> input类型获取选中值  $('#tree').combotree('tree').tree('getSelected').id
							</td>
						</tr>
						<tr>
							<td>getCheckedValues</td>
							<td>获取复选框树勾选的节点并返回它，</td>
							<td>无</td>
							<td></td>
							<td class="text-left">ul类型获取选中的id值：$(“#tree”).tree(“getCheckedValues”)；<br/>
								input类型获取选中值  $('#tree').combotree('tree').tree('getCheckedValues')
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 事件 -->
			<div class="detail-list">
				<h3 class="title"><strong>事件</strong></h3>
				<p class="red">很多事件的回调函数需要 'node' 参数，它包括下列属性：id：绑定到节点的标识值。text：要显示的文本。checked：节点是否被选中。state：节点状态，'open' 或 'closed'。attributes：绑定到节点的自定义属性。target：目标的 DOM 对象。</p>
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
							<td>onClick</td>
							<td>当用户点击一个节点时触发。</td>
							<td>node</td>
							<td class="text-left">
								<pre>
$('#tt').tree({
	onClick: function(node){
		alert(node.id);
	}
});
								</pre>
							</td>
						</tr>
						<tr>
							<td>onCheck</td>
							<td>当用户点击复选框时触发。</td>
							<td>node，checked</td>
							<td class="text-left">
								<pre>
$('#tt').tree({
	onClick: function(node,checked){
		alert(node.id);
	}
});
								</pre>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>