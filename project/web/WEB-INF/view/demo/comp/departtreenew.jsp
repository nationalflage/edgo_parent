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
	<title>easyui的单位部门树</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>单位部门树--普通方式</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>提供单位、部门及单位部门混在一起的树形层级结构页面展示；
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;ul class="easyui-tree" id="ot1" data-options="orgtree:true,departtype:'1'" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="ot1" data-options="orgtree:true,departtype:'1'" style="margin-left: 45px"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#ot1').tree('getSelected').id;
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#ot1').tree('getSelected').text;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>
									&lt;ul id="ot2">&lt;/ul>
									<pre>
			$("#ot2").tree({
				orgtree:true,
				rootid:"110",
				onClick:function(node){
					alert(node.id);
				}
			});
									</pre>
								</p>
								<p>效果预览：</p>
								<ul id="ot2" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树</strong>
								<p>
									&lt;ul class="easyui-tree" id="ot3" data-options="orgtree:true,checkbox:true,departtype:'1'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="ot3" data-options="orgtree:true,checkbox:true,departtype:'1'" style="margin-left: 45px"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal3()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#ot3').tree('getCheckedValues');
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框的只读树</strong>
								<p>
									&lt;ul class="easyui-tree" id="ot4" data-options="orgtree:true,checkbox:true,readonly:true">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="ot4" data-options="orgtree:true,checkbox:true,readonly:true" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>值的回显</strong>
								<p>
									&lt;ul class="easyui-tree" id="ot9" data-options="orgtree:true,checkbox:true,checkedvalue:'a11c81eeba02402e90d3dfb1b0fabd63',departtype:'1'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="ot9" data-options="orgtree:true,checkbox:true,checkedvalue:'a11c81eeba02402e90d3dfb1b0fabd63',departtype:'1'" style="margin-left: 45px"></ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>单位部门树--下拉列表方式</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;input class="hy-orgtree" id="ot5" departtype="1"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="ot5" data-options="orgtree:true,departtype:'1'"/>
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#ot5').combotree('tree').tree('getSelected').id
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点text" onclick="getText2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#ot5').combotree('tree').tree('getSelected').text
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>
									&lt;input id="ot5" />
									<pre>
				$("#ot6").combotree({
					orgtree:true,
					rootid:"110"
				});
									</pre>
								</p>
								<p>效果预览：</p>
								<p>
									<input id="ot6" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树：</strong>
								<p>
									&lt;input class="easyui-combotree" id="ot7" data-options="orgtree:true,departtype:'1',multiple:true"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="ot7" data-options="orgtree:true,departtype:'1',multiple:true" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>回显值</strong>
								<p>
									&lt;input class="easyui-combotree" id="ot8" data-options="orgtree:true,departtype:'1',checkedvalue:'a11c81eeba02402e90d3dfb1b0fabd63'"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="ot8" data-options="orgtree:true,departtype:'1',checkedvalue:'a11c81eeba02402e90d3dfb1b0fabd63'"/>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>单位部门树--属性说明</b></h1>
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
							<td>departtype</td>
							<td>部门类型</td>
							<td>否</td>
							<td>2</td>
							<td></td>
							<td>1 单位，2 部门</td>
						</tr>
						<tr>
							<td>rootid</td>
							<td>根节点id</td>
							<td>否</td>
							<td>当前用户所属单位编码</td>
							<td></td>
							<td>传参此值，以此值为根，否则取当前用户所属单位编码为根</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
        $(function () {
            $("#ot2").tree({
                orgtree:true,
                rootid:"110",
                onClick:function(node){
                    alert(node.id);
                }
            });
            $("#ot6").combotree({
                orgtree:true,
                rootid:"110"
            });
        });
        function getVal(){
            var ttt=$('#ot1').tree('getSelected').id;
            alert(ttt)
        }
        function getText(){
            var ttt=$('#ot1').tree('getSelected').text;
            alert(ttt)
        }
        function getVal3(){
            var ttt=$('#ot3').tree('getCheckedValues');
            alert(ttt);
        }
        function getVal2() {
            var t = $('#ot5').combotree('tree');	// get the tree object
            var n = t.tree('getSelected');		// get selected node
            alert(n.id);
        }
        function getText2() {
            var t = $('#ot5').combotree('tree');	// get the tree object
            var n = t.tree('getSelected');		// get selected node
            alert(n.text);
        }
	</script>
</body>
</html>