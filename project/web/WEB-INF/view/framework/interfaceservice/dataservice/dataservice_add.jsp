<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.hyjx.framework.component.mutidatasource.datasources.DataSourcesModel" %>
<%
//	String t=(String)request.getAttribute("srvid");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	List list=(ArrayList)request.getAttribute("list");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
<div class="content" style="margin: 0">
<form id="form1"  method="post" action="">
	<input type="hidden" id="conditionConfigNum" value="0"/>
	<table  class="table-query">
			<tr style="width: 10%">
			<th >服务名称</th>
			<td style="width: 38%">
				<input type="text" value="<c:out value="${model.srvname }"/>" data-options="required:true" id="srvname" name="srvname" size="40" class="easyui-textbox" validType="length[0,60]"/>
			</td>
			<th style="width: 10%">服务类型</th>
			<td style="width: 38%">
				<input type="text" value="<c:out value="${model.srvtype }"/>" data-options="required:true" id="srvtype" name="srvtype" size="40" class="easyui-textbox" validType="length[0,10]"/>
			</td>
		</tr>
		<tr>
			<th>查询SQL</th>
			<td colspan="3">
                <input id="querysql"  name="querysql" value="<c:out value="${model.querysql }"/>" class="easyui-textbox"  data-options="multiline:true,required:true"  
                	style="width:600px;height:90px;" />
                	<br>
                	 查询SQL示例：select * from demo_dept_info where 1=1 ## and  deptcode like '#deptcode#%'  @ and endflag = '#endflag#' ##(多个参数用(## 多个参数 ##)包装,参数之间用@ 隔开  )
            </td>
		</tr>
		<tr>
			<th>接口说明</th>
			<td colspan="3">
                <input  value="<c:out value="${model.interfacedesc }"/>" id="interfacedesc" name="interfacedesc" class="easyui-textbox"  data-options="multiline:true" 
                	style="width:600px;height:90px;" validType="length[0,500]"/>
            </td>
		</tr>
		<tr>
		<th>简介</th>
			<td colspan="3">
                <input value="<c:out value="${model.brief }"/>" id="brief" name="brief" class="easyui-textbox"  data-options="multiline:true" validType="length[0,100]" style="width:600px;height:50px;"/>
            </td>
		</tr>
		<tr>
		<th >是否有效</th>
				<td >
				<input type="radio" name="validity" id="type1" value="1" checked="true" /> 是
				<input type="radio" name="validity" id="type0" value="0"/> 否</td>
		</tr>
		<tr>
		<th >关联数据源</th>
				<td >
					<select name="datasource" id="dslist"  >
       				<option value="请选择" selected="selected">请选择</option>
 					<% for(int i=0;i<list.size();i++){
 						DataSourcesModel temp=(DataSourcesModel)list.get(i);
 					%>
  					<option value="<%=temp.getDatasourcename()%>">
  					<%=temp.getDatasourcename()%>
 					</option>
  				 <%  }   %>
       </select>
				</td>
		</tr>
	</table>
	
	<div class="result-list">
	        <h1 class="title">参数条件列表</h1>
	        <!-- 操作按钮 -->
	        <div id="tb" class="operate">
	            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
	        </div>
	        <table id="tt" class="easyui-datagrid"  >
	        </table>
	</div>
	<table  class="table-query">
			
		<tfoot>
		<tr>
			<td colspan="4">
			
			<input type="button" class="btn btn-info" value="保　存" onclick="save1();" /> 
			<input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息添加')" />
							
			
            </td>
			
		</tr>
		</tfoot>
		
	</table>
</form>
</div>
</body>
</html>

