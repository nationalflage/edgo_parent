<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//System.out.println(session.getId());
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String key = "!keye!com.hyjx.framework" + new Random().nextInt();
    session.setAttribute("key",key);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="<%=basePath %>js/easyui/jquery.min.js"></script>
<script src="<%=basePath %>js/encode.js"></script>
</head>
<body>
<h3>子系统自定义登录页示例</h3>
<form  action="<%=basePath%>login.xhtml" method="post">
	 登录名：<input type="text"  name="username" id="user_account"  />
	 <input type="hidden" id="user_account2" name="user_account">
	 <br>
	  密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="user_pwd" type="password"  id="user_pwd" autocomplete="off"/>
	  
	  <br>验证码：<input name="check" type="text"  id="check" >
	  <img id="checkimg" src="<%=basePath %>checkcode" alt="验证码图片"  onclick="changecheckcode()" title="点击更换验证码" style="cursor: pointer;"/>
	  <br>
	  <input type="hidden" name="subsys_url" id="subsys_url" value="/business/subsys_example/index">
	  <input type="submit"  value="登　录"  onclick="if($(this).val()=='正在登录...')return;$(this).val('正在登录...');encodeup();"/>
</form>

</body>
</html>
<script>
	function encodeup()
	{
		$("#user_account2").val(encodeURIComponent(encode.encode($("#user_account").val(),'<%=key%>','core.hyjx.com','core.hyjx.com')));
		$("#user_pwd").val(encodeURIComponent(encode.encode($("#user_pwd").val(),'<%=key%>','core.hyjx.com','core.hyjx.com')));
	}
</script>