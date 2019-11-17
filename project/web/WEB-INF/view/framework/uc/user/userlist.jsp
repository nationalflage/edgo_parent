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
    <title>查询条件和查询结果列表</title>
    <script type="text/javascript">
        function clearAll()
        {
        	$("#userAccount").textbox('setValue','');
        	$("#userName").textbox('setValue','');
        	$("#includChild").val("1");
        	$("#includChildBox").get(0).checked=true;
        }
        function add()
        {
        	var orgCode=$("#orgCode").val();
        	var departCode=$("#departCode").val();
        	openWinW('<%=basePath%>user/gotoAdd.xhtml?optType=1&orgCode='+orgCode+'&departCode='+departCode, '添加用户', '900px', '530px', true, false);
        }
        function edit(id)
        {
        	openWinW('<%=basePath%>user/gotoAdd.xhtml?optType=2&userId='+id, '修改用户', '900px', '530px', true, false);
        }
          function gotoImport()
        {
        	openWinW('<%=basePath%>common/gotoImport.xhtml?en_module_name=user', '用户信息导入', '900px', '600px', true, false);
        }
        function del(id,name)
        {
        	$.hyjx.confirm("提示信息","确定要删除【"+name+"】吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>user/gotoDelete.xhtml?ids="+id,
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
        
        function view(v)
        {
        	openWinW('<%=basePath%>user/gotoView.xhtml?user_id='+v, '查看详细', '900px', '600px', true, false);
        }
        var tabs_iframeheight = 0;
        function query()
        {
            if(!$("#form1").form('validate')){
                return;
            }
        	if ($("#includChildBox").get(0).checked){
        		$("#includChild").val("1");
        	}else{
        		$("#includChild").val("0");
        	}
        	
         	var data = $("#form1").serialize(); 
        	$('#tt').datagrid({
        		    url:'<%=basePath %>user/queryUserList.xhtml',
        		    queryParams:data,
    				rownumbers: true,
    				
    				pageNumber: 1,
    				onLoadSuccess: function(data) {
    					if(uiLayout=='1'){
    						var height = Math.max(document.body.scrollHeight,$(".left-tree",parent.document).height());
        					parent.document.getElementById("treeFrame").style.height = height+"px";
        					parent.parent.document.getElementById("rightFrame").style.height =(height+50) +"px";
    					}
    	             },
        		    columns:[[
        		        {field:'user_account',title:'登录名',width:'15%',sortable:true},
        		        {field:'user_name',title:'姓名',width:'10%',align:'left',sortable:true},
        		        {field:'user_sex',title:'性别',width:'5%',align:'left',sortable:true,formatter:function(value, rowData, rowIndex){
        		        	if(value == "M")
        		        	{
        		        		return "男";
        		        	}else if(value == "F")
        		        	{
        		        		return "女";	
        		        	}
        		        }},
        		        {field:'departName',title:'所属部门',width:'25%',align:'left',sortable:false},
        		        {field:'mobile',title:'手机',width:'12%',align:'left',sortable:true},
        		        {field:'validity',title:'是否有效',width:'10%',align:'left',sortable:true,formatter:function(value, rowData, rowIndex){
        		        	if(value=="Y") return "是";
        		        	else return "否";
        		        }},
        		        {field:'user_id',title:'操作',width:140,
        		        	formatter: function (value, rowData, rowIndex) {
        		        		 return "<span title=查看 class=btn-view onclick=view("+"\'"+value+"\'"+")></span>"+
        		        		"<span title=编辑  class=btn-edit onclick=edit("+"\'"+value+"\'"+")></span>"+
        		        		"<span title=删除  class=btn-delete onclick=del("+"\'"+value+"\','"+rowData.user_name+"'"+")></span>";
        		        	}	
        		        }
        		    ]]
        		});	
        }
        $(document).ready(function(){
			query();
        });
        
        function setNodeId(id){
        	$("#depart_code").val(id);
        }
    </script>
</head>
<body>
<div class="content" style="margin: 0">
    <!-- 查询条件列表 -->
    <h1 class="public-title"><b>用户查询</b></h1>
    <form id="form1" class="query-list" name="form1"  method="post" action="" data-options="novalidate:true">
		<input type="hidden" id="orgCode" name="orgCode" value="<c:out value="${bean.orgCode}"/>"/>
		<input type="hidden" id="departCode" name="departCode" value="<c:out value="${bean.departCode}"/>"/>
		<input type="hidden" id="includChild" name="includChild" value="1"/>

        <!-- query table -->
        <table class="table-query">
        <tbody>
            <tr>
            	<th >登录名</th>
                <td ><input class="easyui-textbox" type="text" name="userAccount" id="userAccount" data-options="validType:['length[0,10]']"/></td>
                <th >姓名</th>
                <td ><input class="easyui-textbox" type="text" name="userName" id="userName" data-options="validType:['length[0,10]']"/></td>
                <th ></th>
                <td ><label><input type="checkbox" name="includChildBox" id="includChildBox" checked="checked"/>包含下级</label></td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6" >
                    <button class="btn btn-info" type="button" onclick="query()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>
                </td>
            </tr>
             </tfoot>
        </table>
    </form>

    <!-- 查询结果列表 -->
    <div class="result-list">
        <h1 class="title"><b>用户列表</b></h1>
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
		<table id="tt" class="easyui-datagrid"></table>
    </div>
</div>
</body>
</html>
