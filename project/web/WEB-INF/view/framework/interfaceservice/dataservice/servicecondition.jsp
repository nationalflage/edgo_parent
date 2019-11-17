<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String t=(String)request.getAttribute("srvid");
String t1=(String)request.getParameter("srvid");
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
	
   <input type="hidden" value="<c:out value="${requestScope.srvid}"/>"  id="srvid" name="srvid">
   

	<!-- 查询结果列表 begin-->
   
    <!-- 查询结果列表 end -->

	<table>
	
	 <div class="result-list">
        <h1 class="title">参数条件列表</h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        </div>
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
		<tfoot>
			<tr height="100">
				<td colspan="4"> <input type="button" class="btn"
					value="关　闭" onclick="window.parent.closeWin('编辑参数条件')" /></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>

<script type="text/javascript">
		$(function(){
			doQuery();
		});
		
		function doQuery(){
			//alert('<%=t %>');
			var temp='<%=t %>';
			//var temp=$("srvid").val();
			//alert(temp);
			$('#tt').datagrid({
				url: '<%=basePath %>dataservice/queryListForCondition.xhtml?srvid='+temp,
				
				singleSelect: true,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'parameter',title:'参数名称',width:100},
						{field:'field_content',title:'字段内容',width:100},
						{field:'type',title:'参数类型',width:100},
						{field:'required',title:'参数是否必要',width:100},
						{field:'parameter_means',title:'参数含义',width:100},
					{field:'id',title:'操作',width:100,halign:'center',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>" +
    		        		 	"<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"
    		        	}
    		        }
				]]
			});	
		}
	 	
		function add()
	 	{
			var temp='<%=t %>';
	 		<%-- openWinW('<%=basePath %>dataservice/gotoAddParameterConditiontemp.xhtml?srvid='+temp,"参数条件添加","750px","350px",false,false); --%>
	 		openWinCallback('<%=basePath %>dataservice/gotoAddParameterConditiontemp.xhtml?srvid='+temp,"参数条件添加","750px","350px"
	 			   ,false,false,function setValue(x){$('#tt').datagrid("reload");});
	 	}
	 	function edit(id)
	 	{
	 		 
	 		openWinCallback('<%=basePath %>dataservice/gotoEditParameterConditiontemp.xhtml?id='+id,"参数信息修改","750px","350px"
		 			   ,false,false,function setValue(x){$('#tt').datagrid("reload");});
	 		
	 		<%-- openWinW('<%=basePath %>dataservice/gotoEditParameterConditiontemp.xhtml?id='+id,"信息修改","750px","350px",false,false); --%>
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
	 	function view(id)
	 	{
	 	//	openWinW('<%=basePath %>dataservice/gotoView.xhtml?id='+id,"信息详细","650px","350px",false,false);
	 	}
	</script>
