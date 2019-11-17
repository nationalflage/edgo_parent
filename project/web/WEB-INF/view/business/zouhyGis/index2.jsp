<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>加载海量点</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <style type="text/css">
        html,body{
            margin:0;
            width:100%;
            height:100%;
            background:#ffffff;
        }
        #map{
            width:100%;
            height:100%;
        }
        #login input[type=password]{
            width:200px;
            height:30px;
            padding:3px;
            line-height:30px;
            border:1px solid #000;
        }
        #login input[type=submit]{
            width:80px;
            height:38px;
            display:inline-block;
            line-height:38px;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HEWS4voFX9F4YTv61KYWU9oyQH08SOz7"></script>
    <script type="text/javascript" src="http://lbsyun.baidu.com/jsdemo/data/points-sample-data.js"></script>
</head>
<body>
<div id="map"></div>
<script type="text/javascript">
    var map = new BMap.Map("map", {});                        // 创建Map实例
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);     // 初始化地图,设置中心点坐标和地图级别
    map.enableScrollWheelZoom();                        //启用滚轮放大缩小
    if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
        var points = [];  // 添加海量点数据
        <c:forEach items="${list}" var="item" varStatus="status">
        points.push(new BMap.Point('${item.lng}', '${item.lat}'));
        </c:forEach>
        var options = {
            size: BMAP_POINT_SIZE_SMALL,
            shape: BMAP_POINT_SHAPE_STAR,
            color: 'red'
        }
        var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
        pointCollection.addEventListener('click', function (e) {
            var a=0;
            <c:forEach items="${list}" var="item" varStatus="status">
                if(e.point.lng=="${item.lng}"&&e.point.lat=="${item.lat}"){
                    if(a==0){
                        var opts = {
                            width : 200,     // 信息窗口宽度
                            height: 200,     // 信息窗口高度
                            title : "${item.entname}" , // 信息窗口标题
                            enableMessage:true,//设置允许信息窗发送短息
                            message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
                        }
                        var infoWindow = new BMap.InfoWindow("<br>社会信用代码：${item.uniscid}<br><br>地址：${item.dom}", opts);
                       map.openInfoWindow(infoWindow,e.point);
                    }
                    a++;
                }
            </c:forEach>

        });
        map.addOverlay(pointCollection);  // 添加Overlay
    } else {
        alert('请在chrome、safari、IE8+以上浏览器查看本示例');
    }
</script>
</body>
</html>


