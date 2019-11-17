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
	<title>右下角消息</title>
</head>
<body>
	<div style="margin:20px 0;">
		<a class="btn" href="#" onclick="show()">正常进入</a>
		<a class="btn" href="#" onclick="slide()">slide由下进入</a>
		<a class="btn" href="#" onclick="fade()">fade淡入</a>
		<a class="btn" href="#" onclick="progress()">等待加载的进度条</a>
	</div>
	<script>
	    function show(){
	        $.messager.show({
	            height:'150px',
	            title:'消息提示',
	            msg:'此消息提醒4秒后将自动关闭。',
	            showType:'show'
	        });
	    }
	    function slide(){
	        $.messager.show({
	            height:'150px',
	            title:'消息提示',
	            msg:'此消息提醒5秒后将自动关闭。',
	            timeout:5000,
	            showType:'slide'
	        });
	    }
	    function fade(){
	        $.messager.show({
	            height:'150px',
	            title:'消息提示',
	            msg:'此消息提醒为不自动关闭的类型。',
	            timeout:0,
	            showType:'fade'
	        });
	    }
	    function progress(){
	        var win = $.messager.progress({
	            title:'请耐心等待',
	            msg:'加载数据中...'
	        });
	        setTimeout(function(){
	            $.messager.progress('close');
	        },5000)
	    }
	</script>
</body>
</html>