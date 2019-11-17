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
<script src="<%=basePath %>js/jquery-upload-file/jquery.form.js"></script>
<script src="<%=basePath %>js/jquery-upload-file/jquery.uploadfile.js"></script>
</head>
<body>

<div id="fileuploader">上传</div>

<div id="errMsg"></div>

</body>
</html>
<script>
     
     function showError(){
     $('#errMsg').datagrid({
        		    url:'<%=basePath %>common/showErrorMsg.xhtml?',
        		    singleSelect: true,
    				rownumbers: true,
    				
    				pageNumber: 1,
        		    columns:[[
        		        {field:'errorMsg',title:'错误信息',width:140,
        		        	formatter: function (value, rowData, rowIndex) {
        		        		 return value;
        		        	}	
        		        }
        		    ]]
        		});	
     }
     
     
     function rem()
     {
	$("div[class='ajax-file-upload-statusbar']:first").remove();
     }

$(document).ready(function() {

$("#fileuploader").uploadFile({
		url:"<%=basePath%>common/doImport.xhtml?en_module_name=${requestScope.en_module_name}",
		fileName:"myfile",
		allowedTypes:"jpg,pdf,txt,doc,docx,xls,xlsx,png,bmp",  //扩展名限制
		multiple:true,	//是否允许选择多个文件
		enctype:"multipart/form-data",
		showProgress:false,	//是否显示进度
		showDelete: false,		//是否显示删除按钮
		maxFileCount:5,			//最大同时上传文件数
		showStatusAfterSuccess: true,//是否显示上传成功状态
        showStatusAfterError: true, //是否显示上传失败状态
        showDownload:false,
        downloadCallback: true,
        showView:false,
        showFileSize:false,
		deleteCallback:function(data,pd)//删除回掉函数
		{
			//alert(pd.filename[0].innerText);
			var filename = pd.filename[0].innerText.split('(')[0];
			alert(filename);
		},
		onSuccess:function (files, response, xhr, pd)
		{
			$("div[class='ajax-file-upload-container']").remove();
			if(response!=null){
			if(response.erros>0){
			    showError();
			}
			//$("#errMsg").html(response.errMsg);
			 $.hyjx.alert("提示信息","上传成功！总共上传"+response.total+"条记录，成功"+response.succs+"条，失败<font style='color:red;'>"+response.erros+"</font>条，<a onclick='javascript:void(0)' href='<%=basePath %>common/downLoad.xhtml?en_module_name=${requestScope.en_module_name}'><font style='color:red;'>下载失败数据</font></a>" ,"info", function(){});
			}
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