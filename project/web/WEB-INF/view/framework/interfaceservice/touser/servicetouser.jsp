<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String t=(String)request.getAttribute("srvid");
String t1=(String)request.getParameter("srvid");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
	
   <input type="hidden" value="<c:out value="${requestScope.srvid}"/>"  id="srvid" name="srvid">
   

	<!-- 查询结果列表 begin-->
   
    <!-- 查询结果列表 end -->

	
	 <div class="result-list">
        <h1 class="title">接口服务列表</h1>
       
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
		
</body>
</html>

<script type="text/javascript">
		$(function(){
			doQuery();
		});
		
		function doQuery(){
			//alert("1");
			$('#tt').datagrid({
				url:"<%=basePath %>userservice/doUserService.xhtml",
				fitColumns:false,
				singleSelect:false,
				rownumbers:true,
				pagination:true,
				pageNumber:1,
				columns:[[
						{field:'srvname',title:'服务名称',width:100},
						{field:'srvtype',title:'服务类型',width:100},
						{field:'srvid',title:'操作列',width:100,halign:'center',
				        	formatter:function (value, rowData, rowIndex) {
				        		 return "<span class=\"btn-delete\" title=\"详细\" onclick=\"detail('"+value+"')\" ></span>"
				        	}
				        }
				]]
			});	
		}
		
		function detail(id)
		{
			url="<%=basePath %>userservice/doUserServiceDetail.xhtml?srvid="+id;
			window.open (url);
		}
	</script>
