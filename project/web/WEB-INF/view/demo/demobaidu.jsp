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
	<title>类百度搜索</title>
</head>
<body>
<div class="content">
	<h1 class="public-title"><b>搜索</b></h1>
	<p style="margin:20px 0;">【1.类百度搜索】——例：输入“你”</p>
		<input class="hy-searchinput" id="kw2" code="1" url="demo/getHySearchData.xhtml" />
	<p style="margin:20px 0;">【2.简单搜索】</p>

	<input class="easyui-searchbox" data-options="prompt:'搜索关键词',searcher:doSearch" style="width:30%"/>
	<input class="easyui-searchbox" data-options="prompt:'请输入',searcher:doSearch"/>
	<script>
        function doSearch(value){
            alert('您的输入为: ' + value);
        }
	</script>

	<p style="margin:20px 0;">【3.带分类的搜索】</p>
	<input class="easyui-searchbox" data-options="prompt:'请输入搜索关键词',menu:'#mm',searcher:doSearch2" style="width:450px">
	<div id="mm">
		<div data-options="name:'all1',iconCls:'icon-ok'">大类1</div>
		<div data-options="name:'kind1'">小类1</div>
		<div data-options="name:'kind2'">小类2</div>
		<div data-options="name:'kind3'">小类3</div>
		<div data-options="name:'all2',iconCls:'icon-ok'">大类2</div>
		<div data-options="name:'kind4'">小类1</div>
		<div data-options="name:'kind5'">小类2</div>
		<div data-options="name:'kind6'">小类3</div>
	</div>
	<script>
        function doSearch2(value,name){
            alert('您的输入为: ' + value+'；(name的值为:'+name+')');
        }
	</script>
</div>
</body>
</html>
