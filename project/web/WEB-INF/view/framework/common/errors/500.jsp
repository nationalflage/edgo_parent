<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>500页面</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
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
		.div500{ width:100%;background: url(<%=basePath%>images/500.gif) no-repeat center top;font-family: 'HappyZcool';font-size: 24px;padding-top:270px;}
		.div500 p{width:360px;text-align: left;margin:10px auto;padding:0 30px;}
		.div500 a{color: #f7be25;text-decoration: none;}
		.div500 a:hover{text-decoration: underline;}
		/*折叠面板*/
		.toggle-btn{background: url(<%=basePath%>images/toggle-off.png) no-repeat center right;word-break: break-all;cursor: pointer;}
		.toggle-btn:hover{color:#30b6ba;}
		.toggle-btn.active{background-image: url(<%=basePath%>images/toggle-on.png)}
		.toggle-con{display:none;width:88%;padding:10px 3%;margin:10px auto;border:1px solid #ebebeb;box-shadow: 0 0 10px #e5e5e5 inset;font-size: 14px;font-family: 'Microsoft Yahei';border-radius: 5px;line-height: 25px;}
	</style>
</head>
<body>
<div class="div500">
	<p>出错了，<a href="javascript:void(0)" onclick="history.back(-1)">返回上一页</a></p>
	<p class="toggle-btn">错误信息：${exMessage} </p>
	<div class="toggle-con">
		${exMessageDetail }
	</div>
</div>
<script>
    // 折叠功能js
    $(document).on('click', '.toggle-btn', function() {
        $(this).toggleClass('active');
        $(this).next('.toggle-con').slideToggle();
    });
</script>
</body>
</html>