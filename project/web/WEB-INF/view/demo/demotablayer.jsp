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
	<title>tab层</title>
</head>
<body>
	<div class="mask" style="display:block;"></div><!--半透明遮罩-->
	<!--标签分类弹出层 begin-->
	<form class="kind-layer" style="display:block;">
		<img class="close" src="<%=basePath%>images/close.png" alt="关闭按钮" />
		<div class="bottom1">
			<div class="float-l">
				<label><input type="checkbox"/> 全选</label>
				<label><input type="checkbox"/> 反选</label>
			</div>
			<div class="float-r">
				<label><input name="operate" type="radio" checked />或</label>
				<label><input name="operate" type="radio" />且</label>
				<label><input name="operate" type="radio" />非</label>
			</div>
		</div>
		<div class="bottom2">
			<input class="btn btn-info" type="button" value="查 询"/>
			<input class="btn" type="button" value="清 空"/>
		</div>
		<!--tab页导航-->
		<ul class="tabs2-nav">
			<li class="active" id="tabs2_nav1">基础标签</li>
			<li id="tabs2_nav2">市局标签</li>
			<li id="tabs2_nav3">常用标签</li>
			<li id="tabs2_nav4">我的标签</li>
			<li id="tabs2_nav5">客体标签</li>
			<li id="tabs2_nav6">基础标签</li>
			<li id="tabs2_nav7">市局标签</li>
			<li id="tabs2_nav8">常用标签</li>
			<li id="tabs2_nav9">我的标签</li>
		</ul>
		<div class="tabs2-body">
			<div id="tabs2_con1" style="display:block;">
				<ul class="left-menu2">
					<li class="active">农资商品</li>
					<li>旅游商品</li>
					<li>电子产品</li>
					<li>儿童用品</li>
					<li>国家明令禁止产品</li>
					<li>机动车辆</li>
					<li>妇女用品</li>
				</ul>
				<div class="rightArea2 checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con2" style="display:none;">
				<!-- 市局标签内容 begin -->
				<div class="basic-labels" style="margin-top:0;">
					<h2 class="title-labels">行业标签</h2>
					<div class="labels-end">
						<h3 class="title2-labels">消费品类</h3>
						<div class="checkboxs labels-ul2">
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
							<label><input class="checkbox" type="checkbox"/>无效链接</label>
						</div>
						<h3 class="title2-labels">消费品类</h3>
						<div class="labels-ul-end">
							<h4 class="title3-labels">一、购物</h4>
							<div class="checkboxs labels-ul2">
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
							</div>
							<h4 class="title3-labels">二、消费</h4>
							<div class="checkboxs labels-ul2">
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
								<label><input class="checkbox" type="checkbox"/>无效链接</label>
							</div>
						</div>
					</div>
				</div>
				<!-- 市局标签内容 end -->
			</div>
			<div id="tabs2_con3" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con4" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con5" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con6" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con7" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con8" style="display:none;">
				<div class="checkboxs">
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<h2 class="title2">肥料>></h2>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
			<div id="tabs2_con9" style="display:none;">
				<div class="checkboxs">
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>有机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>无机肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
					<label><input class="checkbox" type="checkbox"/>单质肥料</label>
				</div>
			</div>
		</div>
	</form>
	<!--标签分类弹出层 end-->
</body>
</html>
