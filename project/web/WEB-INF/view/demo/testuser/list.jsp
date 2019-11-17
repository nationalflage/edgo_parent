<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >

	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>测试页面</title>
</head>
<body>
<div class="content">
 <h1 class="public-title">查询条件列表</h1>
    <!-- 查询条件列表 -->
    <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
        <table class="table-query">
            <tbody>
                <tr>
                    <th width="10%">用户登录名</th>
                    <td>
                        <input class="easyui-textbox"  type="text" name="loginId"/>
                    </td>
                    <th width="10%">用户姓名</th>
                    <td>
                         <input class="easyui-textbox" type="text" name="userName"/>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4">
                        <input type="button" class="btn btn-info" value="查　询" onclick="doQuery()"/>
                        <input type="button" class="btn" value="重　置" onclick="clearAll()"/>
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
    </div>

    <div class="content">
    <!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="title">查询列表</h1>
        <!-- 操作按钮 -->
        <div id="tb" class="operate">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="add()">添加</a>
        </div>
        <table id="tt"  >
        </table>
    </div>
    <!-- 查询结果列表 end -->
</div>
</body>
</html>
<script>
    $(function(){
        doQuery();
    });

    function doQuery(){
        var data_attr = $("#form1").serialize();
        $('#tt').datagrid({
            url: baseUrl+'testuser/queryList.xhtml',
            queryParams: data_attr,
            rownumbers: true,
            pageNumber: 1,
            columns:[[
                    {field:'userName',title:'用户姓名',width:200,halign:'center'},
                    {field:'mobile',title:'手机',width:200,halign:'center'},
                {field:'email',title:'电子邮件',width:200,halign:'center'},
                {field:'loginId',title:'登录名',width:200,halign:'center'},
                    {field:'userId',title:'操作',width:100,halign:'center',
                        formatter: function (value, rowData, rowIndex) {
                             return "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>"+
                                "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>" +
                                "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>";
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
        openWinW(baseUrl+'testuser/gotoAdd.xhtml',"信息添加","800px","460px",false,false);
    }
</script>