<script type="text/javascript">


	$(function() {
		doQuery();
	});
	
	
	function edit(id)
 	{
 		 
 		openWinW2('<%=basePath %>dataservice/gotoEditParameterConditionSession.xhtml?id='+id,"参数信息修改","750px","350px"
	 			   ,false,false,function setValue(x){$('#tt').datagrid("reload");});
 	}
	
	function del(id)
 	{
 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
			if(result == true){
				$.ajax({
				   	url: "<%=basePath %>dataservice/delSessionCondition.xhtml?ids="+id,
				   	cache:false,
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
	
	function add()
 	{
		openWinW2('<%=basePath %>dataservice/gotoAddParameterConditiontemp.xhtml?',"参数条件添加","900px","400px",false,false);
 		}

	function doQuery() {
		$('#tt')
				.datagrid(
						{
							url : '<%=basePath %>dataservice/showSessionCondition.xhtml',
							fitColumns : false,
							singleSelect : true,
							rownumbers : true,
							pagination : true,
							pageNumber : 1,
							columns : [ [
									{
										field : 'parameter',
										title : '参数名称',
										width : 100
									},
									{
										field : 'field_content',
										title : '字段内容',
										width : 100
									},
									{
										field : 'type',
										title : '参数类型',
										width : 100,
										formatter:function(value,rowData,rowIndex){
											if(value=='1') return '字符串';
											else return '整型';
										}
									},
									{
										field : 'required',
										title : '参数是否必要',
										width :100,
										formatter:function(value,rowData,rowIndex){
											if(value=='1') return '是';
											else return '否';
										}
									},
									{
										field : 'parameter_means',
										title : '参数含义',
										width : 100
									},
									{
										field : 'id',
										title : '操作',
										width : 100,
										halign : 'center',
										formatter : function(value, rowData,
												rowIndex) {
											return "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"
													+ value
													+ "')\" ></span>"
													+ "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"
													+ value
													+ "')\" ></span>"
													+ "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"
													+ value + "')\" ></span>"
										}
									} ] ]
						});
	}

	function deltr(tr) {
		$(tr).parent().parent().remove();
	}

	function addCondition() {

		//	alert("1");
		var num = $('#conditionConfigNum').val();
		var numtemp = parseInt($('#conditionConfigNum').val(), 10) + 1;
		$('#conditionConfigNum').val(numtemp);

		var tr = $("#temptr").clone();

		tr.attr('style', 'display:"";');
		tr.attr('id', 'temptr' + numtemp);

		tr.html(tr.html().replace(/\[\d+\]/g, '[' + numtemp + ']'));


		tr.appendTo("#tt1");
		
	}

	$(document).ready(function() {
		$.ajax({
			url : '<%=basePath%>selectServlet?codetable=interface_srv_type',
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
			
		}
	});
});
	
	

	function save(){
		
		if(!$("#form1").form('validate')){
			return;
		}
		
		
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				
		   				window.parent.closeWin('信息添加');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   }
		}); 
	} 
	
	
function save1(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		var sql=$("#querysql").val();
		var srvtype=$("#srvtype").combobox("getValue");
		//alert(srvtype);
		debugger;
		if(srvtype=='01'){
			//substr判断
			var firsql=sql.substr(0,7).toUpperCase( );
			if(firsql!="SELECT "){
				alert("sql语句不是select开始");
			    return;
			}
			//数据源不能 为空
			var datasource=$("#dslist").val()
			if(datasource=="请选择"){
			alert("请选择关联数据源");
			return;	
			}	
			$.ajax({
				type: "POST",
			   	url: "<%=basePath %>dataservice/sqlConfirm.xhtml",
			   	data: data,
			   	cache:false,
			   	success: function(msg){
			    	if("success" == msg){
			    		$.ajax({
			    			type: "POST",
			    		   	url: "<%=basePath %>dataservice/doAdd.xhtml",
			    		   	data: data,
			    		   	cache:false,
			    		   	success: function(msg){
			    		    	if("success" == msg){
			    		    		//alert("11");
			    					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
			    		   				parent.rightFrame.$('#tt').datagrid("reload");
			    		   				window.parent.closeWin('信息添加');
			    		   			});
			    				}else{
			    					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
			    				}
			    		   }
			    		}); 
					}else if("samename" == msg){
						$.hyjx.alert("提示信息","服务名称重复！","error", function(){});
					}else{
						$.hyjx.alert("提示信息","sql出错！","error", function(){});

					}
			   }
			}); 
		}else if(srvtype=='02'){
			//substr判断
			var firsql=sql.substr(0,7).toUpperCase( );
			if(firsql!="UPDATE "){
				alert("sql语句不是update开始");
			    return;
			}
			 $.ajax({
	    			type: "POST",
	    		   	url: "<%=basePath %>dataservice/doAdd.xhtml",
	    		   	data: data,
	    		   	cache:false,
	    		   	success: function(msg){
	    		    	if("success" == msg){
	    					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
	    		   				parent.rightFrame.$('#tt').datagrid("reload");
	    		   				window.parent.closeWin('信息添加');
	    		   			});
	    				}else{
	    					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
	    				}
	    		   }
	    		}); 
			
		}else{
			var firsql=sql.substr(0,7).toUpperCase( );
			if(firsql!="INSERT "){
				alert("sql语句不是insert开始");
			    return;
			}
			
			$.ajax({
    			type: "POST",
    		   	url: "<%=basePath %>dataservice/doAdd.xhtml",
    		   	data: data,
    		   	cache:false,
    		   	success: function(msg){
    		    	if("success" == msg){
    					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
    		   				parent.rightFrame.$('#tt').datagrid("reload");
    		   				window.parent.closeWin('信息添加');
    		   			});
    				}else{
    					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
    				}
    		   }
    		});
		}
		
		
		
		
	} 
	
	
	
	
	</script>