<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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


	<script>
function rem()
{
	$("div[class='ajax-file-upload-statusbar']:first").remove();
}
$(document).ready(function() {
	$("#fileuploader").uploadFile({
		url:"<%=basePath%>/upload/doupload.xhtml?id=1",
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
			$('#tt').datagrid("reload");
			alert("上传成功");
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









<div class="result-list">
    <h1 class="title">附件列表</h1>
	<table id="tt" style="width:100%;"></table>
	</div>




</body>
</html>
<script type="text/javascript">

$(function(){
	doQuery();
});
function doQuery(){
	var data_attr = $("#form1").serialize();
	$('#tt').datagrid({
		url: '<%=path%>/upload/queryList.xhtml?entityid=业务id&domain=',
		queryParams: data_attr,
		fitColumns: true,
		singleSelect: false,
		rownumbers: true,
		pagination: true,
		pageNumber: 1,
		columns:[[
				{field:'vchr_originname',title:'文件名',width:120},
				{field:'vchr_description',title:'描述',width:100},
			{field:'vchr_id',title:'操作',width:100,
	        	formatter: function (value, rowData, rowIndex) {
	        		 var html = "";
	        		 html+="<span title=查看  class=btn-view onclick=view("+"\'"+value+"\'"+")></span>";
	        		 //html+="<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>";
	        		 html+="<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>";
	        		 return html;
	        	}
	        }
		]]
	});	
}
function view(id)
	{
		openWinW('<%=basePath%>upload/gotoView.xhtml?id='+id,"查看附件信息","500px","290px",false,false);
	}
function del(id)
	{
		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
		if(result == true){
			$.ajax({
			   	url: "<%=basePath %>upload/gotoDelete.xhtml?ids="+id,
			   	success: function(msg){
			   		if("success" == msg) {
			   			$('#tt').datagrid("reload");
			   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
			   		}else {
			   			$.hyjx.alert("提示","操作失败","info", function(){ });
			   		}
			   	}
			}); 
		}
		});
	}

</script>
