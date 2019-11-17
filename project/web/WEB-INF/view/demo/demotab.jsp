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
	<title>Tab标签</title>
</head>
<body>
	<div class="content">
		<h2 class="public-title"><b>Tab标签</b></h2>
		<p class="public-title2">（一）导航样式</p>
		<!-- tab页默认样式（带右侧分割线） -->
		<div class="tabs_nav" style="margin-bottom:15px;">
			<a class="active" href="javascript:void(0)">注册资金排名</a>
			<span class="line">|</span>
			<a href="javascript:void(0)">新增注册资金分析</a>
			<span class="line">|</span>
			<a href="javascript:void(0)">资金累计同环比</a>
		</div>
		<!-- tab页样式1（带右侧分割线） -->
		<div class="tabs_nav tabs_nav1" style="margin-bottom:15px;">
			<a class="active" href="javascript:void(0)">注册资金排名</a>
			<span class="line">|</span>
			<a href="javascript:void(0)">新增注册资金分析</a>
			<span class="line">|</span>
			<a href="javascript:void(0)">资金累计同环比</a>
		</div>
		<!-- tab页样式默认 -->
		<ul class="tabs-nav" style="margin-bottom:15px;">
			<li class="active"><a href="javascript:void(0)">tab1名称</a></li>
			<li><a href="javascript:void(0)">tab2名称</a></li>
			<li><a href="javascript:void(0)">tab3名称</a></li>
			<li><a href="javascript:void(0)">tab4名称</a></li>
			<li><a href="javascript:void(0)">tab5名称</a></li>
		</ul>
		<!-- tab页样式1 -->
		<ul class="tabs-nav tabs-nav1" style="margin-bottom:15px;">
			<li class="active"><a href="javascript:void(0)">tab1名称</a></li>
			<li><a href="javascript:void(0)">tab2名称</a></li>
			<li><a href="javascript:void(0)">tab3名称</a></li>
			<li><a href="javascript:void(0)">tab4名称</a></li>
			<li><a href="javascript:void(0)">tab5名称</a></li>
		</ul>
		<!-- tab页样式2 -->
		<ul class="tabs-nav tabs-nav2" style="margin-bottom:15px;">
			<li class="active"><a href="javascript:void(0)">tab1名称</a></li>
			<li><a href="javascript:void(0)">tab2名称</a></li>
			<li><a href="javascript:void(0)">tab3名称</a></li>
			<li><a href="javascript:void(0)">tab4名称</a></li>
			<li><a href="javascript:void(0)">tab5名称</a></li>
		</ul>
		<!-- tab页样式3 -->
		<ul class="tabs-nav tabs-nav3" style="margin-bottom:15px;">
			<li class="active"><a href="javascript:void(0)">tab1名称</a></li>
			<li><a href="javascript:void(0)">tab2名称</a></li>
			<li><a href="javascript:void(0)">tab3名称</a></li>
			<li><a href="javascript:void(0)">tab4名称</a></li>
			<li><a href="javascript:void(0)">tab5名称</a></li>
		</ul>
		<p class="public-title2">（二）tab页内容切换：</p>
		<p class="public-title2">1.用div切换（切换区可自适应高度也可固定高度，by是否设置height属性；每个区块内容若是引用独立页面，建议用include标签）</p>
		<!-- 用div来切换tab页（通过在每个标签上加对应的id） -->
		<ul class="tabs-nav" id="tabs-nav">
			<li id="tabs_nav1" class="active"><a href="###">总体发病情况</a></li>
			<li id="tabs_nav2" ><a href="###">犊牛发病情况</a></li>
			<li id="tabs_nav3"><a href="###">育成牛发病情况</a></li>
			<li id="tabs_nav4" ><a href="###">繁育母牛发病情况</a></li>
			<li id="tabs_nav5" ><a href="###">育肥牛发病情况</a></li>
		</ul>
		<div class="tabs-con">
			<div id="tabs_con1">内容一</div>
			<div id="tabs_con2" style="display: none;">内容二</div>
			<div id="tabs_con3" style="display: none;">内容三</div>
			<div id="tabs_con4" style="display: none;">内容四</div>
			<div id="tabs_con5" style="display: none;">内容五</div>
		</div>
		<p class="public-title2">2.用iframe切换（切换区高度自适应）</p>
		<!-- 用iframe切换（自适应高度） -->
		<ul class="tabs-nav">
			<li class="active"><a target="mainFrame" href="noeasyui.html">tab1名称</a></li>
			<li><a target="mainFrame"  href="img-list.html">tab2名称</a></li>
			<li><a target="mainFrame"  href="block-list.html">tab3名称</a></li>
			<li><a target="mainFrame"  href="view.html">tab4名称</a></li>
		</ul>
		<iframe name="mainFrame" id="mainFrame" src="<%=basePath%>demo/gotoDataList2.xhtml" frameborder="0" width="100%" scrolling="no" onload="this.height=0;this.height=mainFrame.document.body.scrollHeight;" style="border:1px solid #eee;"></iframe>
		<p class="public-title2">3.用iframe切换（切换区高度固定）</p>
		<!--用iframe切换（固定高度） -->
		<ul class="tabs-nav">
			<li class="active"><a target="mainFrame1" href="noeasyui.html">tab1名称</a></li>
			<li><a target="mainFrame1"  href="img-list.html">tab2名称</a></li>
			<li><a target="mainFrame1"  href="block-list.html">tab3名称</a></li>
			<li><a target="mainFrame1"  href="view.html">tab4名称</a></li>
		</ul>
		<iframe name="mainFrame1" id="mainFrame1" src="<%=basePath%>demo/gotoDataList2.xhtml" frameborder="0" width="100%" height="200"></iframe>
	</div>
</body>
</html>
