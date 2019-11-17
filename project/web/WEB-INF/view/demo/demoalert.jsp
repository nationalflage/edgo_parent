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
	<title>alert</title>
</head>   
<body> 
<div style="margin:20px 0;">
	<a href="#" class="btn btn-info" onclick="alert1()">正常的alert</a>
	<a href="#" class="btn btn-info" onclick="alert2()">错误提示</a>
	<a href="#" class="btn btn-info" onclick="alert3()">信息</a>
	<a href="#" class="btn btn-info" onclick="alert4()">问题</a>
	<a href="#" class="btn btn-info" onclick="alert5()">警告</a>
</div>
<script> 
    function alert1(){
        $.hyjx.alert('提示','这是一条正常的信息提示!');
    }
    function alert2(){
        $.hyjx.alert('错误提示','请选择一家企业!','error');
    }
    function alert3(){
        $.hyjx.alert('消息提示','您有几条审批待处理!','info');
    }
    function alert4(){
        $.hyjx.alert('问题提示','这是一条问题提示!','question');
    }
    function alert5(){
        $.hyjx.alert('警告','这是一条警示信息!','warning');
    }
</script>
</body>
</html> 