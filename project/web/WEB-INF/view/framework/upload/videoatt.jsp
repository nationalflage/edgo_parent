<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" > 
<title></title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>js/jquery-upload-file/jquery.uploadfile.js"></script>
<link href="<%=basePath %>css/uploadfile.css" rel="stylesheet">
</head>
<body>
	<div class="content" >
	    <div class="hy-attupload"
	      fileType="1"
			vchr_entityid="hyjxvod"
			vchr_domain="group1"
			numPerRow="5" 
	        imageWidth="120" 
	        imageHeight="160"
	        dataRight="1" 
	        picShowDivId="pic" 
	        nameSuffix="*"  
			maxFileSize="100000000" 
			maxFileCount="2" 
			>上传</div>
	
	   
		<div id="t1"></div>
	</div>
</body>
<script>
$(function(){
	/* $("#hy-attupload").attupload({
		 fileType:"1",
	     nameSuffix:"*",
	     picShowDivId:"t1",
	     dataRight:0,
	     maxFileCount:2,
	     unicode:"aaa"
	     
	}); */
	/* $("#hy-attupload1").attupload({
		 fileType:"1",
	     nameSuffix:"*",
	     picShowDivId:"t2",
	      maxFileCount:3,
	       unicode:"bbb"
	    
	}); */
});
</script>
