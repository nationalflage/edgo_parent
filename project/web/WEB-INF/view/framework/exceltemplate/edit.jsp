<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <title>新增</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
</head>
<body>
	<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
			<input type="hidden" id="pub_excel_template_id" name="pub_excel_template_id" value="<c:out value="${et.pub_excel_template_id}"/>" />
			<table  class="table-list" >
				<tr>
				<th width="10%">模块英文名</th><td width="30%"><input value="<c:out value="${et.module_en_name}"/>" class="easyui-textbox" type="text" validType="length[0,50]" required="true" name="module_en_name"/> </td>
				<th width="15%">模块中文名</th><td><input value="<c:out value="${et.module_ch_name}"/>" class="easyui-textbox" type="text" required="true" validType="length[0,50]" name="module_ch_name"/></td>
				</tr>
			
				<tr>
				<th width="15%">直接入库</th><td>
				<input type="radio" name="is_direct_import" <c:if test="${et.is_direct_import  eq 'Y'}">checked="checked"</c:if> value="Y" onclick="isAbleForImport(this.value);"/> 是
				<input type="radio" name="is_direct_import" <c:if test="${et.is_direct_import  eq 'N'}">checked="checked"</c:if> value="N" onclick="isAbleForImport(this.value);"/> 否
				
				</td>
				<th width="15%"><div id="divsql_id_name">sql_id</div></th>
				<td>
					 <div id="divsql_id_value"><input class="easyui-textbox" value="<c:out value="${et.sql_id}"/>"   validType="length[0,50]"  class="easyui-textbox" type="text"  name="sql_id" id="sql_id"/></div>
				</td>
				
				</tr>
					<tr>
				<th width="15%" colspan="1">model类名</th><td colspan="3"><input id="class_name" name="class_name" value="<c:out value="${et.class_name}"/>"  validType="length[0,100]" class="easyui-textbox" type="text" />
				(如:com.hyjx.framework.uc.user.UserModel)
				</td>
				</tr>
				<tr>
				<th width="15%"><div class="tableName">表的名字</div></th><td ><div class="tableName"><input name="table_name" value="<c:out value="${et.table_name}" />"  validType="length[0,100]" id="table_name" class="easyui-textbox" type="text" /></div> </td>
				<th></th><td></td>
				</tr>
			</table>
			<center>
                        <input type="button" class="btn btn-info" onclick="save();" value="保 存">
                        <button class="btn"  onclick="window.parent.closeWin('修改excel模板');">关 闭</button>
				</center>
			</form>
			
			
</body>
</html>
<script type="text/javascript">

 $(function(){
 $("#class_name").textbox({width:400});
    if($("input:radio[name='is_direct_import']:checked").val()=="N"){
    	$(".tableName").css("display","none");
    	$("#divsql_id_name").css("display","none");
    	$("#divsql_id_value").css("display","none");
    }
  });
    function isAbleForImport(flag){
    if("Y"==flag){
     /* $("#table_name").textbox({disabled:false});
     $("#sql_id").textbox({disabled:false});
     $("#class_name").textbox({disabled:false}); */
     $(".tableName").css("display","block");
    $("#divsql_id_name").css("display","block");
 	$("#divsql_id_value").css("display","block");
    }
     else if("N"==flag){
   /*   $("#table_name").textbox({disabled:true});
     $("#sql_id").textbox({disabled:true});
     $("#class_name").textbox({disabled:true}); */
     $(".tableName").css("display","none");
 	$("#divsql_id_name").css("display","none");
 	$("#divsql_id_value").css("display","none");
     }
    }


	function closewin()
	{
		window.parent.closeWin('修改excel模板');
	}
	function save()
	{
		if(!$("#form1").form('validate')){  
			return;
		}
		var class_name = $("#class_name").textbox("getValue");
		var table_name = $("#table_name").textbox("getValue");
		var sql_id = $("#sql_id").textbox("getValue");
		//alert(class_name+":"+table_name+":"+sql_id);
		var is_direct_import = $("input[name='is_direct_import']:checked").val();
		//alert(class_name+":"+table_name+":"+sql_id);
		if(is_direct_import=="Y"){
		if(class_name==""&&table_name==""){
		   $.hyjx.alert('信息','类名和表名不能同时为空','info',function(){});
		   return ;
		}
		if(table_name==""&&!(class_name!=""&&sql_id!="")){
		     $.hyjx.alert('信息','表名为空，则model类名和sql_id不能为空','info',function(){});
		     return ;
		   }
		}
	/* 	var module_en_name = $("#module_en_name").textbox("getValue");
		alert(document.getElementById("pub_excel_template_id").value);
		//$('input:hidden #cId'+id)
		//alert($("input:hidden #pub_excel_template_id"));
		var pub_excel_template_id =$("input:hidden #pub_excel_template_id").val(); */
	     $.ajax({
			url:"<%=basePath%>excelTemplate/isExistEdit.xhtml?",
			type:"post",
			data:$("#form1").serialize(),
			async:false,
			success:function(msg)
			{
				if(msg=="Y"){
		         $.hyjx.alert('信息','英文模块名字已经存在，请修改','info',function(){
		         return  ;
		         });
		        }else{
		    $.ajax({
			url:"<%=basePath%>excelTemplate/doEdit.xhtml",
			data:$("#form1").serialize(),
			type:"post",
			async:true,
			success:function(msg)
			{
				if(msg=="success"){
					$.hyjx.alert('信息','修改成功','info',function(){
						parent.rightFrame.$('#tt').datagrid("reload");
						window.parent.closeWin('修改excel模板');
					});
				}else
				{
					$.hyjx.alert('错误',msg);
				}
			},
			error:function(msg)
			{
				$.hyjx.alert('错误','出错啦');
			}
		});
		        
		        }
			},
			error:function(msg)
			{
				return false;
			}
		});
	}
</script>