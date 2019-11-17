<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>添加</title>
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script type="text/javascript">
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>codetablemanager/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
		   				parent.rightFrame.$('#tt').datagrid("reload");
		   				window.parent.closeWin('信息添加');
		   			});
				}else if("repeat" == msg){
					$.hyjx.alert("提示信息","信息添加重复，请重试！","error", function(){});
				}else{
					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   },
		   error:function(msg)
		   {
			   alert("添加失败，请检查表单项是否正确");
		   }
		}); 
	} 
	</script>
</head>
<body>
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true"  s>
	<table  class="table-query">
	<tbody>
			<tr>
			<th>码表</th>
			<td>
				<input type="text"   name="codetable" id="codetable" class="easyui-textbox" data-options="required:true,validType:['alphanum','length[1,20]']"/>
			</td>
			<th>名称</th>
			<td>
				<input type="text" value="<c:out value="${model.remark }"/>" name="remark" id="remark" class="easyui-textbox" required="true" validType="length[0,20]"/>
			</td>
		
		</tr>
		<tr>
		<th>类型</th>
		<td>
		<input type="radio" id="r3" name="codelevel" value="2" checked="checked">
			<label for="r3">用户级</label>
			<input type="radio" id="r4" name="codelevel" value="1">	
			<label for="r4">系统级</label>
			
		</td>
		
<!-- 		<th style="display:none;">是否有效</th> -->
<!-- 		<td style="display:none;"> -->
<!-- 			<input type="radio" id="r1" name="validflag" value="1" checked="checked"> -->
<!-- 			<label for="r1">是</label> -->
<!-- 			<input type="radio" id="r2" name="validflag" value="0">	 -->
<!-- 			<label for="r2">否</label> -->
<!-- 			</td> -->
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4" >
					
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="window.parent.closeWin('信息添加')">关 闭</button>
                    
			</td>
		</tr>
		</tfoot>
	</table>
	<input type="hidden" name="validflag" value="1">
</form>
</body>
</html>
<script>
	$(document).ready(function(){
// 		$.extend($.fn.validatebox.defaults.rules, {
// 			checkcodetable: {
// 		        validator: function (value, param) {
// 		        	var flag =false;
// 					$.ajax({
<%-- 						url:"<%=basePath%>codetablemanager/checkcodetable.xhtml", --%>
// 						data:"codetable="+$("#codetable").val(),
// 						async:false,
// 						success:function(rep)
// 						{
// 							flag = (rep==0);
// 						}
// 					});
// 					//alert(flag);
// 					return flag;
// 		        },
// 		        message: '不能插入重复的代码表'
// 		    }
// 		});
		
		$("input",$("#codetable").next("span")).blur(function(){

		});
	});
	
</script>