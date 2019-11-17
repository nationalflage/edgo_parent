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
	<title>附件预览</title>
	<script type="text/javascript" src="<%=basePath %>js/easyui/jquery.min.js"></script>
	<style>
		html,body{
			height:100%;
		}
		.att-view{
			display: none;
			width: 100%;
			height: 98%;
		}
		.att-view.active{
			display: block;
		}
		.file-preview-text {
			display: none;
			width: 97%;
			height: 97%;
			padding:8px 1%;
			margin: 0 auto;
			color: #428bca;
			font-size:14px;
			border: 1px solid #ddd;
			outline: none;
			resize: none;
			overflow: auto;
		}
		.file-preview-text.active{
			display: block;
		}
	</style>
	<script>
		var baseUrl="<%=basePath %>";
		$(function(){
            showFile();
		});

		function getViewFile(url) {
            $.ajax({
                url: url,
                success: function(msg) {
                    $(".file-preview-text").text(msg);
                    $(".file-preview-text").addClass("active");
                }
            });
        }

        function showFile() {
            var id=$("#fileId").val();
            var domain=$("#domain").val();
            var entityid=$("#entityid").val();
            var url=baseUrl+"upload/view.xhtml?id="+id+"&vchr_domain="+domain+"&vchr_entityid="+entityid;
			if("${viewType}"=="2"){
                getViewFile(url);
			}else if("${viewType}"=="1"){
                $(".att-view").attr("src",url);
                $(".att-view").addClass("active");
            }
        }

	</script>
</head>
<body>
<input id="fileId" name="fileId" type="hidden" value="${id}">
<input id="domain" name="domain" type="hidden" value="${vchr_domain}">
<input id="entityid" name="entityid" type="hidden" value="${vchr_entityid}">
<%--<object class="att-view" data=""></object>--%>
<iframe src="" class="att-view"></iframe>
<textarea class="file-preview-text" readonly="true"></textarea>
</body>
</html>