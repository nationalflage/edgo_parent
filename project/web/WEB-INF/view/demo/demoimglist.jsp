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
	<title>图文列表</title>
</head>
<body>
	<div class="content">
	    <h1 class="public-title"><b>图文列表</b></h1>
	    <!-- 图文列表 begin-->
	    <div class="img-lists">
	        <div class="img-list">
	            <img class="left" src="<%=basePath %>images/list-img1.png" alt="配图"/>
	            <div class="right">
	                <h2>食品安全大会讲座第一期</h2>
	                <table class="detail-list3">
	                	<tbody>
		                    <tr>
		                        <th width="80">发布单位：</th>
		                        <td>宜昌市食品药品监督管理局</td>
		                        <th width="80">业务环节：</th>
		                        <td>生产</td>
		                    </tr>
		                    <tr>
		                        <th>课程类型：</th>
		                        <td>法律法规</td>
		                        <th>发布日期：</th>
		                        <td>2016-05-15</td>
		                    </tr>
		                    <tr>
		                        <th>业务范围：</th>
		                        <td>药品</td>
		                        <th>有效期：</th>
		                        <td>2017-05-15</td>
		                    </tr>
		                    <tr>
		                        <th valign="top">简　　介：</th>
		                        <td colspan="3">据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示，2015年，最强中学TOP50中，据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示</td>
		                    </tr>
	                	</tbody>
	                </table>
	            </div>
	        </div>
	        <div class="img-list">
	            <img class="left" src="<%=basePath %>images/list-img1.png" alt="配图"/>
	            <div class="right">
	                <h2>食品安全大会讲座第一期</h2>
	                <table class="detail-list3">
	                	<tbody>
		                    <tr>
		                        <th width="80">发布单位：</th>
		                        <td>宜昌市食品药品监督管理局</td>
		                        <th width="80">业务环节：</th>
		                        <td>生产</td>
		                    </tr>
		                    <tr>
		                        <th>课程类型：</th>
		                        <td>法律法规</td>
		                        <th>发布日期：</th>
		                        <td>2016-05-15</td>
		                    </tr>
		                    <tr>
		                        <th>业务范围：</th>
		                        <td>药品</td>
		                        <th>有效期：</th>
		                        <td>2017-05-15</td>
		                    </tr>
		                    <tr>
		                        <th valign="top">简　　介：</th>
		                        <td colspan="3">据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示，2015年，最强中学TOP50中，据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示</td>
		                    </tr>
	                	</tbody>
	                </table>
	            </div>
	        </div>
	        <div class="img-list">
	            <img class="left" src="<%=basePath %>images/list-img1.png" alt="配图"/>
	            <div class="right">
	                <h2>食品安全大会讲座第一期</h2>
	                <table class="detail-list3">
	                	<tbody>
		                    <tr>
		                        <th width="80">发布单位：</th>
		                        <td>宜昌市食品药品监督管理局</td>
		                        <th width="80">业务环节：</th>
		                        <td>生产</td>
		                    </tr>
		                    <tr>
		                        <th>课程类型：</th>
		                        <td>法律法规</td>
		                        <th>发布日期：</th>
		                        <td>2016-05-15</td>
		                    </tr>
		                    <tr>
		                        <th>业务范围：</th>
		                        <td>药品</td>
		                        <th>有效期：</th>
		                        <td>2017-05-15</td>
		                    </tr>
		                    <tr>
		                        <th valign="top">简　　介：</th>
		                        <td colspan="3">据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示，2015年，最强中学TOP50中，据《中国大陆出国留学最强中学TOP50榜暨美国大学TOP名校中国招生报告》（简称报告）显示</td>
		                    </tr>
	                	</tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    <!-- 图文列表 end-->
	</div>
</body>
</html>