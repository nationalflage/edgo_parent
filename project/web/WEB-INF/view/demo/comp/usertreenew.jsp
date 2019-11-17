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
	<title>新人员树</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>人员树--普通方式</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>以占位的形式 提供按单位、部门、单位+部门三种形式的层级结构人员展示；展现时暂不支持数据权限过滤</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;ul class="easyui-tree" id='tagId1' data-options="usertree:true,departtype:'1'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id='tagId1' data-options="usertree:true,departtype:'1'" style="margin-left: 40px;"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;ul id='tagId2' >&lt;/ul></p>
								<pre>
	$("#tagId2").tree({
		usertree:true,
		departtype:'2',
		onClick: function(node){
			alert(node.id);
		}
	});
								</pre>
								<p>效果预览：</p>
								<ul id='tagId2' style="margin-left: 40px;"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId2').tree('getSelected').id;
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId2').tree('getSelected').text;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>在人员前显示复选框：</strong>
								<p>
									&lt;ul class="easyui-tree" id='tagId5' data-options="usertree:true,checkbox:true">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id='tagId5' data-options="usertree:true,departtype:'1',checkbox:true,checkedvalue:'83e83c6986ca490db63e3635b23eec67'" style="margin-left: 40px;"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal3()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId5').tree('getSelected').id;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>rootid为110：</strong>
								<p>
									&lt;ul class="easyui-tree" id='tagId6' data-options="usertree:true,rootid:'110'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id='tagId6' data-options="usertree:true,rootid:'110'" style="margin-left: 40px;"></ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>人员树--下拉列表方式</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title"><strong>基本信息</strong></h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>以下拉树形式提供按单位、部门两种形式的层级结构人员展示；仅单选；
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId3" data-options="usertree:true,departtype:'1'" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId3" data-options="usertree:true,departtype:'1'" />
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId3').combotree('tree').tree('getSelected').id;
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId3').combotree('tree').tree('getSelected').text;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;input id="tagId4"/></p>
								<pre>
	 $("#tagId4").combotree({
		usertree:true,
		departtype:'2',
		rootid:'110',
		checkedvalue:'83e83c6986ca490db63e3635b23eec67'
	});
								</pre>
								<p>效果预览：</p>
								<p><input id="tagId4" /></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>departtype为1：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId7" data-options="usertree:true,departtype:'1'" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId7" data-options="usertree:true,departtype:'1'" />
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>人员树--属性说明</b></h1>
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
							<td>1 仅单位  2 仅部门 3 单位和部门混合</td>
							<td></td>
						</tr>
						<tr>
							<td>rootid</td>
							<td>根节点</td>
							<td>否</td>
							<td>当前登录用户所属单位编码</td>
							<td>110</td>
							<td>根节点单位编码</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        $(function () {
            $("#tagId2").tree({
                usertree:true,
                departtype:'2',
                onClick: function(node){
                    alert(node.id);
                }
            });
            $("#tagId4").combotree({
                usertree:true,
                departtype:'2',
                rootid:'110',
                checkedvalue:'83e83c6986ca490db63e3635b23eec67'
            });
        });
        function getVal(){
            var ttt=$('#tagId2').tree('getSelected').id;
            alert(ttt)
        }
        function getText(){
            var ttt=$('#tagId2').tree('getSelected').text;
            alert(ttt)
        }
        function getVal3(){
            var ttt=$('#tagId5').tree('getCheckedValues');
            alert(ttt)
        }
        function getVal2() {
            var t = $('#tagId3').combotree('tree');
            var n = t.tree('getSelected');
            alert(n.id);
        }
        function getText2() {
            var t = $('#tagId3').combotree('tree');
            var n = t.tree('getSelected');
            alert(n.text);
        }
	</script>
</body>
</html>