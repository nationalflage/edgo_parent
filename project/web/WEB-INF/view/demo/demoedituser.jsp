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
	<title>修改用户</title>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>修改用户</b></h1>
		<!-- 表单 -->
		<form class="query-list" method="post">
			<table class="table-query">
				<tbody>
					<tr>
						<th width="15%">登录名</th>
						<td>
							<input class="easyui-textbox"  type="text"/>
						</td>
						<th width="10%">密码</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
						<td rowspan="4">
							<div class="hy-imageupload" edit="1" vchr_domain="userPhoto" vchr_entityid="undefined"></div>
						</td>
					</tr>
					<tr>
						<th>姓名</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
						<th>性别</th>
						<td>
							<label><input name="sex" type="radio" />男</label>
							<label><input name="sex" type="radio"/>女</label>
						</td>
					</tr>
					<tr>
						<th>办公电话</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
						<th>电子邮件</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
					</tr>
					<tr>
						<th>传真</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
						<th>移动电话</th>
						<td>
							<input class="easyui-textbox" type="text"/>
						</td>
					</tr>
					<tr>
						<th>是否有效</th>
						<td colspan="4">
							<input name="judge" type="radio" checked/>是
							<input name="judge" type="radio"/>否
						</td>
					</tr>
					<tr>
						<th valign="top">用户对应角色</th>
						<td colspan="4">
							<!-- 标签选择区 begin -->
							<div class="selectArea">
								<!-- 左侧：待选标签 -->
								<div class="selectArea-left">
									<h2 class="headline">
										待选标签
										<p class="nav1">
											<span class="active">全部</span>/<span>类别一</span>/<span>类别二</span>
										</p>
										<img class="img-btn" src="<%=basePath%>images/icon-search2.png" alt="搜索按钮"/>
									</h2>
									<div class="page-content">
										<span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span>
									</div>
									<!--<div class="page-buttons">
									  <img class="last-page" src="images/last-page.png" title="上一页"/>
									  <img class="next-page" src="images/next-page.png" title="下一页"/>
							  		</div> -->
								</div>
								<!-- 右侧：已选标签 -->
								<div class="selectArea-right">
									<h2 class="headline">已选标签</h2>
									<div class="page-content">
										<span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span><span class="label1">海淀区<button class="btn-close"></button></span><span class="label1">丰台区<button class="btn-close"></button></span>
									</div>
								</div>
							</div>
							<!-- 标签选择区 end-->
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script>
        $(function(){
            $('.selectArea-left').on('dblclick','.label1',function() {
                var insertText1 = $(this).text();
                var insertHtml1='<span class="label1"><button class="btn-close"></button></span>'
                $('.selectArea-right').find('.page-content').append(insertHtml1);
                $('.selectArea-right').find('.page-content').find('.label1:last').prepend(insertText1);
                $(this).remove();
            });
            // 点击已选区标签的叉号，移除已选区的该标签，并添加到备选区
            $('.selectArea-right').on('click','.btn-close',function() {
                var insertText2 = $(this).parent('.label1').text();
                var insertHtml2='<span class="label1"><button class="btn-close"></button></span>'
                $('.selectArea-left').find('.page-content').append(insertHtml2);
                $('.selectArea-left').find('.page-content').find('.label1:last').prepend(insertText2);
                $(this).parent('.label1').remove();
            });
        });
	</script>
</body>
</html>