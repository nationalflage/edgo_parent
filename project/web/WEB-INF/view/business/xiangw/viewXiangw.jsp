<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<body>
<table class="table-query">
    <tbody>
    <tr>
        <td>姓名：${model.name}</td>
        <td>性别：${model.sex}</td>
    </tr>
    <tr>
        <td>出生日期：${model.birthday}</td>
        <td>年龄：${model.age}</td>
    </tr>
    <tr>
        <td>出生省：${model.csdsheng}</td>
        <td>出生市：${model.csdshi}</td>
    </tr>
    <tr>
        <td>爱好：${model.ah}</td>
        <td>擅长领域：${model.scly}</td>
    </tr>
    <tr>
        <td>部门名称：${model.bmmc}</td>
        <td>是否有效：${model.sfyx}</td>
    </tr>
    <tr>
        <td>创建人姓名：${model.cjrxm}</td>
        <td>创建人部门：${model.cjrbmmc}</td>
    </tr>
    </tbody>
    <tfoot>
        <tr heigth="100">
            <td colspan="4">
                <input type="button" class="btn" value="关  闭" onclick="window.parent.closeWin('信息详细')"/>
            </td>
        </tr>
    </tfoot>
</table>
</body>
</html>
