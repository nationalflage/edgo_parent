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
    <title>附件列表</title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=path%>/upload/queryList.xhtml?entityid=${entityid}&domain=${domain}',
				queryParams: data_attr,
				fitColumns: true,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'vchr_originname',title:'文件名',width:120},
						{field:'vchr_domain',title:'模块名',width:100},
						{field:'vchr_entityid',title:'关联记录编号',width:200},
						{field:'num_filesize',title:'文件大小',width:50,formatter:function(value,rowData,rowIndex){
							return value / 1000+" KB";
						}},
						{field:'date_uploaddate',title:'上传日期',width:80},
						<c:if test="${type=='2'}">
							{field:'vchr_storagename',title:'预览',align:"center",width:100,formatter:function(value, rowData, rowIndex){
								return "<img onclick=showimage('"+rowData.vchr_entityid+"','"+rowData.vchr_domain+"','"+rowData.vchr_storagename+"','"+rowData.vchr_id+"') style='height:100px;cursor:pointer' src=<%=basePath%>upload/getPreview.xhtml?vchr_id="+rowData.vchr_id+"&vchr_entityid="+rowData.vchr_entityid+"&vchr_domain="+rowData.vchr_domain+"&fileName="+rowData.vchr_storagename+">";
							}},
						</c:if>
					{field:'vchr_id',title:'操作',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		var str= "";
  		        		  str= "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"+
   		        		"<span title=删除  class=btn-delete onclick=del('"+rowData.vchr_originname+"','"+value+"')></span>";
   		        		return str;
    		        	}
    		        }
				]]
			});	
		}
		function showimage(a,b,c,d)
		{
			var url = "<%=basePath%>upload/getPreview.xhtml?vchr_id="+d+"&vchr_entityid="+a+"&vchr_domain="+b+"&fileName="+c;
			open(url);
		}
		 function del(vchr_originname,id)
	        {
	        	//var row = $('#tt').datagrid('getSelected');
	        	//var id=row.vchr_id;
	        	$.hyjx.confirm("提示信息","确定要删除【"+vchr_originname+"】吗？",function(result){
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
	 		openWinW("<%=path%>/upload/gotoView.xhtml?id="+id+"&type=${type}","查看附件信息","600px","350px",false,false);
	 	}
		function xiazai(id){
  			window.location.href = "<%=path %>/download/doDownload.xhtml?fileid="+id;
		}
		function clearAll()
		{
			$("#vchr_domain").textbox("setValue","");
			$("#vchr_originname").textbox("setValue","");
		}
	</script>
  </head>
  
  <body>
  	<div class="content">
  	<h1 class="public-title"><b>附件查询</b></h1>
    <form id="form1" name="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
    <input type=hidden name=type value=${type}>
	<table class="table-query">
	<tbody>
		<tr>
			<th>文件名</th>
			<td>
				<input class="easyui-textbox" type="text" name="vchr_originname" id="vchr_originname"/>
			</td>
			<th>模块名</th>
			<td>
				<input class="easyui-textbox" type="text" name="vchr_domain" id="vchr_domain"/>
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
</div>

<div class="content">
<div class="result-list">
    <h1 class="title"><b>附件列表</b></h1>
	<table id="tt" style="width:100%;"></table>
	</div>
	</div>
	
  </body>
</html>
