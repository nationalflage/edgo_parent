<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
     <jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
    <title>ajax文件上传</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <input type="hidden" name="vchr_domain" value="<%=request.getParameter("vchr_domain")==null?"vchr_domain":request.getParameter("vchr_domain") %>">
    <input type="hidden" name="vchr_entityid" value="<%=request.getParameter("vchr_entityid")==null?"vchr_entityid":request.getParameter("vchr_entityid") %>">
    <input type="hidden" name="fileType" value="<%=request.getParameter("fileType")==null?"1":request.getParameter("fileType") %>">
      
   
    <script type="text/javascript">    
     var vchr_domain = $("input[name=vchr_domain]").val();
     var vchr_entityid = $("input[name=vchr_entityid]").val();
     var fileType = $("input[name=fileType]").val();
        // 开始上传文件时显示一个图片
    //上传图片
    $(function(){
       $("#btnUpload").click(function() {
               ajaxFileUpload();
       });
    });
    function ajaxFileUpload() {
       
        var elementIds=["flag"]; //flag为id、name属性名
        $.ajaxFileUpload({
            url: "<%=basePath%>/upload/doupload.xhtml?vchr_domain="+vchr_domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid, 
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'file', // 上传文件的id、name属性名
            dataType: 'text', //返回值类型，一般设置为json、application/json
            elementIds: elementIds, //传递参数到服务器，要传递到后台的参数
            success: function(data, status){  
            //data是图片在磁盘上的相对路径
             doQuery();
            },
            error: function(data, status, e){ 
               $.hyjx.alert("提示信息","失败！","info", function(){});
            }
        });
    }
    
    
    function doQuery(){
	var data_attr = $("#form1").serialize();
	$('#tt').datagrid({
		url: "<%=path%>/upload/queryList.xhtml?entityid=业务id",
		queryParams: data_attr,
		fitColumns: true,
		singleSelect: false,
		rownumbers: true,
		pagination: true,
		pageNumber: 1,
		columns:[[
				{field:'vchr_originname',title:'文件名',width:120},
				{field:'date_uploaddate',title:'上传时间',width:120},
			{field:'vchr_id',title:'操作',width:100,
	        	formatter: function (value, rowData, rowIndex) {
	        		 var html = "";
	        		 html+="<span title=查看  class=btn-view onclick=view("+"\'"+value+"\'"+")></span>";
	        		 html+="<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\'"+")></span>";
	        		 return html;
	        	}
	        },
    		         {field:'vchr_storagename',title:'缩略图',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        	      var imageStr = "jpg,png,bmp,jpeg,gif" ;
    		        	      var imageFormat = value.substring(value.lastIndexOf(".")+1,value.length);
    		        	      if(imageStr.indexOf(imageFormat.toLowerCase())>=0){//src=文件上传时的路径+文件名字
    		        	      return "<a onclick='show(\""+value+"\")'><image width='50' height='50'  src='<%=basePath%>/upload/getPreview.xhtml?fileName="+ value + "&vchr_domain="+vchr_domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid+" '/></a> <br/>";
    		        	      }
    		        		 
    		        	}
    		        }
	        
		    ]]
	        });	
     }
    
 function show(value){
   window.parent.layer.open({
   type: 1,
   title: false,
   closeBtn: 0,
   skin: 'layui-layer-nobg', //没有背景色
   shadeClose: true,
   content: "<image  src=\"<%=basePath%>upload/getPreview.xhtml?fileName="+ value + "&vchr_domain="+vchr_domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid+"\" />"
  });
    }
    
    function view(id)
	{
		openWinW('<%=basePath%>upload/gotoView.xhtml?id='+id,"查看附件信息","500px","290px",false,false);
	}function del(id)
	{
		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
		if(result == true){
			$.ajax({
			   	url: "<%=basePath %>upload/gotoDelete.xhtml?ids="+id,
			   	success: function(msg){
			   		if("success" == msg) {
			   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
			   			if($("input[name=fileType]").val()=='1'){
			   			loadImage();
			   			}else{
			   			$('#tt').datagrid("reload");
			   			}
			   		}else{
			   			$.hyjx.alert("提示","操作失败","info", function(){ });
			   		}
			   	}
			}); 
		}
		});
	}
    </script>
  </head>
  
  <body>
  
  <table bgcolor="" align="center" width="60%" >
  <tr height="120"><td valign="middle">
    <A class=btn_addPic href="javascript:void(0);"><SPAN><EM>+</EM>选择图片</SPAN> 
    <INPUT  onchange="previewImage(this,'imghead','preview')"  class=filePrew  id="file" name="file" title=支持jpg、jpeg、gif、png格式， tabIndex=3 type="file" size=3 name=pic  ></A>  
  </td>
  
  <td  valign="middle">
  
   <div id="preview"><img id="imghead"   src='<%=basePath%>image/qq.jpg' onclick="show(shis)">  </div>
  </td>
  <td align="right">
  
   <input type="button" class="btn btn-info" id="btnUpload" value="上传图片" />
  </td>
  </tr>
  <tr><td align="left" colspan="3">
 
  <input type="hidden" id="flag" name="flag" value="ajax文件上传"/>
 </td></tr>
  </table>
<div class="result-list">
    <h1 class="title">附件列表</h1>
	<table id="tt" style="width:100%;"></table>
	</div>
  </body>
</html>