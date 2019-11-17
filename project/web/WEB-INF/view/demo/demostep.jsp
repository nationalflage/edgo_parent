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
	<title>步骤</title>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>步骤系列</b></h1>
		<!-- 默认宽度自适应、居左（加total2：一共有2步的居中显示） -->
		<ul class="steps total2">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">2</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total2">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
		</ul>
		<!-- 默认宽度自适应、居左（加total3：一共有3步的居中显示） -->
		<ul class="steps total3">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total3">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total3">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
		</ul>
		<!-- 默认宽度自适应、居左（加total4：一共有4步的居中显示） -->
		<ul class="steps total4">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total4">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total4">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total4">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">4</strong><span class="con">步骤内容</span></li>
		</ul>
		<!-- 默认宽度自适应、居左（加total5：一共有5步的居中显示） -->
		<ul class="steps total5">
			<li class="first-step"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total5">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total5">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total5">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total5">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<ul class="steps total5">
			<li class="first-step active"><strong onclick="">1</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">2</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">3</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">4</strong><span class="con">步骤内容</span></li>
			<li class="active"><strong onclick="">5</strong><span class="con">步骤内容</span></li>
		</ul>
		<p style="clear: both;"></p><!--清除浮动-->
	</div>
</body>
</html>
