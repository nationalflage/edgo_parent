<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<h1 class="public-title"><b>添加菜单</b></h1>
<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
	
	<input type="hidden" name="subsys_id" value="<c:out value="${model.subsys_id }"/>"/>
    <input type="hidden" name="menu_code_full" value="<c:out value="${model.menu_code_full }"/>"/>
    <input type="hidden" name="levelId" value="<c:out value="${model.levelId }"/>"/>
    <input type="hidden" name="menu_parent_code" value="<c:out value="${model.menu_parent_code }"/>"/>
	<table  class="table-query">
		<tr>
			<th>菜单编码</th>
			<td>
				<input type="text" value="<c:out value="${model.menu_code }"/>"   name="menu_code" id="menu_code" class="easyui-textbox" required="true" data-options="validType:['number','length[1,20]']"/>
			</td>
			<th>菜单名称</th>
			<td>
				<input type="text" value="<c:out value="${model.menu_name }"/>" name="menu_name" id="menu_name" class="easyui-textbox" required="true" required="true"   data-options="validType:['unnormal','length[1,10]']"/>
			</td>
		</tr>
		<tr>
			<th>菜单描述</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.menu_desc }"/>" style="width:80%;"  name="menu_desc" id="menu_desc" class="easyui-textbox" validType="length[0,200]"/>
			</td>
		</tr>
		<tr>
			<th >功能入口</th>
			<td colspan="3">
				<input type="text" value="<c:out value="${model.func_entra }"/>" style="width:80%;"  name="func_entra" id="func_entra" class="easyui-textbox" required="true" validType="length[0,100]"/>
			</td>
			
		</tr>
		<tr>
			<th>顺序号</th>
			<td>
				<input type="text" value="<c:out value="${model.order_no }"/>" name="order_no" id="order_no" class="easyui-textbox" required="true" data-options="validType:['integer','length[1,5]']"/>
			</td>
			<th>图标名称</th> 
			<td>
				<input type="text" value="<c:out value="${model.iconname }"/>" name="iconname" id="iconname" class="easyui-textbox"  data-options="validType:['integer','length[1,20]']"/>
			</td>
			
		</tr>
		<tr>
			<th>是否有效</th>
			<td>
				<label><input type="radio" name="validity" checked="checked"  value="Y"/> 是</label>
				<label><input type="radio" name="validity"  value="N"/> 否</label>
				
			</td>
			<th></th>
			<td>
				
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
					<div class="buttons">
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                    </div>	
			</td>
		</tr>
	</table>
</form>
</body>
</html>

<script>
	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		
		var flag = true ;
		var menuCode = $("#curselectedMenuCode",parent.document).val();
		var subsysflag = $("#subsysflag",parent.document).val();
		var code = $("#menu_code").val();
		if(subsysflag==1){
			if(code.length!=2){
				$.hyjx.alert("提示信息","一级菜单编码长度必须是2位!","info", function(){
					return false;
	   			});
				return false ;
			}else{
				$.ajax({url:"<%=basePath%>/menu/checkMenuCodeExist.xhtml?menuCode="+code,
					type:"POST",
					dataType:"text",
					async:false,
					success:function(data){
						//alert(data);
					if("exist"==data){
						flag = false ;
						$.hyjx.alert("提示信息","菜单编码已经存在!","info");
					}
					}});
			}
		}else if(code.length-menuCode.length==2){//不是一级菜单
			if(code.indexOf(menuCode)!=0){
				$.hyjx.alert("提示信息","子菜单编码必须参照父菜单","info");
				return  false ;
			}else{
				$.ajax({url:"<%=basePath%>/menu/checkMenuCodeExist.xhtml?menuCode="+code,
						async:false,
					type:"POST",
					dataType:"text",
					success:function(data){
					if("exist"==data){
						$.hyjx.alert("提示信息","菜单编码已经存在","info");
						flag = false ;
					}
					}});
			}
		}else{
			$.hyjx.alert("提示信息","子菜单编码要比父菜单多两位！","info");
			flag = false ;
		}
		
		if(!flag)
			return false;
		
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>menu/doAdd.xhtml",
		   	data: data,
		   	async:false,
		   	success: function(msg){
		    	if("success" == msg){
					$.hyjx.alert("提示信息","信息添加成功！","info", function(){
						refreshCache();
// 						parent.relaod();
						parent.$('#hy-menutree').tree('reload');
						
		   			});
				}else{
					$.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
				}
		   },error:function(msg)
		   {
			   $.hyjx.alert("提示信息","信息添加失败，请重试！","error", function(){});
		   }
		}); 
	} 
	
	function refreshCache()
	   {
		   var url='<%=basePath %>common/doRefreshCache.xhtml';
		   $.ajax({
				type: "POST",
			   	url: url,
			   	success: function(msg){
			   }
			});
	   }
	</script>