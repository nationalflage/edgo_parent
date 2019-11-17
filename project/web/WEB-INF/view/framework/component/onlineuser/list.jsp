<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.hyjx.framework.uc.user.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>信息列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
  </head>
  <body style="background-color:#fff;padding:0 15px;">
	<%
	ServletContext app = session.getServletContext();
	List<UserInfo> onlineUserList = (List<UserInfo>) com.hyjx.framework.service.CacheService.get("onlineUserList");
	out.print("<p class='public-title2'>在线用户数：<span class='color'>"+onlineUserList.size()+"</span></p>");
	%>
	<table class="detail-list2">
		<tr>
			<th>登录名</th>
			<th>用户名</th>
			<th>登录时间</th>
			<th>所属部门</th>
			<th>客户端ip</th>
			<th>服务器ip</th>
		</tr>
		<%
		if(onlineUserList !=null)
		{
			for(UserInfo ui : onlineUserList)
			{
				out.print("<tr><td>");
				out.print(ui.getUser_account());
				out.print("</td>");
				out.print("<td>");
				out.print(ui.getUser_name());
				out.print("</td>");
				out.print("<td>");
				out.print(ui.getLogin_time());
				out.print("</td>");
				out.print("<td>");
				out.print(ui.getDepart_code_fullcn());
				out.print("</td>");
				out.print("<td>");
				out.print(ui.getClient_ip());
				out.print("</td>");
				out.print("<td>");
				out.print(ui.getServer_ip());
				out.print("</td>");
				out.print("</tr>");
			}
		}
		%>
	</table>
  </body>
</html>
