<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	
    <title>信息列表</title>
	<script type="text/javascript">
		$(function(){
			parent.refreshMsgCount();
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=path%>/message/queryList.xhtml',
				queryParams: data_attr,
				
				singleSelect: true,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'title',title:'标题',width:300},
					  //{field:'content',title:'内容',width:100},
						{field:'fromuser',title:'发送人',width:100},
//						{field:'bus_pkey',title:'业务主键',width:100},
						{field:'sendtime',title:'发送时间',width:180},
// 						{field:'type',title:'消息类型',width:80},
//						{field:'invalidtime',title:'失效时间',width:120},
//						{field:'tousername',title:'接收人',width:100},
						{field:'isread',title:'是否已读',width:80,
							formatter: function(value,row,index){
								if(value == "0")  
									return  "未读";
								else{
									return "已读";
								}
								}
						},
					{field:'msgid',title:'操作',width:100,
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"
    		        		 //+
    		        		 //"<a class=\"color1\"  onclick=del("+"\'"+value+"\'"+") >"+"删除"+"</a>"
    		        		 ;
    		        	}
    		        }
				]],
			rowStyler:function(index,row){
			}
			});	
		}
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
		function add()
	 	{
	 		openWinW('<%=path%>/user/gotoAdd.xhtml',"信息添加","800px","500px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=path%>/user/gotoEdit.xhtml?id='+id,"信息修改","800px","500px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=path%>/user/gotoDelete.xhtml?ids="+id,
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
	 		location.href = '<%=path%>/message/gotoView.xhtml?id='+id;
	 		//openWinW('<%=path%>/message/gotoView.xhtml?id='+id,"信息详细","800px","500px",false,false);
	 	}
	</script>
  </head>
  
  <body>
<div class="result-list">
    <h1 class="public-title">消息列表</h1>
        <div id="tb" class="operate" style="display: none;">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        </div>
	<table id="tt" style="width:100%;" class="easyui-datagrid"></table>
	</div>
  </body>
</html>
