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
	<link rel="stylesheet" href="<%=basePath %>js/component/ztree/css/zTreeStyle/zTreeStyle.css">
	<title>人员树</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>示例--人员树--场景A</b></h1>
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
								<strong>依赖：</strong>
								<p>&lt;link rel="stylesheet" href="&lt;%=basePath %>js/component/ztree/css/zTreeStyle/zTreeStyle.css"></p>
								<p>&lt;script src="&lt;%=basePath %>js/component/ztree/jquery.ztree.all.min.js">&lt;/script></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;ul class="ztree hy-usertree" id='tagId1' departtype="1">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="ztree hy-usertree" id='tagId1' departtype="1" style="margin-left: 40px;"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;ul class="ztree" id='tagId2'>&lt;/ul></p>
								<pre>
		$("#tagId2").usertree({
			departtype:'2',
			multiselect:'1',
			checkedvalue:',b2f1d007576643e0bc931a1a86ea9e58,',
			onnodeclick:function(event, treeId, treeNode, clickFlag){
				$.hyjx.alert('系统信息',treeNode.name);
			}
		});
								</pre>
								<p>效果预览：</p>
								<ul class="ztree" id='tagId2' style="margin-left: 40px;"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId2').usertree('getValue');
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId2').usertree('getText');
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>departtype为3：</strong>
								<p>
									&lt;ul class="ztree hy-usertree" id='tagId5' departtype="3" onnodeclick="getId">&lt;/ul>
								</p>
								<pre>
		function getId(event, treeId, treeNode, clickFlag){
			$.hyjx.alert('系统信息',treeNode.id);
		}
								</pre>
								<p>效果预览：</p>
								<ul class="ztree hy-usertree" id='tagId5' departtype="3" onnodeclick="getId" style="margin-left: 40px;"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>departtype为3：</strong>
								<p>
									&lt;ul class="ztree hy-usertree" id='tagId6' departtype="3" rootid="110">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="ztree hy-usertree" id='tagId6' departtype="3" rootid="110" style="margin-left: 40px;"></ul>
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
							<td>部门类型</td>
							<td>否</td>
							<td>2</td>
							<td>1 仅单位  2 仅部门 3 单位和部门混合</td>
							<td></td>
						</tr>
						<tr>
							<td>multiselect</td>
							<td>人员是否显示复选框</td>
							<td>否</td>
							<td>0</td>
							<td>1 显示 0 不显示</td>
							<td></td>
						</tr>
						<tr>
							<td>checkedvalue</td>
							<td>选中值</td>
							<td>否</td>
							<td>空串</td>
							<td>,id1,id2,id3,id4,…….</td>
							<td>选中节点code串，以半角逗号分隔</td>
						</tr>
						<tr>
							<td>rootid</td>
							<td>根节点</td>
							<td>否</td>
							<td>当前登录用户所属单位编码</td>
							<td>110</td>
							<td>根节点单位编码</td>
						</tr>
						<tr>
							<td>onnodeclick</td>
							<td>单击回调</td>
							<td>否</td>
							<td></td>
							<td>
								function(event, treeId, treeNode, clickFlag){
									alert(treeNode.name);
								}
							</td>
							<td>单击节点时回调事件</td>
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
							<td class="text-left">$('#tagId').usertree('getValue');</td>
						</tr>
						<tr>
							<td>getText</td>
							<td>取选中节点name串，以逗号分隔</td>
							<td></td>
							<td>,人员A,人员B,</td>
							<td class="text-left">$('#tagId').usertree('getText');</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>示例--人员树--场景B</b></h1>
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
								<strong>依赖：</strong>无
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;input class="easyui-combotree hy-usertree" id="tagId3" departtype="1" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree hy-usertree" id="tagId3" departtype="1" />
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId3').usertree('getValue');
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId3').usertree('getText');
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>&lt;input class="easyui-combotree" id="tagId4"/></p>
								<pre>
	$("#tagId4").usertree({
		departtype:'2',
		rootid:'110'
	});
								</pre>
								<p>效果预览：</p>
								<p><input class="easyui-combotree" id="tagId4" /></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>回显：</strong>
								<p>
									&lt;input class="easyui-combotree hy-usertree" id="tagId7" departtype="1" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree hy-usertree" id="tagId7" departtype="1" value="华宇金信" />
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
						<tr>
							<td>value</td>
							<td>回显值</td>
							<td>否</td>
							<td></td>
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
							<td>getValue</td>
							<td>取选中节点id串，以逗号分隔</td>
							<td></td>
							<td>,110,</td>
							<td class="text-left">$('#tagId').usertree('getValue');</td>
						</tr>
						<tr>
							<td>getText</td>
							<td>取选中节点name串，以逗号分隔</td>
							<td></td>
							<td>,人员A,人员B,</td>
							<td class="text-left">$('#tagId').usertree('getText');</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath %>js/component/ztree/jquery.ztree.all.min.js"></script>
	<script type="text/javascript">
		$(function () {
            $("#tagId2").usertree({
                departtype:'2',
                multiselect:'1',
                checkedvalue:',b2f1d007576643e0bc931a1a86ea9e58,',
                onnodeclick:function(event, treeId, treeNode, clickFlag){
                    $.hyjx.alert('系统信息',treeNode.name);
                }
            });
            $("#tagId4").usertree({
                departtype:'2',
                rootid:'110'
            });
        });
        function getId(event, treeId, treeNode, clickFlag){
            $.hyjx.alert('系统信息',treeNode.id);
        }
		function getVal() {
			alert($('#tagId2').usertree('getValue'));
        }
        function getText() {
            alert($('#tagId2').usertree('getText'));
        }
        function getVal2() {
            alert($('#tagId3').usertree('getValue'));
        }
        function getText2() {
            alert($('#tagId3').usertree('getText'));
        }
	</script>
</body>
</html>