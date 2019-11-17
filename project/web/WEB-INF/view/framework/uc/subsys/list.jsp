<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>查询条件和查询结果列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <script type="text/javascript">
        function add()
        {
        	openWinW('<%=basePath%>subsys/gotoAdd.xhtml', '新增子系统', '800px', '380px', false, false);
        }
        function edit(id)
        {
        	if(id=="console"){
        		$.hyjx.alert('信息','系统框架子系统不允许编辑');
        		return false;
        	}
        	
        		openWinW('<%=basePath%>subsys/gotoEdit.xhtml?id='+id, '修改子系统', '800px', '380px', false, false);
	        
        }
        function view(v)
        {
        	openWinW('<%=basePath%>subsys/gotoView.xhtml?id='+v, '查看详细', '600px', '300px', true, false);
        }
        function query()
        {
            if(!$("#form1").form('validate')){
                return;
            }
         	var data = $("#form1").serialize(); 
        	$('#tt').datagrid({
        		    url:'<%=basePath %>subsys/doList.xhtml',
        		    queryParams:data,
    				rownumbers: true,
    				
    				pageNumber: 1,
        		    columns:[[
        		        {field:'subsys_code',title:'系统编码',width:100,halign:'center'},
        		        {field:'subsys_name',title:'系统名称',width:200,halign:'center'},
        		        {field:'subsys_desc',title:'系统描述',width:200,halign:'center'},
        		        {field:'order_no',title:'排序号',width:100,align:'center'},
        		        {field:'validity',title:'是否有效',width:100,halign:'center',align:'center',formatter:function(value,a,b){
        		        	if(value=='Y')return '是';
        		        	else return '否';
        		        }},
        		        {field:'subsys_id',title:'操作',width:140,align:'center',halign:'center',
        		        	formatter: function (value, rowData, rowIndex) {
        		        		 return "<span title=查看 class=btn-view onclick=view('"+value+"')></span>"+
         		        		"<span title=编辑  class=btn-edit onclick=edit('"+value+"')></span>"+
         		        		"<span title=删除  class=btn-delete onclick=del('"+value+"')></span>";
        		        	}	
        		        }
        		    ]]
        		});	
        }

        $(document).ready(function(){
			query();
        });
        
        function del(id){
        	if(id=="console"){
        		$.hyjx.alert('信息','系统框架子系统不允许删除');
        		return false;
        	}
        	$.hyjx.confirm("提示信息","确定要删除选择的子系统吗？",function(result){
    			if(result == true){
   			 
   				var url = '<%=basePath%>subsys/doDelete.xhtml?ids='+id;
   				$.ajax({
   					url:url,
   					type:"post",
   					async:false,
   					success:function(msg)
   					{  if(msg=="success"){
   						$('#tt').datagrid("reload");
   						$.hyjx.alert('信息','删除成功');
   					}else if(msg=="exist"){
   						$.hyjx.alert('信息','该子系统下存在菜单，不能删除！！！');	
   					}else{
   						$.hyjx.alert('信息','删除失败');
   					}
   						
   					},
   					error:function(msg)
   					{
   						alert('删除失败');
   					}
   				});
   				
        	}
        	});
   	 }

        function clearAll(){
	 		$("#form1").form("clear");
	 	}
    </script>
</head>

<body>
	<div class="content">
	<h1 class="public-title"><b>子系统查询</b></h1>
    <form id="form1" class="query-list" name="form1" method="post" action="" data-options="novalidate:true">
    
	<table class="table-query">
		<tr>
			<th width="100">系统名称</th>
			<td >
				<input class="easyui-textbox" type="text" name="subsys_name" data-options="validType:['length[0,10]']"/>
			</td>
			<td style="text-align: right">
				<input type="button" class="btn btn-info" value="查　询" onclick="query()"/>
                <input type="button" class="btn" value="重　置" onclick="clearAll()"/>
                    
				
			</td>
		</tr>
	</table>
</form>
	</div>
	
	<div class="content">
    <!-- 查询结果列表 -->
    <div class="result-list">
        <h1 class="title"><b>子系统列表</b></h1>
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
		<table id="tt" style="width:100%;" >
		
		
		</table>
    </div>
    </div>
</body>
</html>