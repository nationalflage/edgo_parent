<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>左侧菜单栏</title>
    
    <script type="text/javascript">
        function addright(name,url)
        {
        	self.parent.mainFrame.addTab(name,url.indexOf("http://")>-1 ? url : "<%=basePath%>"+url);
        }
    </script>
</head>
<body>
 <div class="leftArea">
    <div class="left-menu">
    	<h1 class="menu1"><a target="mainFrame" href="javascript:void(0);">首页</a></h1>
    	<c:forEach items="${list}" var="menu">
    	<c:if test="${fn:length(fn:split(menu.menu_code_full,'.'))==1}">
        <h1><a target="mainFrame" href="javascript:void(0);"><c:out value="${menu.menu_name }"></c:out></a></h1>
        <ul class="left-ul" >
        <c:forEach items="${list }" var="menu2">
        	<c:if test="${menu2.menu_parent_code == menu.menu_code}">
            <li class="menu2"><a target="mainFrame" href="javascript:void(0);" onclick="addright('${menu2.menu_name }','${menu2.func_entra }');"><c:out value="${menu2.menu_name }"></c:out> </a></li>
        	</c:if>
        </c:forEach>
        </ul>
        </c:if>
    </c:forEach>
    </div>
   </div>
</body>
</html>

