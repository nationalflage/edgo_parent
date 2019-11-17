<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="theme" uri="/WEB-INF/tlds/theme.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
var baseUrl = "<%=basePath%>" ;
function openwinresize(){
	var length = $('.datagrid-f').length;
	if(length > 0)
	{
		for(var i=0;i<length;i++)
		{
			$($('.datagrid-f')[i]).datagrid('resize'); 
		}
	}
}

</script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>theme/<theme:ThemeTags/>.css"/>

<script type="text/javascript" src="<%=basePath %>js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/easyui/jquery.easyui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/hyjx.components.js"></script>

