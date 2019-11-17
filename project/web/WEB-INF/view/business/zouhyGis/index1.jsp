<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HEWS4voFX9F4YTv61KYWU9oyQH08SOz7"></script>
    <title>添加行政区划</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.403765, 39.914850), 5);
    map.enableScrollWheelZoom();

    function getBoundary(){
            var a=0;
            <c:forEach items="${list}" var="item" varStatus="status">
                if(a%10==0){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#ff0000", fillColor: "#ff0000"}); //建立多边形覆盖物
                }
                if(a%10==1){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#000079", fillColor: "#000079"}); //建立多边形覆盖物
                }
                if(a%10==2){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#006000", fillColor: "#006000"}); //建立多边形覆盖物
                }
                if(a%10==3){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#28004D", fillColor: "#28004D"}); //建立多边形覆盖物
                }
                if(a%10==4){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#F9F900", fillColor: "#F9F900"}); //建立多边形覆盖物
                }
                if(a%10==5){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#336666", fillColor: "#336666"}); //建立多边形覆盖物
                }
                if(a%10==6){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#613030", fillColor: "#613030"}); //建立多边形覆盖物
                }
                if(a%10==7){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#9AFF02",fillColor: "#9AFF02"}); //建立多边形覆盖物
                }
                if(a%10==8){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#0066CC", fillColor: "#0066CC"}); //建立多边形覆盖物
                }
                if(a%10==9){
                    var ply = new BMap.Polygon('${item.boundary}'.substring(0,'${item.boundary}'.length-2), {strokeWeight: 1, strokeColor: "#ff0000",fillColor:"#ff0000"}); //建立多边形覆盖物
                }
                map.addOverlay(ply);  //添加覆盖物
                var pointArray = new BMap.Point('${item.lng}','${item.lat}');
                var optsArray = {};
                optsArray.position=pointArray;
                var contentArray = '${item.name}';
                labelArray = new BMap.Label(contentArray,optsArray);
                map.addOverlay(labelArray);
                a++;
            </c:forEach>
    }
    setTimeout(function(){
        getBoundary();
    }, 2);
</script>
