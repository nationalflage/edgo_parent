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
	<title>头像上传</title>
    <style>
        .detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
        .detail-list1 tbody td p.detail{ margin:5px 0 5px 45px;}
        .detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
    </style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>头像上传组件</b></h1>
        <div class="detail">
            <!-- 基础信息 -->
            <div class="detail-list">
                <h3 class="title">基本信息</h3>
                <table class="detail-list1">
                    <tbody>
	                    <tr>
	                        <td>
	                            <strong>简介：</strong>头像上传组件增加了支持IE8及以上浏览器的裁剪功能
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>调用方式一</strong>
	                            <p class="detail">
	                                &lt;div class="hy-imageupload" edit="1" vchr_domain="userPhoto" vchr_entityid="undefined"> &lt;/div>
	                            </p>
	                            <p class="detail">效果预览：</p>
	                            <div class="hy-imageupload" edit="1" vchr_domain="userPhoto" vchr_entityid="undefined" style="margin:10px 0 0 45px;"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>调用方式二</strong>
	                            <p class="detail">
	                                &lt;div id="image2">&lt;/div>
	                            </p>
	                            <pre>
	        $("#image2").imageupload({
	            vchr_domain:"userPhoto",
	            vchr_entityid:"admin",
	            width:200,
	            height:200
	        });
	        					</pre>
	                            <p class="detail">效果预览：</p>
	                            <div id="image2" style="margin:10px 0 0 45px;"></div>
	                        </td>
	                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 属性 -->
        <div class="detail-list">
            <h3 class="title"><strong>属性</strong></h3>
            <table class="detail-list2">
                <thead>
                    <tr>
                        <th width="15%">属性名</th>
                        <th width="15%">中文含义</th>
                        <th width="10%">是否必填</th>
                        <th width="15%">默认值（非必填项）</th>
                        <th width="25%">值集/示例</th>
                        <th width="20%">备注</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>vchr_domain</td>
                        <td>一级目录</td>
                        <td>是</td>
                        <td>userPhoto</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>vchr_entityid</td>
                        <td>业务id</td>
                        <td>是</td>
                        <td>undefined</td>
                        <td></td>
                        <td>相关模块的业务id,使用的时候需要动态传入，具体就是一条记录的主键id</td>
                    </tr>
                    <tr>
                        <td>width</td>
                        <td>展示图片的宽度</td>
                        <td>否</td>
                        <td>135</td>
                        <td></td>
                        <td>整数，不带像素单位</td>
                    </tr>
                    <tr>
                        <td>height</td>
                        <td>展示图片的高度</td>
                        <td>否</td>
                        <td>135</td>
                        <td></td>
                        <td>整数，不带像素单位</td>
                    </tr>
                    <tr>
                        <td>edit</td>
                        <td>是否可以编辑</td>
                        <td>否</td>
                        <td>0</td>
                        <td>1或0</td>
                        <td>1：显示编辑按钮，0不展示编辑按钮</td>
                    </tr>
                </tbody>
            </table>
        </div>
	</div>
    <script>
        $(function () {
            $("#image2").imageupload({
                vchr_domain:"userPhoto",
                vchr_entityid:"admin",
                width:200,
                height:200
            });
        });
    </script>
</body>
</html>