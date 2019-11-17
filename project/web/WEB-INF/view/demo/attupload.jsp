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
    <title>附件上传</title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath %>css/component/attupload.css">
    <script type="text/javascript" src="<%=basePath %>js/component/upload/webuploader.js"></script>
</head>

<body>
    <div class="content">
        <h1 class="public-title"><b>附件上传</b></h1>
        <div class="hy-attupload" dataRight="1" vchr_domain="att" vchr_entityid="undefined" style="padding-top: 10px;"></div>
    </div>
        <%--<div class="add-file" id="file1" name="file1">上传文件</div>--%>
        <%--<div class="hy-attupload2">--%>
        <%--<div class="attach-wrap">--%>
            <%--<b class="attach-bg ico ico-file-docx"></b><!--与文件类型对应的图标-->--%>
            <%--<div class="attach-info-wrap">--%>
                <%--<p class="attach-name ellipsis">文件名称文件名称文件名称文件名称文件名称</p>--%>
                <%--<p class="attach-size">--%>
                    <%--24KB--%>
                    <%--<span class="attach-speed">150.6KB/s</span><!--upload speed-->--%>
                <%--</p>--%>
                <%--<img class="attach-loading" src="http://gwebmail4.alicdn.com/static/5094153/images/loading/round_big.gif" alt="加载中"/>--%>
                <%--<!-- toolbar layer begin-->--%>
                <%--<div class="attach-toolbar-wrap">--%>
                    <%--<div class="attach-toolbar-mask"></div>--%>
                    <%--<p class="attach-preview" title="预览"><b class="ico ico-attach-preview"></b></p>--%>
    <%--<p class="attach-download" title="下载"><b class="ico ico-attach-download"></b></p>--%>
    <%--<p class="attach-remove" title="删除"><b class="ico ico-attach-remove"></b></p>--%>
    <%--</div>--%>
                <%--<!-- toolbar layer end-->--%>
                <%--<div class="attach-progress"></div><!--进度条-->--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
</body>
</html>
