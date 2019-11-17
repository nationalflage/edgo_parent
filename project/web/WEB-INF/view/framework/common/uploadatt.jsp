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
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
<link href="<%=basePath %>css/uploadfile.css" rel="stylesheet">
<script src="<%=basePath %>js/jquery-upload-file/jquery.uploadfile.js"></script>
</head>
<body>

<div id="fileuploader">上传</div>
<input type="hidden" name="vchr_domain" value="<%=request.getParameter("vchr_domain")==null?"vchr_domain":request.getParameter("vchr_domain") %>">
<input type="hidden" name="vchr_entityid" value="<%=request.getParameter("vchr_entityid")==null?"vchr_entityid":request.getParameter("vchr_entityid") %>">
<input type="hidden" name="fileType" value="<%=request.getParameter("fileType")==null?"1":request.getParameter("fileType") %>">
	<script>
function rem()
{
	$("div[class='ajax-file-upload-statusbar']:first").remove();
}
$(document).ready(function() {
    
   if($("input[name=fileType]").val()=='1'){
			loadImage();
		}
    var domain = $("input[name=vchr_domain]").val();
    var vchr_entityid = $("input[name=vchr_entityid]").val();
    var fileType = $("input[name=fileType]").val();
    //alert(domain + fileType +myid);
	$("#fileuploader").uploadFile({
		url:"<%=basePath%>/upload/doupload.xhtml?vchr_domain="+domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid,
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
		    // alert(response);
		    <%--  $('#test').attr("src","<%=basePath%>/upload/getPreview.xhtml?fileName="+response); --%>
		     
			 $("div[class='ajax-file-upload-container']").remove();
			$.hyjx.alert("提示信息","上传成功！","info", function(){});
			if($("input[name=fileType]").val()=='1'){
			loadImage();
			}else{
			$('#tt').datagrid("reload");
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
            
          var vchr_domain = $("input[name=vchr_domain]").val();
          var vchr_entityid = $("input[name=vchr_entityid]").val();
          var fileType = $("input[name=fileType]").val();
         function loadImage(){
         
          $.ajax({
    			url:"<%=basePath%>upload/loadImage.xhtml?vchr_domain="+vchr_domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid+"&Random="+Math.random(),
    		datatype:"json",
    		success:function(res)
    		{
    			if(res!='failure'){
    			 var obj = JSON.parse(res);
    			    if(obj&&obj.rows){
    			var j = 0;
    			var tabStr="<table><tr>"
    			for(var i=0;i<obj.rows.length;i++){
    			if(i%5==0){
    			tabStr =tabStr+"<tr>";
    			          }
    			var oo=obj.rows[i];
    			tabStr =tabStr + "<td align='center'><div> <image style='cursor:pointer;' height=120 width=160 onclick='show(this)' src='<%=basePath%>/upload/getPreview.xhtml?fileName="
    			+oo.vchr_storagename+"&vchr_domain="+oo.vchr_domain+"&vchr_entityid="+oo.vchr_entityid+"' /></div><div><font size='2' >"+oo.vchr_originname+" </font>"+"<a onclick=del('"+oo.vchr_id+"') style='cursor:pointer;'><image src='<%=basePath%>/images/close.png'/></a>"+"</div> </td>";
    			   if(i%5==4){
    			          tabStr =tabStr+"</tr>";
    			              }
    			                            }
    			                            if(i%5!=0){
    			                            tabStr = tabStr + "</tr></table>";
    			                            }else{
    			                             tabStr = tabStr + "</table>";
    			                            }
    			                       }
    			                       
    			   $("#pics").html(tabStr);                    
    			                   }
    		},
    		error:function(res)
    		{
    			//$.hyjx.alert("提示信息",res.responseText,"info", function(){});
    		}
    	});

}
</script>


<!-- <img alt="" id="test" onclick="show(this)"> -->


<div id="pics"></div>



<div class="result-list">
    <h1 class="title">附件列表</h1>
	<table id="tt" style="width:100%;"></table>
	</div>




</body>
</html>
<script type="text/javascript">

$(function(){
    var fileType = $("input[name=fileType]").val();
    if(fileType=="1"){
    $(".result-list").css("display","none");
    }else{
    doQuery();
    }
	
});
function doQuery(){
	var data_attr = $("#form1").serialize();
	
	$('#tt').datagrid({
		url: "<%=path%>/upload/queryList.xhtml?vchr_domain="+vchr_domain+"&fileType="+fileType+"&vchr_entityid="+vchr_entityid+"&Random="+Math.random(),
		queryParams: data_attr,
		fitColumns: true,
		singleSelect: false,
		rownumbers: true,
		
		pageNumber: 1,
		columns:[[
				{field:'vchr_originname',title:'文件名',width:120},
				{field:'date_uploaddate',title:'上传时间',width:120},
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
    function show(value){
    //alert(value.width);
    
    window.parent.parent.layer.open({
  type: 1,
  title: false,
  closeBtn: 0,
  area: 'auto',
  skin: 'layui-layer-nobg', //没有背景色
  shadeClose: true,
  content: "<image  src="+value.src+" />"
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
			   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
			   			if($("input[name=fileType]").val()=='1'){
			   			loadImage();
			   			}else{
			   			$('#tt').datagrid("reload");
			   			}
			   		}else {
			   			$.hyjx.alert("提示","操作失败","info", function(){ });
			   		}
			   	}
			}); 
		}
		});
	}

</script>
