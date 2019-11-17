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
			<th width="100">用户名：</th>
			<td>
				<input class="easyui-textbox" type="text" name="userid" id="userid" />
			</td>
			<th  width="100">服务名：</th>
			<td >
				<input class="easyui-textbox" type="text" name="srvid" id="srvid" />
			</td>
			</tr>
			<tr>
			<th width="100">访问时间：</th>
			<td >
				 <input class="easyui-datebox" id="time_start" name="time_start" type="text" style="width: 120px;" editable="false">
            	<font size="-1">至</font>
            	<input class="easyui-datebox" id="time_end" name="time_end" type="text" style="width: 120px;" editable="false">
			</td>
			<th width="10%">调用结果：</th>
			<td width="30%">
				<input class="easyui-textbox" type="text" name="result" id="result" />
			</td>
			</tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <input type="button" class="btn btn-info" value="查　询" onclick="doQuery();"/>
                    <input type="button" class="btn" value="重　置" onclick="clearAll();"/>
                </td>
            </tr>
        </tbody>
	</table>
	</form>
</div>
<div class="content">
	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title"><b>结果列表</b></h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
        	
            <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a> -->
           <!--  <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="test()">测试插入数据</a> -->
       	
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
		$("#userid").combobox({
			url:'<%=basePath %>interfacelog/queryuserList.xhtml',
			editable:false,
			valueField:'userid',
		    textField:'username',
		    panelHeight:'auto'
		}); 
		$("#srvid").combobox({
			url:'<%=basePath %>interfacelog/querysrvList.xhtml',
			editable:false,
			valueField:'srvid',
		    textField:'srvname',
		    panelHeight:'auto'
		});
		$("#result").combobox({
			url:'<%=basePath %>interfacelog/queryresultList.xhtml',
			editable:false,
			valueField:'code',
		    textField:'name',
		    panelHeight:'auto'
		});  
			doQuery();
		});
		
		function doQuery(){
			var time_start=$("#time_start").datebox('getText');
			var time_end=$("#time_end").datebox('getText');
			if(time_end<time_start){
				$.hyjx.alert("提示信息","访问时间截止日期必须大于开始日期！","info", function(){
	   			});
			}
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>interfacelog/queryList_Log.xhtml',
				queryParams: data_attr,
				rownumbers: true,
				pagination: true,
				pageNumber: 1,
				columns:[[
						{field:'username',title:'用户名',width:'10%'},
						{field:'srvname',title:'服务名',width:'10%'},
						{field:'ip',title:'访问ip',width:'15%'},
						{field:'time_t',title:'访问时间',width:'14%'},
						{field:'srv_parameter',title:'参数',width:'20%'},
						{field:'amount',title:'返回结果数量',width:'10%'},
						{field:'result',title:'调用结果',width:'10%'},
						{field:'error_msg',title:'错误信息',width:'8%'}
				]]
			});	
		}
	 	function clearAll(){ //清空操作
 		$('#form1').form('clear');
 		doQuery();
 	}
	 
</script>
