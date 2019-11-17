<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script type="text/javascript">
    
     $(function(){
        	document.getElementById("mydiv").style.display="none";
        	query();
        });
        var total =0;
        var method;
        function clearAll()
        {
        	//$("#form1").form("clear");
        	$("#operate_code").textbox('setValue', "");
        	$("#operate_name").textbox('setValue', "");
        }
        function add()
        {
        	method="add";
        	$("#operate_code").textbox('setValue', "");
        	$("#operate_name").textbox('setValue', "");
        	document.getElementById("mydiv").style.display="block";
        }
        function doAdd(){
        	if(!$("#form1").form('validate')){  
			return;
		}
        	
        	$.ajax({
        		url:"<%=basePath%>menu/checkExist.xhtml",
    			data:$("#form1").serialize(),
    			type:"post",
    			async:false,
    			success:function(msg)
    			{
    				if("exist"==msg){
    					$.hyjx.alert('信息','该编码在该菜单下面已经存在！','info',function(){
    						return false;
    					});
    					return false;
    				}else{
    					
    					
    					if(method=="add"){
    		        		$.ajax({
    		        			url:"<%=basePath%>menu/doAddMenuFunc.xhtml",
    		        			data:$("#form1").serialize(),
    		        			type:"post",
    		        			async:false,
    		        			success:function(msg)
    		        			{
    		        				if(msg=="success"){
    		        					$.hyjx.alert('信息','添加成功','info',function(){
    		        						$('#tt').datagrid("reload");
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
    		        	}else if(method=="edit"){
    		        		//alert($("#operate_code").textbox('getValue'));
    		        		$.ajax({
    		        			url:"<%=basePath%>menu/doEditMenuFunc.xhtml",
    		        			data:$("#form1").serialize(),
    		        			type:"post",
    		        			async:false,
    		        			success:function(msg)
    		        			{
    		        				if(msg=="success"){
    		        					$('#tt').datagrid("reload");
    		        					$.hyjx.alert('信息','修改成功','info',function(){
    		        						
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
    					
    				}
    			}
        	});
        	
        }
         
        function del(id,code)
        {
        	
        	$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>menu/doDeleteMenuFunc.xhtml?operate_id="+id,
    				   	type:"post",
    				   	success: function(msg){
    				   		if("success" == msg) {
    				   			if(code==$("#operate_code").textbox('getValue'))
    	    					{
    	    					$("#operate_code").textbox('setValue', "");
    	    		        	$("#operate_name").textbox('setValue', "");
    	    					}
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
        function edit(operate_code,operate_name,operate_id)
        {  
        	/* alert(operate_name);
        alert(operate_code);
       
        alert(operate_id); */
    	document.getElementById("mydiv").style.display="block";
            method="edit";
        	$("#operate_code").textbox('setValue', operate_code);
        	$("#operate_name").textbox('setValue', ""+operate_name);
        	$("#operate_id").val(operate_id);
        }
      
        
        function query()
        {
            debugger;
         	var data = $("#form1").serialize(); 
        	$('#tt').datagrid({
        		    url:'<%=basePath %>menu/queryMenuFunc.xhtml',
        		    queryParams:data,
        		    singleSelect: true,
    				pageNumber: 1,
        		    columns:[[
        		        {field:'operate_code',title:'操作编码',width:'25%',align:'center'},
        		        {field:'operate_name',title:'操作名称',width:'30%',align:'center'},
        		        {field:'operate_id',title:'操作',width:'40%',align:'center',formatter:function(value, rowData, rowIndex){
        		        	var operate_code=rowData.operate_code;
        		        	var operate_name = rowData.operate_name;
        		        	var operate_id = rowData.operate_id;
        		        	return "<span title=编辑  class=btn-edit onClick=\"edit('"+operate_code+"','"+operate_name+"','"+operate_id+"')\"></span>"+
        		        	"<span title=删除  class=btn-delete onClick=\"del('"+value+"','"+operate_code+"')\"></span>";
        		        }}
        		    ]],
        		    onLoadSuccess:function(data){
        		    	if(data.total==0){
        		    		document.getElementById("mydiv").style.display="none";
        		    	}
        		    	total = data.total+1;
        		    }
        		});	
        }
        function closewin()
    	{
    		window.parent.closeWin('操作权限');
    	}
    </script>
</head>
<body>
    <!-- 查询条件列表 -->
    <h1 class="public-title">操作权限</h1>
    <div id="mydiv" >
    <form id="form1"  class="query-list" name="form1"  method="post" action="" data-options="novalidate:true">
	<div style="display:none;">
	
	<input type="text" id="menu_code" name="menu_code" value="<c:out value='${model.menu_code}'/>" />
	</div>
    <input type="hidden" id="operate_id" name="operate_id" value=""/>    
        <!-- query table -->
        <table class="table-query">
        <tbody border="1">
            <tr>
                <th >操作编码</th>
                <td ><input class="easyui-textbox" type="text" name="operate_code" id="operate_code" data-options="required:true,validType:['length[1,10]']"  /></td>
                <th >操作名称</th>
                <td ><input class="easyui-textbox" type="text" name="operate_name" id="operate_name" data-options="required:true,validType:['length[1,20]']"/></td>
            </tr>      
            </tbody>
            <tfoot>
            <tr>
                <td colspan="4" >
                    <button class="btn btn-info" type="button" onclick="doAdd()">保存</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>
                </td>
            </tr>
             </tfoot>
        </table>
    </form>
</div>
    <!-- 查询结果列表 -->
    <div class="result-list">
        <h1 class="title">操作权限列表</h1>
        <div id="tb" class="operate">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        </div>
		<table id="tt" class="easyui-datagrid"></table>
    </div>
    <center>
                        <button class="btn" type="button"  onclick="closewin()">返回</button>
                 </center>
</body>
</html>
