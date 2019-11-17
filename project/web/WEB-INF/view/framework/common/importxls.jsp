<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<link href="<%=basePath %>css/uploadfile.css" rel="stylesheet">
<script src="<%=basePath %>js/jquery-upload-file/jquery.uploadfile.js"></script>
</head>
<body>
<div id="fileuploader">上传</div>



</body>
</html>
<script>
$(document).ready(function() {
	$("#fileuploader").uploadFile({
		url:"<%=basePath%>excel/doImport.xhtml?t=${t}",
		fileName:"myfile",
		allowedTypes:"xls,xlsx",  //扩展名限制
		multiple:false,	//是否允许选择多个文件
		enctype:"multipart/form-data",
		showProgress:false,	//是否显示进度
		showDelete: false,		//是否显示删除按钮
		maxFileCount:5,			//最大同时上传文件数
		showStatusAfterSuccess: false,//是否显示上传成功状态
        showStatusAfterError: false, //是否显示上传失败状态
        showDownload:false,
        downloadCallback: true,
        showView:false,
        showFileSize:false,
		deleteCallback:function(data,pd)//删除回掉函数
		{
			//alert(pd.filename[0].innerText);
			var filename = pd.filename[0].innerText.split('(')[0];
		},
		onSuccess:function (files, response, xhr, pd)
		{
			$("div[class='ajax-file-upload-container']").remove();
			$('#tt').datagrid("reload");
			$.hyjx.alert("提示信息","上传成功！","info", function(){});
		},
		onError: function (files, status, message, pd) {
			alert("上传失败");
		},
		onSelect:function(files)
		{
			
		},
		viewCallback:function(data,pd)
		{
			var filename = pd.filename[0].innerText.split('(')[0];
			alert(filename);
		},
		downloadCallback:function(data)
		{
			alert(data);
		}
	});
});
</script>