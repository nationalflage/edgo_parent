<%@ page language="java" import="com.hyjx.framework.service.SessionManager" pageEncoding="utf-8"%>
<%
String userids= SessionManager.getString("userid");
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

<body style="background-color: #fff">
	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title"><b>已授权服务：</b></h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
    <!-- 查询结果列表 end -->
	
  </body>
</html>

<script type="text/javascript">

 
 $(function(){
	doQuery();
}); 
 
function doQuery(){
		//alert("11");
	var userid='<%=userids %>';
	//alert(userid);
	//	alert('<%=userids %>');
	
		if(userid=='root'){
		//	alert("点击的是父节点");
			document.getElementById('tb').style.display = 'none';//隐藏 
		} 
		//var data_attr = $("#form1").serialize();
		$('#tt').datagrid({
			url: '<%=basePath %>userservice/gotoListAdmit.xhtml',
			queryParams: '',
			rownumbers: true,
			pageNumber: 1,
			columns:[[
					{field:'srvname',title:'服务名称',width:100},
					{field:'srvtype',title:'服务类型',width:100},
					{field:'status',title:'状态',width:100,
						formatter: function (value, rowData, rowIndex) {
			        		var status=rowData.status;
			        		if(status=='0') {
			        			return "无效";
			        		}else if(status=='1'){
			        			return "有效";
			        		}
			        		
			        	}},
				{field:'id',title:'操作列',width:100,halign:'center',
	        	formatter: function (value, rowData, rowIndex) {
	        		 return  "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"','"+rowData.status+"')\" ></span>" +
	        		 "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"
	        	}
	        }
			]]
		});	
	}
	

function add()
	{
	//alert("!!!");
	//openWinCallback(,"","650px","350px",false,false,function aa(){alert(1);});
	
<%-- 	openWinCallback('<%=basePath %>userservice/gotoAdd.xhtml',"选择服务","800px","500px"
			   ,false,false,function setValue(x){alert("1");$('#tt').datagrid("reload");}); --%>
	
	openWinW('<%=basePath %>userservice/gotoAdd.xhtml',"选择服务","800px","500px",false,false);
	}


function edit(id,status)
	{ 
		$.ajax({
			   	url: "<%=basePath %>userservice/changeStatus.xhtml?ids="+id+"&status="+status+"&timestam="+new Date(),
			   	async:false,
			   	success: function(msg){
			   		if("success" == msg) {
			   			$('#tt').datagrid("reload");
			   			$.hyjx.alert("提示","修改status成功！","info", function(){ });
			   		}else {
			   			$.hyjx.alert("提示","修改status失败，请重试！","info", function(){ });
			   		}
			   	}
			});
	}

	
	
function del(id)
	{
		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
		if(result == true){
			$.ajax({
			   	url: "<%=basePath %>userservice/gotoDeleteAdmit.xhtml?ids="+id,
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
	</script>
