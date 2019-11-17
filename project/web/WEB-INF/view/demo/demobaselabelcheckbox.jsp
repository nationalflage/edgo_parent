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
	<title>基础checkbox</title>
</head>
<body>
<div class="content">
	<div class="labels-container">
		<h1 class="public-title">
			<b>标签新增</b>
			<a class="btn btn-info" href="javascript:void(0)" >+&nbsp;新增标签</a>
		</h1>
		<div class="basic-labels">
			<h2 class="title-labels">状态标签</h2>
			<div class="checkboxs">
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
			</div>
		</div>
		<div class="basic-labels">
			<h2 class="title-labels">大类标签</h2>
			<div class="checkboxs">
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
				<label><input type="checkbox" class="checkbox"/>无效链接</label>
			</div>
		</div>
		<div class="basic-labels">
			<h2 class="title-labels">行业标签</h2>
			<div class="labels-end">
				<h3 class="title2-labels">消费品类</h3>
				<div class="checkboxs labels-ul2">
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
					<label><input type="checkbox" class="checkbox"/>无效链接</label>
				</div>
				<h3 class="title2-labels">消费品类</h3>
				<div class="labels-ul-end">
					<h4 class="title3-labels">一、购物</h4>
					<div class="checkboxs labels-ul2">
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
					</div>
					<h4 class="title3-labels">二、消费</h4>
					<div class="checkboxs labels-ul2">
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
						<label><input type="checkbox" class="checkbox"/>无效链接</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
