<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2019/8/15
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <title>listBu</title>
</head>
<body>
<div class="content">
    <h1 class="public-title">查询条件列表</h1>
    <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
        <table class="table-query">
            <tbody>
            <tr>
                <th>姓名</th>
                <td>
                    <input type="text" name="name" id="name" value="${model.name }"
                           class="easyui-textbox"/>
                </td>
                <th>性别</th>
                <td>
                    <span id="sex" class="hy-radio" options="男:M;女:F" checkoptions="${model.sex }" name="sex"></span>
                </td>
            </tr>
           <%-- <tr>
                <th>起始时间</th>
                <td>
                    <input type="text" name="qssj" id="qssj" value="${model.qssj }"
                           class="easyui-datebox"  style="width:180px;"/>
                </td>

                <th>截止时间</th>
                <td>
                    <input type="text" name="jzsj" id="jzsj" value="${model.jzsj }"
                           class="easyui-datebox"  style="width:180px;"/>
                </td>
            </tr>--%>
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

    <!--查询结果列表-->
    <div class="result-list">
        <h1 class="title">
            <b>信息列表</b>
            <div id="tb" class="operate">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
            </div>
        </h1>
        <table id="tt" class="easyui-datagrid">

        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        doQuery();
    });
    function doQuery() {
        var data_attr = $("#form1").serialize();
        $('#tt').datagrid({
            url: '<%=basePath %>buding/queryList.xhtml',
            queryParams: data_attr,//form表单输入的要查询参数
            singleSelect: true,//设置为true将只允许选择一行
            rownumbers: true,//显示行号
            pagination: true,//显示分页
            pageNumber: 1,//当设置分页属性时，初始化分页码
            pageSize: 10,//当设置分页属性时，初始化每页记录数
            columns: [[
                {field: 'name', title: '姓名', width: 100},
                {field: 'sex', title: '性别', width: 100},
                {field: 'age', title: '年龄', width: 100},
                {field: 'birthday', title: '出生年月', width: 100},
                {field: 'csdsheng', title: '出生地', width: 100},
                {field: 'csdshi', title: '市', width: 100},
                {field: 'csdxian', title: '县', width: 100},
                {field: 'csdjdmph', title: '具体门牌号', width: 100},
                {field: 'bmid', title: '部门id', width: 100, hidden: true},
                {field: 'bmmc', title: '部门名称', width: 100},
                {field: 'ah', title: '爱好', width: 100},
                {field: 'sfyx', title: '是否有效', width: 100},
                {field: 'cjrid', title: '创建人id', width: 100, hidden: true},
                {field: 'cjrxm', title: '创建人姓名', width: 100},
                {field: 'cjrbmid', title: '创建人部门id', width: 100, hidden: true},
                {field: 'cjrbmmc', title: '创建人部门名称', width: 100},
                {
                    field: 'id', title: '操作', width: 120, halign: 'center',
                    formatter: function (value, rowData, rowIndex) {   /*字段值(32位id:7d6121a66add44e59656f3cae1bf9d3c)    行记录数据    行索引*/
                        return "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('" + value + "')\" ></span>" +
                            "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('" + value + "')\" ></span>" +
                            "<span class=\"btn-view\" title=\"查看\" onclick=\"view('" + value + "')\" ></span>"
                    }
                }
            ]]
        });
    }
    function clearAll() {
        $("#form1").form("clear");
    }
    function add() {
        openWinW('<%=basePath %>buding/gotoAdd.xhtml', "信息添加", "650px", "520px", false, false);
    }
    function edit(id) {
        openWinW('<%=basePath %>buding/gotoEdit.xhtml?id=' + id, "信息修改", "650px", "520px", false, false);
    }

    function del(id) {
        $.messager.confirm("提示信息", "确定要删除选择的数据吗？", function (result) {
            if (result == true) {
                $.ajax({
                    url: "<%=basePath %>buding/gotoDelete.xhtml?ids=" + id,
                    success: function (msg) {
                        if ("success" == msg) {
                            $('#tt').datagrid("reload");
                            $.messager.alert("提示", "删除操作成功！", "info", function () {
                            });
                        } else {
                            $.messager.alert("提示", "删除失败，请重试！", "info", function () {
                            });
                        }
                    }
                });
            }
        });
    }

    function view(id) {
        openWinW('<%=basePath %>buding/gotoView.xhtml?id=' + id, "信息详细", "650px", "520px", false, false);
    }
</script>

