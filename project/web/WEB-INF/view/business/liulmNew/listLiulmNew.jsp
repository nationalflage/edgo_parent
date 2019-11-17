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
                    <input name="name" id="nn" class="easyui-textbox"  type="text" data-options="validType:length[0,50]"/>
                </td>
                <th>性别</th>
                <td>
                    <label><input name="sex" type="radio" value="M"/>男</label>
                    <label><input name="sex" type="radio" value="F"/>女</label>
                </td>
            </tr>
            <tr>
                <th>年龄</th>
                <td>
                    <input name="minAge" class="easyui-textbox" type="number" data-options="validType:['number','length[0,3]']" style="width: 100px;"/>-
                    <input name="maxAge" class="easyui-textbox" type="number" data-options="validType:['number','length[0,3]']" style="width: 100px;"/>
                </td>
                <th>出生日期</th>
                <td>
                    <input name="minBirthday" class="easyui-datebox"  type="text" style="width:110px;" />-
                    <input name="maxBirthday" class="easyui-datebox"  type="text" style="width:110px;" />
                </td>
			</tr>
			<tr>
                <th>出生省</th>
                <td>
                    <select name="csdProvince" class="easyui-combobox hy-codeselect" codetable="district" name="province" id="province" style="width: 140px;" >
                    </select>
                </td>
                <th>出生市</th>
                <td>
                    <select name="csdCity" class="easyui-combobox hy-codeselect" name="city" codetable="district" parentobject="province" id="city" style="width: 140px;" >
                    </select>
                </td>
			</tr>
			<tr>
                <th>具体门牌号</th>
                <td>
                    <input type="text" name="csdAddress" id="csdAddress" class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
                <th>部门名称</th>
                <td>
                    <input name="deptName" id="tagId8" class="easyui-combotree" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'"/>
                </td>
			</tr>
			<tr>
                <th>爱好</th>
                <td>
                    <c:forEach items="${ahList}" var="ah">
                        <input name="hobby" type="checkbox"  id="hobby" value="<c:out value='${ah.code}'/>"	/>
                        <c:out value='${ah.name}'/>
                    </c:forEach>
                </td>
                <th>创建人姓名</th>
                <td>
                    <input type="text" name="createdName" id="createdName" value="${model.createdName }"
                               class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
			</tr>
			<tr>
                <th>创建人部门名称</th>
                <td>
                        <input type="text" name="createdDeptName" id="createdDeptName" value="${model.createdDeptName }"
                               class="easyui-textbox"  data-options="validType:length[0,50]"/>
                </td>
                <th>擅长领域</th>
                <td>
                    <select name="scly" class="easyui-combobox hy-codeselect" codetable="liulm_scly" id="scly" style="width: 140px;" >
                    </select>
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
				url: '<%=basePath %>liulmnew/queryList.xhtml',
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
						{field:'csdProvince',title:'出生地',width:100},
						{field:'csdCity',title:'出生地',width:100},
						{field:'csdArea',title:'出生地',width:100},
						{field:'csdAddress',title:'具体门牌号',width:100},
						{field:'deptId',title:'部门id',width:100,hidden:true},
						{field:'deptName',title:'部门名称',width:100},
						{field:'hobby',title:'爱好',width:100},
                        {field:'scly',title:'擅长领域',width:100},
						{field:'valid',title:'是否有效',width:100,hidden:true},
						{field:'createdId',title:'创建人id',width:100,hidden:true},
						{field:'createdName',title:'创建人姓名',width:100},
						{field:'createdDeptId',title:'创建人部门id',width:100,hidden:true},
						{field:'createdDeptName',title:'创建人部门名称',width:100},
                        {field:'createdTime',title:'创建时间',width:100},
                        {field:'modifiedTime',title:'修改时间',width:100},
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
	 		openWinW('<%=basePath %>liulmnew/gotoAdd.xhtml',"信息添加","650px","350px",false,false);
	 	}
	 	function edit(id)
	 	{
	 		 openWinW('<%=basePath %>liulmnew/gotoEdit.xhtml?id='+id,"信息修改","650px","350px",false,false);
	 	}
	 	function del(id)
	 	{
	 		$.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
    			if(result == true){
    				$.ajax({
    				   	url: "<%=basePath %>liulmnew/gotoDelete.xhtml?ids="+id,
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
	 	function view(id)
	 	{
	 		openWinW('<%=basePath %>liulmnew/gotoView.xhtml?id='+id,"信息详细","650px","350px",false,false);
	 	}
	</script>
