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
	<title>数字微调器</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
		.detail-list1 tbody td p{ margin:5px 0 5px 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>数字微调器</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>数值微调器（numberspinner）是基于微调器（spinner）和数字框（numberbox）创建的。它可以把输入值转换为不同类型（比如：数字 numeric、百分比 percentage、货币 currency，等等）。它允许用户使用向上/向下微调按钮滚动到一个期望值。
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式一</strong>
								<p>
									&lt;input class="easyui-numberspinner" data-options="increment:100" value="1000" />
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-numberspinner" id="aa" data-options="increment:100" value="1000"  />
								</p>
								<p>
									<input class="btn btn-info" type="button" value="设置值" onclick="setVal()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
								<p>
									<input class="btn btn-info" type="button" value="获取值" onclick="getVal()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式二</strong>
								<p>
									&lt;input id="ss" required="required" />
								</p>
								<pre>
		$('#ss').numberspinner({
			min: 10,
			max: 100,
			increment:10,
			editable: false
		});
								</pre>
								<p>效果预览：</p>
								<p>
									<input id="ss" required="required" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>把数字格式化为货币字符串。</strong>
								<p>
									&lt;input class="easyui-numberspinner" data-options="required:true,precision:2,groupSeparator:',',decimalSeparator:'.',prefix:'$'" value="1234567890">
								</p>
								<p>效果预览：</p>
								<p>
									<input class="easyui-numberspinner" data-options="required:true,precision:2,groupSeparator:',',decimalSeparator:'.',prefix:'$'" value="1234567890">
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>格式化字符串</strong>
								<p>
									&lt;input id="ns" value="123456" />
								</p>
								<p>
									<pre>
		$('#ns').numberspinner({
			increment:10,
			formatter:function (value) {
				if (value === 0) return '0 B';
				var k = 1024;
				sizes = ['B','KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
				i = Math.floor(Math.log(value) / Math.log(k))
				return (value / Math.pow(k, i)).toFixed(2) + ' ' + sizes[i];
			}
		});
									</pre>
								</p>
								<p>效果预览：</p>
								<p>
									<input id="ns" value="123456" />
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
						<td>value</td>
						<td>设置初始值。</td>
						<td>否</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>min</td>
						<td>允许的最小值。</td>
						<td>否</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>max</td>
						<td>允许的最大值。</td>
						<td>否</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>increment</td>
						<td>点击微调器按钮时的增量值。</td>
						<td>否</td>
						<td>1</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>editable</td>
						<td>定义用户是否可以往文本域中直接输入值。</td>
						<td>否</td>
						<td>false</td>
						<td>true / false</td>
						<td></td>
					</tr>
					<tr>
						<td>precision</td>
						<td>显示在小数点后面的最大精度。</td>
						<td>否</td>
						<td>0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>decimalSeparator</td>
						<td>分隔数字的整数部分和小数部分的分隔字符。</td>
						<td>否</td>
						<td>.</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>groupSeparator</td>
						<td>分隔整数组合的字符。</td>
						<td>否</td>
						<td>,</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>prefix</td>
						<td>前缀字符串</td>
						<td>否</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>suffix</td>
						<td>后缀字符串。</td>
						<td>否</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>formatter</td>
						<td>用来格式数字框值的函数。返回显示在框中的字符串值。</td>
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
						<td>options</td>
						<td>返回数值微调器选项</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$('#ss').numberspinner(“options”)</td>
					</tr>
					<tr>
						<td>getValue</td>
						<td>获取数值微调器的值。</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$('#ss').numberspinner(“getValue”)</td>
					</tr>
					<tr>
						<td>setValue</td>
						<td>设置数值微调器的值。</td>
						<td>value</td>
						<td></td>
						<td class="text-left">$('#ss').numberspinner('setValue', 8234725); </td>
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
						<td>onChange</td>
						<td>当值改变时触发。</td>
						<td>newValue,oldValue</td>
						<td>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		$(function () {
            $('#ns').numberspinner({
                increment:10,
                formatter:function (value) {
                    if (value === 0) return '0 B';
                    var k = 1024;
                    sizes = ['B','KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
                    i = Math.floor(Math.log(value) / Math.log(k))
                    return (value / Math.pow(k, i)).toFixed(2) + ' ' + sizes[i];
                }
            });
            $('#ss').numberspinner({
                min: 10,
                max: 100,
                increment:10,
                editable: false
            });
        });
		function setVal() {
			$("#aa").numberspinner("setValue",20);
        }
        function getVal() {
            var val=$("#aa").numberspinner("getValue");
            alert(val);
        }
	</script>
</body>
</html>