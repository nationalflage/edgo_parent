<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>404页面</title>
	<style>
		body{background-color: #fff;}
		/*自定义字体（IE8以上）*/
		@font-face {
			font-family: 'HappyZcool';
			src: url('<%=basePath%>font/HappyZcool.ttf') format('truetype');
		}
		@font-face {
			font-family: 'LISHUSF';
			src: url('<%=basePath%>font/LISHUSF.ttf') format('truetype');
		}
		.div404{ width:100%;background: url(<%=basePath%>images/404.gif) no-repeat center 60px;font-family: 'HappyZcool';font-size: 24px;padding-top:370px;}
		.div404 p{width:360px;text-align: left;margin:10px auto;}
		.div404 a{color: #f7be25;text-decoration: none;}
		.div404 a:hover{text-decoration: underline;}
	</style>
</head>
<body>
<div class="div404">
	<p>出错了，您访问的页面不存在</p>
	<p><a href="javascript:void(0)" onclick="history.back(-1)">返回上一页</a></p>
</div>
</body>
</html>
