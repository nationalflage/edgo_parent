<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" > 
<title></title>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
<link href="css/uploadfile.css" rel="stylesheet">
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>

</head>
<body>
    <!-- <div class="hy-attupload"
      fileType="1"
		vchr_entityid="hyjxvod"
		vchr_domain="vchr_domain"
		numPerRow="5" 
        imageWidth="120" 
        imageHeight="160"
        dataRight="1" 
        picShowDivId="pic" 
        nameSuffix="flv,mp4"  
		maxFileSize="100000000" 
		maxFileCount="7" 
		alreadyFileCount=""
		resultlistDiv=".result-list">上传</div> -->
   <div id="hy-attupload">上传</div>
</body>
<script>
$(function(){
	$("#hy-attupload").attupload({
		fileType:"0",
		vchr_entityid:"hyjxvod",
		vchr_domain:"vchr_domain",
		numPerRow:"5" ,
        imageWidth:"120" ,
        imageHeight:"160",
        dataRight:"1" ,
        picShowDivId:"pic", 
        nameSuffix:"flv,mp4",  
		maxFileSize:"100000000", 
		maxFileCount:"7" ,
		alreadyFileCount:"",
		resultlistDiv:".result-list"
	});
});

$(function(){
	/* $("#attUpload").attUpload(
		"view",{"id":"27d5bc9a78eb4de489876df1646419e4","filetype":"0","vchr_entityid":"hyjxvod","vchr_domain":"vchr_domain","numperrow":"5","imagewidth":"120","imageheight":"160","dataright":"1","picshowdivid":"pic","namesuffix":"jpg","maxfilesize":"100000000","maxfilecount":"7","alreadyfilecount":"","alreadywarn":"","errormsg":""}
	); */
	
	//$('#attUpload').attUpload('view',{"id":"d488f616a15344b291322f8af9028048","filetype":"0","vchr_entityid":"hyjxvod","vchr_domain":"vchr_domain","numperrow":"5","imagewidth":"120","imageheight":"160","dataright":"1","picshowdivid":"pic","namesuffix":"jpg","maxfilesize":"100000000","maxfilecount":"7","alreadyfilecount":"","alreadywarn":"","errormsg":""})
	
	//<span title="查看" class="btn-view" onclick="$('#attUpload').attUploadload('view','f55ac699cf604347b3dac2ae4cd2360c')"></span>
	//$('#attUpload').attUploadload('view','f55ac699cf604347b3dac2ae4cd2360c');
});
</script>
