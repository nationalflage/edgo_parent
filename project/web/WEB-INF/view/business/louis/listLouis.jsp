<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2019/08/08
  Time: 13:25:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
	<h1 class="public-title">查询条件列表</h1>
    <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
	<table class="table-query">
        <tbody>
            <tr>
                <th>姓名</th>
                <td>
                    <input name="name" id="name" class="easyui-textbox"  type="text" data-options="validType:length[0,50]"/>
                </td>
                <th>性别</th>
                <td>
                    <label><input name="sex" type="radio" value="M"/>男</label>
                    <label><input name="sex" type="radio" value="F"/>女</label>
                </td>
            </tr>
        </tbody>
		<tfoot>
            <tr>
                <td colspan="6">
                    <input type="button" class="btn btn-info" value="查　询" onclick="doQuery()"/>
                    <input type="button" class="btn" value="重　置" onclick="clearAll()"/>
                </td>
            </tr>
        </tfoot>
	</table>
	</form>

	<!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title">查询列表</h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        </div>
        <table id="tt" class="easyui-datagrid" >
            
        </table>
    </div>
    <!-- 查询结果列表 end -->
	
  </body>
</html>

<script type="text/javascript">
		$(function(){
			doQuery();
		});
		function doQuery(){
			var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>louis/queryList.xhtml',
				queryParams: data_attr,
				singleSelect: true,
				rownumbers: true,
				pagination: true,
				pageNumber: 1,
				pageSize:10,
				columns:[[
						{field:'name',title:'姓名',width:100},
						{field:'sex',title:'性别',width:60},
						{field:'age',title:'年龄',width:60},
						{field:'birthday',title:'出生日期',width:100},
						{field:'csdsheng',title:'出生地',width:100},
						{field:'csdshi',title:'出生地',width:100},
						{field:'csdxian',title:'出生地',width:100},
						{field:'csdjdmph',title:'具体门牌号',width:100},
						{field:'bmid',title:'部门id',width:100,hidden:true},
						{field:'bmmc',title:'部门名称',width:100},
						{field:'ah',title:'爱好',width:100},
						{field:'valid',title:'是否有效',width:100,hidden:true},
						{field:'cjrid',title:'创建人id',width:100,hidden:true},
						{field:'cjrxm',title:'创建人姓名',width:100},
						{field:'cjrbmid',title:'创建人部门id',width:100,hidden:true},
						{field:'cjrbmmc',title:'创建人部门名称',width:100},
					{field:'id',title:'操作',width:100,halign:'center',
    		        	formatter: function (value, rowData, rowIndex) {
    		        		 return "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"+
    		        		 	"<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>"
    		        	}
    		        }
				]]
			});
		}
	 	function clearAll(){
	 		$("#form1").form("clear");
	 	}
        function add()
        {
            openWinW('<%=basePath %>louis/gotoAdd.xhtml',"信息添加","1010px","428px",false,false);
        }
        function view(id)
        {
            openWinW('<%=basePath %>louis/gotoView.xhtml?id='+id,"信息详细","650px","400px",false,false);
        }
        function del(id)
        {
            $.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
                if(result == true){
                    $.ajax({
                        url: "<%=basePath %>louis/gotoDelete.xhtml?id="+id,
                        success: function(msg){
                            if("success" == msg) {
                                $('#tt').datagrid("reload");
                                $.messager.alert("提示","删除操作成功！","info", function(){ });
                            }else {
                                $.messager.alert("提示","删除失败，请重试！","info", function(){ });
                            }
                        }
                    });
                }
            });
        }
        function edit(id)
        {
            openWinW('<%=basePath %>louis/gotoEdit.xhtml?id='+id,"信息修改","1010px","428px",false,false);
        }
	</script>
