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
	<title>详细页</title>
</head>
<body>
<div class="content">
    <h1 class="public-title"><b>内容展示</b></h1>
    <div class="detail">
        <!-- 基础信息 -->
        <div class="detail-list">
            <h3 class="title">基本信息</h3>
            <table class="detail-list1">
                <thead>
	                <tr>
	                    <td width="50%"></td>
	                    <td width="50%"></td>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>地址：<strong>通州区梨园北街30号</strong></td>
	                    <td>许可证号：<strong>京餐证字1102005080809090102</strong></td>
	                </tr>
	                <tr>
	                    <td>社会信用代码：<strong>17216212718312</strong></td>
	                    <td>社会信用代码：<strong>17216212718312</strong></td>
	                </tr>
	                <tr>
	                    <td>监管单位：<strong>梨园食药所</strong></td>
	                    <td>监管负责人：<strong>高雷、王鹏</strong></td>
	                </tr>
	                <tr>
	                    <td colspan="2">地理信息定位：</td>
	                </tr>
	                <tr>
	                    <td colspan="2"><img src="<%=basePath %>images/map.jpg"></td>
	                </tr>
                </tbody>
            </table>
        </div>

        <!-- 餐饮许可证信息 -->
        <div class="detail-list">
            <h3 class="title">餐饮许可证信息</h3>
            <table class="detail-list1">
                <thead>
	                <tr>
	                    <td width="50%"></td>
	                    <td width="50%"></td>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>许可证号：<strong>京餐证字1102005080809090102</strong></td>
	                    <td>经营范围：<strong>凉菜</strong></td>
	                </tr>
	                <tr>
	                    <td>有效期起：<strong>2016年1月1日</strong></td>
	                    <td>有效期至：<strong>2020年12月31日</strong></td>
	                </tr>
	                <tr>
	                    <td>法人：<strong>高德</strong></td>
	                    <td>&nbsp;</td>
	                </tr>
                </tbody>
            </table>
        </div>

        <!-- 其它证照信息 -->
        <div class="detail-list">
            <h3 class="title">其它证照信息 </h3>
            <table class="detail-list1">
                <thead>
	                <tr>
	                    <td width="50%"></td>
	                    <td width="50%"></td>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>卫生许可证：<strong>12121212121</strong></td>
	                    <td>地址：<strong>北京市朝阳区八里庄325房</strong></td>
	                </tr>
                </tbody>
            </table>
        </div>

        <!-- 监督检查信息 -->
        <div class="detail-list">
            <h3 class="title">监督检查信息</h3>
            <table class="detail-list2">
                <thead>
	                <tr>
	                    <th width="20%">检查日期</th>
	                    <th width="20%">检查单位</th>
	                    <th width="20%">检查人</th>
	                    <th width="20%">检查结果</th>
	                    <th width="20%">检查详情</th>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>2016-1-4</td>
	                    <td>食药局</td>
	                    <td>王美玲</td>
	                    <td>责令整改</td>
	                    <td><a class="link" href="javascript:void(0);">[查看]</a></td>
	                </tr>
	                <tr>
	                    <td>2016-1-4</td>
	                    <td>食药局</td>
	                    <td>王美玲</td>
	                    <td>责令整改</td>
	                    <td><a class="link" href="javascript:void(0);">[查看]</a></td>
	                </tr>
	                <tr>
	                    <td>2016-1-4</td>
	                    <td>食药局</td>
	                    <td>王美玲</td>
	                    <td>责令整改</td>
	                    <td><a class="link" href="javascript:void(0);">[查看]</a></td>
	                </tr>
                </tbody>
            </table>
        </div>

        <!-- 执法案件信息 -->
        <div class="detail-list">
            <h3 class="title">执法案件信息</h3>
            <table class="detail-list2">
                <thead>
	                <tr>
	                    <th width="">案件编号</th>
	                    <th width="">案由</th>
	                    <th width="">处理结果</th>
	                    <th width="">处理单位</th>
	                    <th width="">案件承办人</th>
	                    <th width="">案件内容</th>
	                    <th width="">结案日期</th>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>2016040501212</td>
	                    <td>超范围经营</td>
	                    <td>罚款5万</td>
	                    <td>稽查大队</td>
	                    <td>高飞</td>
	                    <td>超范围经营，无证制售xxx，被投诉</td>
	                    <td>2016年5月1日</td>
	                </tr>
	                <tr>
	                    <td>2016040501212</td>
	                    <td>超范围经营</td>
	                    <td>罚款5万</td>
	                    <td>稽查大队</td>
	                    <td>高飞</td>
	                    <td>超范围经营，无证制售xxx，被投诉</td>
	                    <td>2016年5月1日</td>
	                </tr>
	                <tr>
	                    <td>2016040501212</td>
	                    <td>超范围经营</td>
	                    <td>罚款5万</td>
	                    <td>稽查大队</td>
	                    <td>高飞</td>
	                    <td>超范围经营，无证制售xxx，被投诉</td>
	                    <td>2016年5月1日</td>
	                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>