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
	<title>类百度组件</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>类百度提示组件</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>文本提示组件，类似于百度搜索的输入框，输入文字，下边自动补全相应的提示</td>
						</tr>
						<tr>
							<td>使用实例 <span class="red">注意:作为输入的文本框必须有id属性;返回结果是json数组，其中的格式如下所示。其中code为下拉列表项的code值，name为下拉列表项的展示文字。[{ 'code':'1','name':'你好，我是Michael'},{'code':'2','name':'你是谁'}]</span></td>
						</tr>
						<tr>
							<td>
								<strong>调用方式1：</strong>
								<p style="margin-left:45px;">
									&lt;input class="hy-searchinput" id="kw2" url="demo/getHySearchData.xhtml" callback="callback" />
								</p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;">
									<input class="hy-searchinput" id="kw2" url="demo/getHySearchData.xhtml" callback="callback" />
								</p>
								<br/>
								<p style="margin-left:45px;">
									$("#kw2").searchinput("getText") <br/>
									<input class="btn btn-info" type="button" onclick="show1()" value="获取文本值"/>
								</p>
								<br/>
								<p style="margin-left:45px;">
									$("#kw2").searchinput("getValue")<br/>
									<input class="btn btn-info" type="button" onclick="show2()" value="获取value值"/>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式2：</strong>
								<p style="margin-left:45px;">&lt;input class="searchinput" id="kw" /></p>
								<p style="margin-left:45px;">
									<pre>
			$("#kw").searchinput({url:"demo/getHySearchData.xhtml",
				callback: function(name,code){
					alert(name+"**"+ code);
			  }});
									</pre>
								</p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left:45px;"><input class="searchinput" id="kw" /></p>
								<script>
									$("#kw").searchinput({url:"demo/getHySearchData.xhtml",
										callback: function(name,code){
											alert(name+"**"+ code);
										}});
								</script>
							</td>
						</tr>
						<tr>
							<td>
								<strong>使用text值回显文本</strong>
								<p style="margin-left:45px;">
									&lt;input class="hy-searchinput" id="kw3" url="demo/getHySearchData.xhtml" text="你好呀"  />
								</p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left: 45px;">
									<input class="hy-searchinput" id="kw3" url="demo/getHySearchData.xhtml" text="你好呀" />
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>使用code值回显文本 <span class="red">（暂且不好用）</span></strong>
								<p style="margin-left:45px;">
									&lt;input class="hy-searchinput" id="kw4" url="demo/getHySearchData.xhtml" code="3"  />
								</p>
								<p style="margin-left:45px;">效果预览：</p>
								<p style="margin-left: 45px;">
									<input class="hy-searchinput" id="kw4" url="demo/getHySearchData.xhtml" code="03" />
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
							<th width="5%">是否必填</th>
							<th width="15%">默认值（非必填项）</th>
							<th width="20%">值集/示例</th>
							<th width="30%">备注</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>url</td>
							<td>提示词的数据来源</td>
							<td>是</td>
							<td>demo/getHySearchData.xhtml</td>
							<td>demo/getHySearchData.xhtml</td>
							<td>提示词的数据来源</td>
						</tr>
						<tr>
							<td>callback</td>
							<td>选择之后的回调函数</td>
							<td>否</td>
							<td></td>
							<td>callback</td>
							<td>选择之后的回调函数</td>
						</tr>
						<tr>
							<td>text</td>
							<td>回显文本</td>
							<td>否</td>
							<td></td>
							<td>aaa</td>
							<td>回显文本</td>
						</tr>
						<tr>
							<td>code</td>
							<td>回显值</td>
							<td>否</td>
							<td></td>
							<td>01</td>
							<td>回显文本</td>
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
							<th width="15%">返回值</th>
							<th width="30%">使用示例</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>getText</td>
							<td>获取选中的文本</td>
							<td>您好</td>
							<td>获取选中的文本</td>
						</tr>
						<tr>
							<td>getValue</td>
							<td>获取选中的值</td>
							<td>1</td>
							<td>获取选中的值</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
        function callback(name,code){
            alert(name+"**"+ code);
        }
        function show1() {
			alert($("#kw2").searchinput("getText"))
        }
        function show2() {
            alert($("#kw2").searchinput("getValue"))
        }
	</script>
</body>
</html>