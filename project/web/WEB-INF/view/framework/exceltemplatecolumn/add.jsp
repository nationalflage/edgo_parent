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
</head>
<body style="background-color: #fff">
	<form id="form1" class="query-list"  method="post" action="" data-options="novalidate:true" >
			<table  class="table-query" >
				<tr>
				    <input type="hidden" name="pub_excel_template_id" value="<%=request.getParameter("pub_excel_template_id")==null?"":request.getParameter("pub_excel_template_id")%>" >
				<th width="10%">中文字段名字</th><td width="20%"><input class="easyui-textbox" validType="length[0,50]" type="text" required="true" name="ch_column_name"/> </td>
				<th width="15%">英文字段名字</th><td width="30%">
				<input class="easyui-textbox" type="text" required="true" validType="length[0,50]" name="en_column_name"/></td>
				</tr>
				<tr>
				<th width="15%">是否必填</th><td >
				<input type="radio" name="is_null"  class="easyui-radiobox" checked="checked" value="Y"/> 是
				<input type="radio" name="is_null"  value="N"/> 否
				</td>
				<th width="15%">字段顺序</th>
				<td>
					<input class="easyui-textbox" type="text" required="true"  name="excel_field_no"  data-options="validType:['number','length[1,3]']" />
				</td>
				
				</tr>
				<tr>
				<th width="15%">最大长度</th><td><input name="max_length"     class="easyui-textbox" type="text" data-options="validType:['number','length[1,100]']"  required="true"/></td>
				<th width="15%">数据类型</th>
				<td>
				<select  class="easyui-combobox" name="data_type">
				<option value="String">字符串</option>
				<option value="Date">日期</option>
				<option value="Number">数字</option>
				</select>
				 </td>
				</tr>
				<tr>
				<th width="15%">日期格式</th><td >
					<input type="text" validType="length[0,20]" name="date_formate"  class="easyui-textbox"  /><br/>如:YYYY-MM-DD
				</td>
				<th>是否主键</th>
				<td>
				<input type="radio" name="is_primary_key"  class="easyui-radiobox" checked="checked" value="Y"/> 是
				<input type="radio" name="is_primary_key"  value="N"/> 否
				</td>
				</tr>
			</table>

			<center>
                        <input type="button" class="btn btn-info" onclick="save();" value="保存">
                        <input type="button" class="btn"  onclick="window.parent.closeWin('新增模板列');" value="关 闭">
            </center>
			</form>
			
			
</body>
</html>
<script type="text/javascript">
	function save()
	{
		if(!$("#form1").form('validate')){  
			return;
		}
		
		$.ajax({
			url:"<%=basePath%>exceltemplatecolumn/doAdd.xhtml",
			data:$("#form1").serialize(),
			type:"post",
			async:false,
			success:function(msg)
			{
				if(msg=="success"){
					$.hyjx.alert('信息','保存成功','info',function(){
					  	parent.rightFrame.$('#tt').datagrid("reload");
						window.parent.closeWin('新增模板列');
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
</script>