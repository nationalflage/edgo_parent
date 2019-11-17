<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>附件管理列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	    function clearAll(){
	 		$("#form1").form("clear");
	 	}
	 	
	    function upload()
        {
        	$("#uploadform").submit();
        }
        function download(id)
        {
        	window.location ='<%=basePath%>fdfs/download.xhtml?id='+id;
        }
        function del(id) {
        	$.hyjx.confirm("提示信息","确定要删除此文件吗？",function(result){
    			if(!result) return;
   				$.ajax({
   				   	url: "<%=basePath %>fdfs/delete.xhtml?id="+id,
   				   	success: function(msg){
   				   		if("success" == msg) {
   				   			$('#tt').datagrid("reload");
   				   			$.hyjx.alert("提示","删除成功！","info", function(){ });
   				   		}else {
   				   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
   				   		}
   				   	}
   				}); 
	 		});
        }
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>fdfs/queryFilesList.xhtml',
				queryParams: data_attr,
				fitColumns: true	,
				singleSelect: true,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'file_name',title:'文件名称',width:'7%'},						
						{field:'file_type',title:'文件类型',width:'7%'},
						{field:'file_size',title:'大小(Kb)',width:'5%'},
						{field:'uploader',title:'上传者',width:'5%'},
						{field:'group_name',title:'分组',width:'5%'},
						{field:'fdfs_path',title:'fdfs路径',width:'25%'},						
						{field:'visit_url',title:'访问URL',width:'30%'},						
						{field:'upload_time',title:'上传时间',width:'13%'},
						{field:'business_id',title:'操作',width:'8%',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return  "<span title='下载附件' class=btn-edit onclick=download("+"\'"+rowData.id+"\'"+")></span>"+
    		        		 "<span title='删除附件'  class=btn-delete onclick=del("+"\'"+rowData.id+"\'"+")></span>";
    		        	}
    		        }
				]]
			});	
		}s


	</script>
  </head>
  
  <body>
<div class="result-list">
    <h1 class="public-title">附件列表</h1>
    <form  action="<%=basePath %>fdfs/upload.xhtml" id="uploadform" name="uploadform" method="post" enctype="multipart/form-data">
    	输入业务ID：<input type="text" name="business_id" id="business_id" maxlength="32" size="30"><br/>
    	请选择文件：<input type="file" name="file" id="file" size="30">
    	<button class="btn btn-info" type="button" onclick="upload()">上 传</button>
    </form>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>
	</div>
  </body>
</html>
