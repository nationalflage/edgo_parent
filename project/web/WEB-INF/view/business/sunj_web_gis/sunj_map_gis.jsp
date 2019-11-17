<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #l-map{height:500px;width:100%;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=netfd1lQmHaCnwLNHgTvpPDGmIhArNfV"></script>
    <title>map</title>
</head>
<body>
<div id="l-map"></div>
<div id="abq1">
    <a href="<%=basePath%>sunj_gis/gotoList.xhtml">企业分布图-满天星</a>
</div>
<div id="abq2">
    <a href="<%=basePath%>/sunj_gis/gotoRed.xhtml">热力图</a>
</div>
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
    var bdaryPoint = [];
    var center = [];
    for (i = 0; i < point.length; i++) {
        var bdaryPoints = [];
        var ct1 = [];
        var bdaryDate = point[i];
        for(j=0;j<bdaryDate.length;j++){
            var arr = bdaryDate[j].split(",");
            bdaryPoints.push( new BMap.Point(arr[0], arr[1]));
        }
        ct1.push(new BMap.Point(ct[i][0], ct[i][1]))
        bdaryPoint.push(bdaryPoints);
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
    var colors = "red,orange,yello,green,blue,purple,pink,black,brown,red,orange,yello,green,blue,purple,pink,black,brown"
    var colorsArr = colors.split(",");
    for(i=0;i<bdaryPoint.length;i++) {
        var polygon = new BMap.Polygon(bdaryPoint[i], {strokeColor:colorsArr[i],fillColor:colorsArr[i],fillColorOpacity:"0.4", strokeWeight:2, strokeOpacity:0});  //创建多边形
        map.addOverlay(polygon);   //增加多边形
    }
</script>
