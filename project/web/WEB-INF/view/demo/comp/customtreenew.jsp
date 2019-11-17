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
	<title>自定义树</title>
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
								<strong>简介：</strong>在easyUI原有树的基础上扩展了url属性
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId1" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree'" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId1" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree'" style="margin-left: 45px"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId1').tree('getSelected').id;
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点文本" onclick="getText()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId1').tree('getSelected').text;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>
									&lt;ul id="tagId2">&lt;/ul>
									<pre>
			$("#tagId2").tree({
				customtree:true,
				customtype:'1',
				treeid:'sys.codetable.bmtree',
				onClick:function(node){
					alert(node.id);
				}
			});
									</pre>
								</p>
								<p>效果预览：</p>
								<ul id="tagId2" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>带参数的sql</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId3" data-options="customtree:true,customtype:'2',treeid:'sys.codetable.bmtree1',paras:'110-110001'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId3" data-options="customtree:true,customtype:'2',treeid:'sys.codetable.bmtree1',paras:'110-110001'" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>使用码表方式</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId4" data-options="customtree:true,customtype:'4',codetablepara:'city-region'">&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId4" data-options="customtree:true,customtype:'4',codetablepara:'city-region'" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId9" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId9" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true" style="margin-left: 45px"></ul>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal3()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId3').tree('getCheckedValues');
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框的只读树：</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId10" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true,readonly:true" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId10" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true,readonly:true" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树的回显：</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId11" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true,checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId11" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkbox:true,checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'" style="margin-left: 45px"></ul>
							</td>
						</tr>
						<tr>
							<td>
								<strong>普通树的回显：</strong>
								<p>
									&lt;ul class="easyui-tree" id="tagId12" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'" >&lt;/ul>
								</p>
								<p>效果预览：</p>
								<ul class="easyui-tree" id="tagId12" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'" style="margin-left: 45px"></ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>	
	<div class="content">
		<h1 class="public-title"><b>自定义树--下拉列表方式</b></h1>
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
									&lt;input class="easyui-combotree" id="tagId5" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree'"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId5" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree'"/>
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点id" onclick="getVal2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId5').combotree('tree').tree('getSelected').code
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中节点text" onclick="getText2()"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#tagId5').combotree('tree').tree('getSelected').text
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p>
									&lt;input id="tagId6" />
									<pre>
				$("#tagId6").combotree({
					customtree:true,
					customtype:'1',
					treeid:'sys.codetable.bmtree'
				});
									</pre>
								</p>
								<p>效果预览：</p>
								<p>
									<input id="tagId6" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>带参数的sql：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId7" data-options="customtree:true,customtype:'2',treeid:'sys.codetable.bmtree1',paras:'110-110001'" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId7" data-options="customtree:true,customtype:'2',treeid:'sys.codetable.bmtree1',paras:'110-110001'" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>使用码表方式</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId8" data-options="customtree:true,customtype:'4',codetablepara:'city-region'"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId8" data-options="customtree:true,customtype:'4',codetablepara:'city-region'"/>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId13" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',multiple:true"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId13" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',multiple:true"/>
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取选中值" onclick="getVal4()" />
									&nbsp;&nbsp;&nbsp;&nbsp; $('#tagId13').combotree('tree').tree('getCheckedValues')
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>普通树的回显：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId14" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId14" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd'"/>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>复选框树的回显：</strong>
								<p>
									&lt;input class="easyui-combotree" id="tagId15" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd',multiple:true"/>
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-combotree" id="tagId15" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'88822d4ed9b74c5eb035ad1c9efab8dd',multiple:true"/>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="content">
		<h1 class="public-title"><b>自定义树--属性说明</b></h1>
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
							<th width="10%">默认值（非必填项）</th>
							<th width="15%">值集/示例</th>
							<th width="35%">备注</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>customtype</td>
							<td>自定义树的显示类型</td>
							<td>是</td>
							<td></td>
							<td>1 2 4</td>
							<td>1 表示不传参的sql，2 表示传参的sql ，4 表示多级代码表的自定义树</td>
						</tr>
						<tr>
							<td>treeid</td>
							<td>自定义树在属性配置里面对应的sql</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>属性配置里面对应的属性键的集合（当自定义树是类型4时，该项是不需要的）</td>
						</tr>
						<tr>
							<td>paras</td>
							<td>需要传入参数的sql的参数值</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>当customtype为2时此参数为必传，格式为"xxx-xxx"</td>
						</tr>
						<tr>
							<td>codetablepara</td>
							<td>根据多级代码表生成的树</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>当customtype为4时此参数为必传,格式为"xxx-xxx"</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
        $(function () {
            $("#tagId2").tree({
                customtree:true,
                customtype:'1',
                treeid:'sys.codetable.bmtree',
                onClick:function(node){
                    alert(node.id);
                }
            });
            $("#tagId6").combotree({
                customtree:true,
                customtype:'1',
                treeid:'sys.codetable.bmtree'
            });
        });
        function getVal(){
            var ttt=$('#tagId1').tree('getSelected').id;
            alert(ttt)
        }
        function getText(){
            var ttt=$('#tagId1').tree('getSelected').text;
            alert(ttt)
        }
        function getVal3(){
            var ttt=$('#tagId9').tree('getCheckedValues');
            alert(ttt);
        }
        function getVal4(){
            var ttt=$('#tagId13').combotree('tree').tree('getCheckedValues');
            alert(ttt);
        }
        function getVal2() {
            var t = $('#tagId5').combotree('tree');
            var n = t.tree('getSelected');
            alert(n.id);
        }
        function getText2() {
            var t = $('#tagId5').combotree('tree');
            var n = t.tree('getSelected');
            alert(n.text);
        }
	</script>
</body>
</html>