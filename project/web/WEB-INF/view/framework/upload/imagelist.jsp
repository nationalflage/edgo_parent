<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <title>图片管理</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>


	<script type="text/javascript">
		$(function(){
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			var url = "<%=path%>/upload/gotoImageList.xhtml?"+data_attr;
			location.href=url;

		}
        function del()
        {
        	var row = $('#tt').datagrid('getSelected');
        	var id=row.vchr_id;
        	$.hyjx.confirm("提示信息","确定要删除【"+row.vchr_originname+"】吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>upload/gotoDelete.xhtml?ids="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
    				   		}else {
    				   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
        }
		function view(id)
	 	{
	 		openWinW('<%=path%>/upload/gotoView.xhtml?id='+id,"查看附件信息","600px","350px",false,false);
	 	}
		function xiazai(id){
  			window.location.href = "<%=path %>/download/doDownload.xhtml?fileid="+id;
		}
		function clearAll()
		{
			$("form input").val("");
		}
	</script>
  </head>
  
  <body>
  	<h1 class="public-title">图片查询</h1>
    <form id="form1" name="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
    
	<table class="table-query">
	<tbody>
		<tr>
			<th>文件名</th>
			<td>
				<input class="easyui-textbox" type="text" name="vchr_originname"/>
			</td>
			<th>所属模块</th>
			<td>
				<input class="easyui-textbox" type="text" name="vchr_domain"/>
			</td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td class="" colspan="4" align="center">
					<button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>  
			</td>
		</tr>
		</tfoot>
	</table>
</form>
<div class="result-list">
    <h1 class="title">图片列表</h1>
	<div >
	<c:forEach items="${requestScope.list}" var="i" varStatus="s">
	
	<div style="width: 200px;height: 200px;display: inline-block;border-style: solid;border-width: 1px;">
	<c:out value="${i.vchr_originname}"></c:out>
	</div>
	</c:forEach>
	</div>
	

	</div>

  </body>
</html>
<script>


</script>
