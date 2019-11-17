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
	<title>头像上传</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<link rel="stylesheet" href="<%=basePath %>css/jquery.Jcrop.min.css" type="text/css" />
	<script src="<%=basePath %>js/jquery.Jcrop.js"></script>
	<script src="<%=basePath %>js/component/upload/imagecrop.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/ajaxfileupload.js" ></script>
</head>
<body>
	<input type="hidden" id="vchr_domain" name="vchr_domain" value="${vchr_domain}" />
	<input type="hidden" id="vchr_entityid" name="vchr_entityid" value="${vchr_entityid}"/>
	<input type="hidden" id="x" name="x" />
	<input type="hidden" id="y" name="y" />
	<input type="hidden" id="w" name="w" />
	<input type="hidden" id="h" name="h" />
	<div class="content">
		<div class="jc-box">
			<div class="box-top">
				<a class="btn btn-info" href="javascript:void(0);">头像上传<input class="add-image" type="file" id="image" name="image" contenteditable="false" onchange="change()" /></a>
				<span class="tip">请上传jpg、png格式</span>
			</div>
			<div class="box-mian">
				<div class="container-left">
					<div class="jc-demo-box" data="0">
						<div id="target" class="jcrop_w">
							<img id="target-img" name="target-img" alt=""/>
						</div>
					</div>
					<div class="operate-container">
						<span id="idLeft" class="bch bch1"></span>
						<span id="idSmall" class="bch bch2"></span>
						<span id="idBig" class="bch bch3"></span>
						<span id="idRight" class="bch bch4"></span>
					</div>
				</div>
				<div class="container-right" id="preview-pane">
					<div class="preview-container">
						<img src="<%=basePath %>images/component/image-default.jpg" class="jcrop-preview jcrop_preview_s" alt="" />
					</div>
				</div>
			</div>
			<div class="box-bottom">
				<a class="btn btn-info" href="javascript:void(0);" onclick="savePhoto()">保存头像</a>
				<a class="btn" href="javascript:void(0);" onclick="cancel()">取消</a>
			</div>
		</div>
	</div>
</body>
</html>