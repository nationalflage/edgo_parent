<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.hyjx.framework.component.mutidatasource.datasources.DataSourcesModel" %>
<%
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
	<form id="form1" class="query-list" method="post" action="">
		<input type="hidden" value="<c:out value="${model.srvid }"/>" id="srvid" name="srvid">
		<table class="table-query">
			<tr>
				<th style="width: 10%">服务名称</th>
				<td style="width: 38%"><input data-options="required:true" type="text" value="<c:out value="${model.srvname }"/>" id="srvname"
					name="srvname" size="40" class="easyui-textbox"
					validType="length[0,60]" /></td>
				<th style="width: 10%">服务类型</th>
				<td style="width: 38%"><input data-options="required:true" type="text" value="<c:out value="${model.srvtype }"/>" id="srvtype"
					name="srvtype" size="40" class="easyui-textbox"
					validType="length[0,10]" /></td>
			</tr>
			<tr>
				<th>查询SQL</th>
				<td colspan="3"><input id="querysql" name="querysql" data-options="required:true,multiline:true"
					value="<c:out value="${model.querysql }"/>" class="easyui-textbox"
					 style="width: 600px; height: 90px;" />
					 <br>
					 查询SQL示例：select * from demo_dept_info where 1=1 ## and  deptcode like '#deptcode#%'  @ and endflag = '#endflag#' ##(多个参数用(## 多个参数 ##)包装,参数之间用@ 隔开  )
				</td>

			</tr>
			<tr>
				<th>接口说明</th>

				<td colspan="3"><input value="<c:out value="${model.interfacedesc }"/>" 
					id="interfacedesc" name="interfacedesc" class="easyui-textbox"
					data-options="multiline:true" style="width: 600px; height: 90px;"validType="length[0,500]" />
				</td>

				
			</tr>

			<tr>
				<th>简介</th>
				<td colspan="3"><input value="<c:out value="${model.brief }"/>" id="brief"
					name="brief" class="easyui-textbox" data-options="multiline:true"
					style="width: 600px; height: 50px;" validType="length[0,100]" /></td>
				
			</tr>
			<tr>
				<th >是否有效</th>
				<td >
				<input type="radio" name="validity" <c:if test="${model.validity  eq '1'}">checked="checked"</c:if> value="1"/> 是
				<input type="radio" name="validity" <c:if test="${model.validity  eq '0'}">checked="checked"</c:if> value="0"/> 否
			</td>
			</tr>
			
			
			<tr>
			<th >关联数据源</th>
				<td >
					<select name="datasource" id="dslist" onchange="select1()" >
       				<option value="请选择" selected="selected">请选择</option>
 					<% for(int i=0;i<list.size();i++){
 						DataSourcesModel temp=(DataSourcesModel)list.get(i);
 					%>
  					<option id="<%=temp.getId() %>" value="<%=temp.getDatasourcename()%>">
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
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					plain="true" onclick="add()">添加</a>
			</div>
			<table class="table-query" id="reslist">

			</table>
		</div>

		</table>
	</form>

	<table class="table-query">
		<tr>
		<tfoot >
			<tr >
				<td  colspan="4"><input type="button" class="btn btn-info"
					value="保　存" onclick="save1();" /> <input type="button" class="btn"
					value="关　闭" onclick="window.parent.closeWin('信息修改')" /></td>
			</tr>
		</tfoot>
		
		</tr>
	</table>

<br>
<br>
<br>
</div>
</body>
</html>

<script type="text/javascript">

function confirmds(){
	var i;
	var optionValue='<c:out value="${model.datasource }"/>';
	var all_options = document.getElementById("dslist").options;
	for ( i=0; i<all_options.length; i++){
		if(all_options[i].value == optionValue){
			all_options[i].selected = true;
			break;
		}
	} 
}

function editCondition(){
	var temp=$("#srvid").val()
	
	openWinW('<%=basePath%>dataservice/gotoParameterConditiontemp.xhtml?srvid='+temp,"编辑参数条件","750px","400px",false,false);
}


	function doQuery() {
		var temp = $("#srvid").val()
		$('#reslist')
				.datagrid(
						{
							url : '<%=basePath%>dataservice/queryListForCondition.xhtml?srvid='+ temp,
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
										width : 100,
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
		
		doQuery();
		confirmds();
});
	
	function edit(id)
 	{
		
 		 
 		openWinW2('<%=basePath %>dataservice/gotoEditParameterConditiontemp.xhtml?id='+id,"参数信息修改","750px","400px"
	 			   ,false,false,function setValue(x){$('#reslist').datagrid("reload");});
 		
 	}
 	function del(id)
 	{
 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
			if(result == true){
				$.ajax({
				   	url: "<%=basePath %>dataservice/gotoDeleteCondition.xhtml?ids="+id,
				   	cache:false,
				   	success: function(msg){
				   		if("success" == msg) {
				   			$('#reslist').datagrid("reload");
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
 	openWinW('<%=basePath %>dataservice/gotoViewParameterConditiontemp.xhtml?id='+id,"信息详细","650px","350px",false,false);
 	}
	
 	function add()
 	{
 		var temp = $("#srvid").val();
 		openWinW2('<%=basePath %>dataservice/gotoAddParameterConditiontemp.xhtml?srvid='+temp,"参数条件添加","900px","400px",false,false);
 	}
	
	
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doEdit.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息修改');
		   			});
				}else{
					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
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
			    		   	url: "<%=basePath %>dataservice/doEdit.xhtml",
			    		   	data: data,
			    		   	cache:false,
			    		   	success: function(msg){
			    		    	if("success" == msg){
			    					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
			    		   				parent.rightFrame.$('#tt').datagrid("reload");
			    		   				window.parent.closeWin('信息修改');
			    		   			});
			    				}else{
			    					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
			    				}
			    		   }
			    		}); 
					}else if("samename" == msg){
						$.hyjx.alert("提示信息","服务名称重复","error", function(){});
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
    		   	url: "<%=basePath %>dataservice/doEdit.xhtml",
    		   	data: data,
    		   	cache:false,
    		   	success: function(msg){
    		    	if("success" == msg){
    					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
    		   				parent.rightFrame.$('#tt').datagrid("reload");
    		   				window.parent.closeWin('信息修改');
    		   			});
    				}else{
    					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
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
    		   	url: "<%=basePath %>dataservice/doEdit.xhtml",
    		   	data: data,
    		   	cache:false,
    		   	success: function(msg){
    		    	if("success" == msg){
    					$.hyjx.alert("提示信息","信息修改成功！","info", function(){
    		   				parent.rightFrame.$('#tt').datagrid("reload");
    		   				window.parent.closeWin('信息修改');
    		   			});
    				}else{
    					$.hyjx.alert("提示信息","信息修改失败，请重试！","error", function(){});
    				}
    		   }
    		});
			
		}
		
		
		
	} 
	
	
	</script>