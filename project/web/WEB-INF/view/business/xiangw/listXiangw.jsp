<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
                <input type="text" name="name" id="name"
                       class="easyui-textbox"/>
            </td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="" name="sex"></span>
            </td>
        </tr>
        <tr>
            <th>起始时间</th>
            <td>
                <input type="date" name="begindate" id="begindate"
                       class="easyui-datebox" data-options="" style="width:180px;"/>
            </td>
            <th>结束时间</th>
            <td>
                <input type="date" name="enddate" id="enddate"
                       class="easyui-datebox" data-options="" style="width:180px;"/>

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

<div class="result-list">
    <h1 class="title">查询列表</h1>
    <div id="tb" class="operate">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
    </div>
    <table id="tt" class="easyui-datagrid" >

    </table>
</div>


</body>
</html>

<script type="text/javascript">
    $(function(){
        doQuery();
    });
    function doQuery(){
        var data_attr = $("#form1").serialize();
        $('#tt').datagrid({
            url: '<%=basePath %>xiangw/queryList.xhtml',
            queryParams: data_attr,
            singleSelect: true,
            rownumbers: true,
            //分页显示在页面底部
            pagination: true,
            //分页的页码
            pageNumber: 1,
            //每页记录数
            pageSize:10,
            columns:[[
                {field:'name',title:'姓名',width:100},
                {field:'sex',title:'性别',width:100},
                {field:'age',title:'年龄',width:100},
                {field:'birthday',title:'出生年月',width:120},
                {field:'csdsheng',title:'出生地',width:100},
                {field:'csdshi',title:'市',width:100},
                {field:'csdjdmph',title:'具体门牌号',width:100},
                {field:'bmid',title:'部门id',width:100,hidden:true},
                {field:'bmmc',title:'部门名称',width:100},
                {field:'ah',title:'爱好',width:100},
                {field:'scly',title:'擅长领域',width:100},
                {field:'cjrid',title:'创建人id',width:100,hidden:true},
                {field:'cjrbmid',title:'创建人部门id',width:100,hidden:true},
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
        openWinW('<%=basePath %>xiangw/gotoAdd.xhtml',"信息添加","800px","450px",false,false);
    }
    function edit(id)
    {
        openWinW('<%=basePath %>xiangw/gotoEdit.xhtml?id='+id,"信息修改","800px","450px",false,false);
    }
    function del(id)
    {
        $.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
            if(result == true){
                $.ajax({
                    url: "<%=basePath %>xiangw/gotoDel.xhtml?id="+id,
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
        openWinW('<%=basePath %>xiangw/gotoView.xhtml?id='+id,"信息详细","650px","350px",false,false);
    }
</script>
