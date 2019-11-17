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
	<title>富文本组件</title>
	<style>
		.detail-list1 td{color:#333;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>富文本组件</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td><strong>简介：</strong>为应用提供在线文本编辑器</td>
						</tr>
						<tr>
							<td><strong>依赖：</strong>&lt;script src="&lt;%=basePath %>component/ckeditor/ckeditor.js">&lt;/script></td>
						</tr>
						<tr>
							<td>
								<strong>调用方式：</strong>
								<p style="margin-left:45px;">
									&lt;textarea class="hy-richtext" name="editor" id="editor" rows="10" cols="80">富文本&lt;/textarea>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>效果预览：</strong>
								<p style="margin-left:45px;">
									<textarea class="hy-richtext" name="editor" id="editor" rows="10" cols="80">
										富文本
									</textarea>
								</p>
								<input class="btn btn-info" type="button" onclick="show()" value="弹出文本框的内容"/>
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
                            <th width="10%">默认值（非必填项）</th>
                            <th width="25%">值集/示例</th>
                            <th width="25%">备注</th>
                        </tr>
					</thead>
					<tbody>
                        <tr>
                            <td>Class</td>
                            <td>判断富文本标志</td>
                            <td>是</td>
                            <td></td>
                            <td>hy-richtext</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>富文本名称</td>
                            <td>是</td>
                            <td></td>
                            <td>editor1</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Id</td>
                            <td>富文本id	</td>
                            <td>是</td>
                            <td></td>
                            <td>editor1</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Rows</td>
                            <td>富文本框行宽	</td>
                            <td>否</td>
                            <td></td>
                            <td></td>
                            <td>设置富文本框行宽不然会很小</td>
                        </tr>
                        <tr>
                            <td>Cols</td>
                            <td>富文本列宽	</td>
                            <td>否</td>
                            <td></td>
                            <td></td>
                            <td>设置富文本框列宽不然会很小</td>
                        </tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="<%=basePath %>component/ckeditor/ckeditor.js"></script>
	<script>
        function show(){
            alert($(".hy-richtext").richtext("getValue"));
        }
	</script>
</body>
</html>