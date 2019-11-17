<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <input type="text" name="name" id="name" value="${model.name }"
                       class="easyui-textbox"/>
            </td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex }" name="sex"></span>
            </td>
        </tr>
        <tr>
            <th>起始时间</th>
            <td>
                <input type="text" name="starttime" id="starttime" value="${model.starttime }"
                       class="easyui-datebox" editable="false"  data-options="" style="width:180px;"/>--
                <input type="text" name="endtime" id="endtime" value="${model.endtime }"
                       class="easyui-datebox" editable="false"  data-options="" style="width:180px;"/>
            </td>
            <th>爱好</th>
            <td>
                <c:forEach items="${ahList}" var="wd">
                    <input name="ah" type="checkbox"  id="ah${wd.code}" value="<c:out value='${wd.code}'/>"	/>
                    <c:out value='${wd.name}'/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>擅长领域</th>
            <td>
                <select class="easyui-combobox" name="scly" id="scly" style="width: 180px;" value="${model.scly }">

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
        doInitscly();
    });
    function doInitscly() {
        var sclyList = ${sclyList};
        $('#scly').combobox({
            data:sclyList,
            valueField:'id',
            textField:'text'
        });
    }
    function doQuery(){
        var data_attr = $("#form1").serialize();
        //alert("查看一下查询列表返回信息"+data_attr);
        $('#tt').datagrid({
            url: '<%=basePath %>fengtt/queryList.xhtml',
            queryParams: data_attr,
            singleSelect: true,
            rownumbers: true,
            pagination: true,
            pageNumber: 1,
            pageSize:10,
            columns:[[
                {field:'name',title:'姓名',width:100},
                {field:'sex',title:'性别',width:100},
                {field:'age',title:'年龄',width:100},
                {field:'birthday',title:'生日',width:100,hidden:true},
                {field:'csdsheng',title:'出生地省',width:100,hidden:true},
                {field:'csdshi',title:'出生地市',width:100,hidden:true},
                {field:'csdjdmph',title:'门牌号',width:100,hidden:true},
                {field:'bmmc',title:'部门名称',width:100},
                {field:'ah',title:'爱好',width:100},
                {field:'sfyx',title:'有效',width:100,hidden:true},
                {field:'cjrid',title:'创建人id',width:100,hidden:true},
                {field:'cjrxm',title:'创建人姓名',width:100,hidden:true},
                {field:'cjrbmid',title:'创建人部门id',width:100,hidden:true},
                {field:'cjrbmmc',title:'创建人部门名称',width:100,hidden:true},
                {field:'lastdate',title:'修改时间',width:100,hidden:true},
                {field:'scly',title:'擅长领域',width:100},
                {field:'zsc',title:'最擅长',width:100},
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
        openWinW('<%=basePath %>fengtt/gotoAdd.xhtml',"信息添加","1024px","520px",false,false);
    }
    function edit(id)
    {
        openWinW('<%=basePath %>fengtt/gotoEdit.xhtml?id='+id,"信息修改","1024px","520px",false,false);
    }
    function del(id)
    {
        $.messager.confirm("提示信息","确定要删除选择的数据吗？",function(result){
            if(result == true){
                $.ajax({
                    url: "<%=basePath %>fengtt/gotoDelete.xhtml?ids="+id,
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
        openWinW('<%=basePath %>fengtt/gotoView.xhtml?id='+id,"信息详细","819px","470px",true,true);
    }
</script>
