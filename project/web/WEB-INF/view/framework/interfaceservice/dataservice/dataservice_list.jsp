<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
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
	<h1 class="public-title"><b>服务查询</b></h1>
    <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
	<table class="table-query">
		<tbody>
			<tr>
				<th >服务名称：</th>
				<td>
					<input class="easyui-textbox" type="text" name="srvname" id="srvname" />
				</td>
				<th >服务类型：</th>
				<td >
					<input type="text"  id="srvtype" name="srvtype" size="40" class="easyui-textbox" />
				</td>
			</tr>
            
        </tbody>
        <tfoot>
        	<tr>
                <td colspan="6">
                    <input type="button" class="btn btn-info" value="查　询" onclick="doQuery()"/>
                    <input type="button" class="btn" value="重　置" onclick="clearAll()"/>
                </td>
            </tr>
        </tfoot>
	</table>
	</form>
	</div>
	
	<div class="content">
	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title"><b>服务列表</b></h1>
		<p style="text-align:right;position:absolute;top:5px;right:150px;">数据用户名：<input class="easyui-textbox" type="text"  id="t" style="margin:0;height:25px;line-height:25px;"/></p>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'" onclick="request2()">模拟请求</a>
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
		
		$(document).ready(function(){
			$.ajax({
				url:'<%=basePath%>selectServlet?codetable=interface_srv_type',
				datatype:"json",
				success:function(res)
				{
					$("#srvtype").combobox({
						editable:false,
						valueField:'code',
					    textField:'name' ,
					    panelHeight:'auto',
					    data:JSON.parse(res).result
					});
				},
				error:function(res)
				{
					//$.hyjx.alert("提示信息",res.responseText,"info", function(){});
				}
			});
		});
		
		
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>dataservice/queryList.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'srvname',title:'服务名称',width:100},
						{field:'srvtype',title:'服务类型',width:100},
						{field:'validity',title:'是否有效',width:100,formatter:function(value,rowData,rowIndex){
							if(value=='0') return '无效';
							else return '有效';
						}},
						{field:'querysql',title:'查询SQL',width:100},
						{field:'brief',title:'简介',width:100},
						{field:'interfacedesc',title:'接口说明',width:150},
					{field:'srvid',title:'操作',width:100,halign:'center',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"','"+rowData.srvtype+"')\" ></span>"+
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
	 		openWinW('<%=basePath %>dataservice/gotoAdd.xhtml',"信息添加","1000px","550px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>dataservice/gotoEdit.xhtml?id='+id,"信息修改","1000px","600px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>dataservice/gotoDelete.xhtml?ids="+id,
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			$('#tt').datagrid("reload");
    				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
    				   		}else if("fail"){
    				   			$.hyjx.alert("提示","该服务已被使用,不允许删除！","info", function(){ });
    				   		}else if("failure"){
    				   			$.hyjx.alert("提示","删除失败！","info", function(){ });
    				   		}else if("nothing"){
    				   			$.hyjx.alert("提示","删除失败！","info", function(){ });
    				   		}
    				   	}
    				}); 
    			}
	 		});
	 	}
	 	function view(id,srvtype)
	 	{
	 		
	 		//alert(srvtype);
	 		
			if(srvtype=="查询服务"){
				openWinW('<%=basePath %>dataservice/doViewServiceTemp.xhtml?id='+id,"信息详细","650px","350px",false,false);
	 		}
	 		
	 	}
	 	
	 	
	 	function request1()
	 	{
	 		
	 		 
	 		<%Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String currenttime = format.format(date);%>
			
			var time=<%=currenttime%>;
		   var	urltemp= "<%=basePath %>iservice/g.xhtml?srvid=6e39944c16f545a6a1260eafff8d9f4a&userid=83195b06188a4afe976670e65bc023df&checkBit=44fc987a264ddf6d8dd9a33a901bc2eb&pageNo=1&pageSize=4&p1=111&p2=02&desc=1&timeStamp="+time;
		//	alert(urltemp);
		   	window.open(urltemp);   
	 		<%-- $.ajax({
			   	url: "<%=basePath %>iservice/g.xhtml?srvid=6e39944c16f545a6a1260eafff8d9f4a&userid=83195b06188a4afe976670e65bc023df&checkBit=44fc987a264ddf6d8dd9a33a901bc2eb&pageNo=1&pageSize=4&p1=111&p2=02&desc=1&timeStamp="+time,
			   	success: function(msg){
			   		var msgtemp=JSON.stringify(msg);
			   		alert(msgtemp);
			   	}
			});  --%>
	 	}
	 	
	 	function request2()
	 	{
	 		var temp=$("#t").val();
	 		//alert(temp);
	 		var	urltemp=null;
	 		if(temp==""){
	 			//alert("1");
	 			urltemp= "<%=basePath %>userservice/doUserServiceList.xhtml?userlogname=liuzq";
	 		}else{
	 			//alert("2");
	 			urltemp= "<%=basePath %>userservice/doUserServiceList.xhtml?userlogname="+temp;
	 		}
			
			window.open(urltemp); 
	 	}
	</script>
