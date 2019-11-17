<%--
  Created by IntelliJ IDEA.
  User: 31545518
  Date: 2019/10/18
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
            <th>爱好</th>
            <td>

                <input type="text" name="ah" id="ah" data-options="validType:length[0,50]"/>

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

<script type="text/javascript">
    $(function(){
        //alert("--------0000---------");
        doQuery();
        $('#tt').datagrid("reload");
    });
    function doQuery(){
        var data_attr = $("#form1").serialize();
        $('#tt').datagrid({
            url: '<%=basePath %>mengt/mengtGetList.xhtml',
            /* 在请求远程数据的时候发送额外的参数*/
            queryParams: data_attr,
            /* true，则只允许选择一行。*/
            singleSelect: true,
            /* true 显示行列号*/
            rownumbers: true,
            /* true，则在DataGrid控件底部显示分页工具栏*/
            pagination: true,
            columns:[[
                {field:'name',title:'姓名',width:40},
                {field:'sex',title:'性别',width:40},
                {field:'age',title:'年龄',width:40},
                {field:'birthday',title:'出生年月',width:70},
                {field:'csdsheng',title:'出生地',width:80},
                {field:'csdshi',title:'市',width:50},
                {field:'csdxian',title:'县',width:40},
                {field:'csdjdmph',title:'具体门牌号',width:100},
                {field:'bmid',title:'部门id',width:100,hidden:true},
                {field:'bmmc',title:'部门名称',width:100},
                {field:'ah',title:'爱好',width:100},
                {field:'scly',title:'擅长领域',width:100},
                {field:'sfyx',title:'是否有效',width:40},
                {field:'cjrid',title:'创建人id',width:100,hidden:true},
                {field:'cjrxm',title:'创建人姓名',width:50,hidden:true},
                {field:'cjrbmid',title:'创建人部门id',width:100,hidden:true},
                {field:'cjrbmmc',title:'创建人部门名称',width:100,hidden:true},
                {field:'zsc',title:'最擅长',width:40},
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
    // 添加信息
    function add()
    {
        openWinW('<%=basePath %>mengt/mengtGotoAdd.xhtml',"信息添加","900px","500px",false,false);
    }
    // 修改编辑
    function edit(id){
        //alert("------------");
        openWinW('<%=basePath %>mengt/mengtGotoEdit.xhtml?id='+id,"信息修改","900px","500px",false,false);
    }
    // 删除
    function del(id){
        $.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
            if(result == true){
                $.ajax({
                    url: "<%=basePath %>mengt/mengtDelete.xhtml?ids="+id,
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

    function view(id){
        openWinW('<%=basePath %>mengt/mengtGotoView.xhtml?id='+id,"信息详细","900px","500px",false,false);

    }

</script>

</body>
</html>
