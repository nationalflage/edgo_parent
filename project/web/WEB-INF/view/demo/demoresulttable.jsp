<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title></title>
</head>
<script type="text/javascript">
</script>
<body >
<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title">论文查询列表</h1>
        <!-- 操作按钮 -->
        <div class="operate">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('添加')">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('删除')">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('保存')">保存</a>
        </div>
        <table class="easyui-datagrid"  iconCls="icon-save" pagination="true">
            <thead>
                <tr>
                    <th field="itemid" width="10%" align="center">序号</th>
                    <th field="companyid" width="30%" align="left">企业名称</th>
                    <th field="regcode" width="25%" align="left">注册号</th>
                    <th field="companykind" width="20%" align="left">企业类型</th>
                    <th field="status" width="15%" align="left">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="list" varStatus="status">
	            	<tr>
	                    <td class="center">${status.index+1 }</td>
	                    <td>${list.orgname }</td>
	                    <td>${list.orgcode }</td>
	                    <td>${list.busiscope }</td>
	                    <td>
	                        <span class="btn-view" title="查看" onclick="" ></span>
	                        <span class="btn-edit" title="编辑" onclick="" ></span>
	                        <span class="btn-delete" title="删除" onclick="" ></span>
	                    </td>
	                </tr>
		 		</c:forEach>
            </tbody> 
        </table>
    </div>
    <!-- 查询结果列表 end -->



</body>
</html>