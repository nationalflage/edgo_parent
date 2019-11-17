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
	<title></title>
</head>

<body>
<div class="content">
	<h1 class="public-title"><b>查询条件</b></h1>
    <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
	<table class="table-query">
		<tbody>
			<tr>
				<th width="100">数据源名称：</th>
				<td >
					<input class="easyui-textbox" type="text" name="datasourcename" id="datasourcename" />
				</td>
				<td style="text-align: right">
					<input type="button" class="btn btn-info" value="查　询" onclick="doQuery()"/>
                    <input type="button" class="btn" value="重　置" onclick="clearAll()"/>
				</td>
			</tr>
           
        </tbody>
	</table>
	</form>
</div>

<div class="content">
	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title"><b>数据源列表</b></h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
    <!-- 查询结果列表 end -->
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
				url: '<%=basePath %>datasource/queryDsList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pageNumber: 1,
				columns:[[
						{field:'datasourcename',title:'数据源名称',width:150},
						{field:'driverclassname',title:'数据源驱动',width:250},
						{field:'username',title:'数据库用户名',width:150},
						{field:'id',title:'操作',width:100,halign:'center',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>" +
    		        		 	"<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"
    		        	}
    		        }
				]]
			});	
		}
		
		
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
		function add()
	 	{
	 		openWinW('<%=basePath %>datasource/gotoDsAdd.xhtml',"多数据源添加添加","1000px","370px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>datasource/gotoEdit.xhtml?id='+id,"数据源信息修改","1000px","370px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除该数据源吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>datasource/gotoDelete.xhtml?ids="+id,
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
	 		openWinW('<%=basePath %>datasource/gotoView.xhtml?id='+id,"数据源信息详细","750px","350px",false,false);
	 	}
	 	
	 	
	 	
	 	function test()
	 	{
	 		
	 		var time;
			$.ajax({
			   	url: "<%=basePath%>dataservice/getCurrentTime.xhtml",
			   	cache:false,
			   	async: false,
			   	success : function(msg) {
							if (msg!=null) {
								time=msg;
								//得到校验位
								var checkBit;
								$.ajax({
					   				url: "<%=basePath%>dataservice/getCheckBit.xhtml?srvid=209c05eb5020497b8b45c5f879d12150&userid=83195b06188a4afe976670e65bc023df&timeStamp="+time,
					   				async: false,
					   				cache:false,
					   				success : function(msg) {
									if (msg!=null) {
										checkBit=msg;
										var da="[{'p1':'1','p2':'1','p3':'1'},{'p1':'2','p2':'2','p3':'2'},{'p1':'3','p2':'3','p3':'3'}]"
									 		
									 		var testdata='srvid=209c05eb5020497b8b45c5f879d12150&userid=83195b06188a4afe976670e65bc023df&checkBit=1&datajson='+da+"&timeStamp="+time;
									 		//alert(testdata);
									 		var data={'srvid':'209c05eb5020497b8b45c5f879d12150','userid':'83195b06188a4afe976670e65bc023df','checkBit':checkBit,'timeStamp':time,'datajson':da};
									 	//	var data=JSON.stringify({'srvid':'209c05eb5020497b8b45c5f879d12150','userid':'83195b06188a4afe976670e65bc023df','checkBit':'1','timeStamp':time,'datajson':da});
									 		//var datafin={data:datatemp};
									 		//alert(data);
									 		 $.ajax({
									 	 	   	url: "<%=basePath%>iservice/i.xhtml",
												type : "POST",
												async: false,
											/* 	contentType:'application/json;charset=UTF-8',  */
												data : data,
												success : function(msg) {
														if(msg!=null){
															//alert("1");
															alert(msg);
														}
														
													}
												});
											} 
										}
									});
						} else {
							time = "111";
						}
					}
				});

	}
</script>
