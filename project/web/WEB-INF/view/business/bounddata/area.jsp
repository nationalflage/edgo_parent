<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #l-map{height:500px;width:100%;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eYHdV3c4VGXHhsD0NYYUglLji7gRoTxB"></script>
    <title>map</title>
</head>
<body>
<div id="l-map"></div>
</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("l-map");
    var point = new BMap.Point(116.404, 39.915);
    map.centerAndZoom(point, 10);
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    var point = ${points}
    var name = "";
    name = ${name}
    var ct = ${center}
    var dashabi = [];
    var center = [];
    for (i = 0; i < point.length; i++) {
        var sb = [];
        var ct1 = [];
        var daye = point[i];
        for(j=0;j<daye.length;j++){
            var arr = daye[j].split(",");
            sb.push( new BMap.Point(arr[0], arr[1]));
        }
        ct1.push(new BMap.Point(ct[i][0], ct[i][1]))
        dashabi.push(sb);
        center.push(ct1);
    }
    var names = name.split(",");
    for (i=0;i<center.length;i++){
        var marker = new BMap.Marker(center[i][0]); // 创建点
        map.addOverlay(marker);            //增加点
        var label = new BMap.Label(names[i],{offset:new BMap.Size(20,-10)});
        label.setStyle({
            color : "black",
            fontSize : "15px",
            height : "20px",
            lineHeight : "20px",
            fontFamily:"微软雅黑"
        });
        marker.setLabel(label);
    }
    for(i=0;i<dashabi.length;i++) {
        var polygon = new BMap.Polygon(dashabi[i], {strokeColor:"black",fillColor:"#32"+i,fillColorOpacity:"0.4", strokeWeight:2, strokeOpacity:0});  //创建多边形
        map.addOverlay(polygon);   //增加多边形
    }
</script>
