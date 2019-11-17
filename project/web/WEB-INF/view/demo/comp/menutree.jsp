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
	<title>菜单树</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>菜单树</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>以树的形式展现菜单的上下级关系。包括普通树和复选框树</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;ul class="hy-menutree">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" style="margin-left: 45px" ></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;ul class="hy-menutree" id="tree2">&lt;/ul></p>
								<pre>
			$("#tree2").menutree({
				checkedvalue:"sms",
				onclick:"switchRight",
				showAll:"1",
				applyRight:"0"
			});
			function switchRight(node){
				alert(node.id);
			}
								</pre>
								<p>效果预览：</p>
								<ul class="hy-menutree" id="tree2" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>显示操作功能的树节点</strong>
								<p>
									&lt;ul class="hy-menutree" showOperate="1">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" id="bbb" showOperate="1" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树与值的回显</strong>
								<p>
									&lt;ul class="hy-menutree" checkbox="1">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" id="aa" checkbox="1" checkedvalue=",02,0201,020101,020102,sms," style="margin-left: 45px"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中value值" onclick="switchRight2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$("#aa").menutree("getCheckedValues");
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树只读标志</strong>
								<p>
									&lt;ul class="hy-menutree" checkbox="1" isreadonly="1" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" checkbox="1" isreadonly="1" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>显示所有菜单</strong>
								<p>
									&lt;ul class="hy-menutree" showAll="1">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" showAll="1" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>只显示当前用户所拥有权限的菜单</strong>
								<p>
									&lt;ul class="hy-menutree" applyRight="1" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" applyRight="1" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>要展示的子系统的菜单</strong>
								<p>
									&lt;ul class="hy-menutree" showSystemId="console" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="hy-menutree" showSystemId="console" style="margin-left: 45px"></ul>
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
							<td>checkedvalue</td>
							<td>复选框树的选中值</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>可以是菜单id，子系统id，操作的id</td>
						</tr>
						<tr>
							<td>showOperate</td>
							<td>在树中显示操作功能的树节点</td>
							<td>否</td>
							<td>0</td>
							<td>0或1</td>
							<td>0：不显示操作节点，1：显示操作节点</td>
						</tr>
						<tr>
							<td>checkbox</td>
							<td>是否为复选框树标志</td>
							<td>否</td>
							<td>0</td>
							<td>0或1</td>
							<td>0：非复选框树1：复选框树</td>
						</tr>
						<tr>
							<td>isreadonly</td>
							<td>复选框树只读标志</td>
							<td>否</td>
							<td>0</td>
							<td>0或1</td>
							<td>0：不是只读；1 ：只读</td>
						</tr>
						<tr>
							<td>onclick</td>
							<td>菜单树的点击事件</td>
							<td>否</td>
							<td></td>
							<td>自定义函数</td>
							<td>自定义函数的参数为node</td>
						</tr>
						<tr>
							<td>showAll</td>
							<td>显示所有菜单</td>
							<td>否</td>
							<td>0</td>
							<td>0或1</td>
							<td>0:只展示有效的菜单；1：展示所有菜单</td>
						</tr>
						<tr>
							<td>applyRight</td>
							<td>只显示当前用户所拥有权限的菜单</td>
							<td>否</td>
							<td>1</td>
							<td>0或1</td>
							<td>0:展示所有菜单；1：只显示当前用户所拥有权限的菜单</td>
						</tr>
						<tr>
							<td>showSystemId</td>
							<td>要展示的子系统的id，多个子系统之间使用逗号‘，’分割</td>
							<td>否</td>
							<td></td>
							<td>0或1</td>
							<td>要展示的子系统的id，多个子系统之间使用逗号‘，’分割，如果属性为空，则全部展示</td>
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
							<td>getCheckedValues</td>
							<td>获取选中树节点的代码值</td>
							<td>空</td>
							<td>20102</td>
							<td>返回的值以逗号“”,“”分割，子系统在其值前面加1 ，菜单加 2 ，操作加3</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(function(){
            $("#tree2").menutree({
                checkedvalue:"sms,",
                onclick:"switchRight",
                showAll:"1",
                applyRight:"0"
            });
		});
        function switchRight(node){
            alert(node.id);
        }
		function switchRight2() {
          alert($("#aa").menutree("getCheckedValues"));
        }
	</script>
</body>
</html>