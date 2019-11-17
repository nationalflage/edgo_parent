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
	<title>进度条</title>
</head>
<body>
	<div class="content">
	    <h1 class="public-title"><b>基础进度条</b></h1>
	    <div style="margin:10px 0;">
	        <a class="btn btn-info" href="#" onclick="start()">开始</a>
	    </div>
	    <div class="easyui-progressbar" id="p" style="width:400px;"></div>
	
	    <h1 class="public-title" style="margin-top:50px;"><b>流式进度条</b></h1>
	    <p style="margin:10px 0;">width:50%</p>
	    <div class="easyui-progressbar" data-options="value:80" style="width:50%;"></div>
	    <p style="margin:10px 0;">width:30%</p>
	    <div class="easyui-progressbar" data-options="value:40" style="width:30%;"></div>
	</div>
    <script>
        function start(){
            var value = $('#p').progressbar('getValue');
            if (value < 100){
                value += Math.floor(Math.random() * 10);
                $('#p').progressbar('setValue', value);
                setTimeout(arguments.callee, 200);
            }
        };
    </script>
</body>
</html>