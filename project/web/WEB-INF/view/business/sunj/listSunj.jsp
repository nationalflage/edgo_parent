<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>查询列表</title>
</head>
<body>

    <h1 class="public-title">查询条件列表</h1>
    <!-- 查询条件列表 -->
    <form class="query-list" id="form1" data-options="novalidate:true" method="post">
        <table class="table-query">
            <tbody>
            <tr>
                <th width="10%">姓名</th>
                <td>
                    <input type="text" name="name" id="name" value="${model.name }"
                           class="easyui-textbox"/>
                </td>
                <th width="10%">性别</th>
                <td>
                    <span class="hy-radio" options="男:M;女:F" name="sex" checkoptions="${model.sex}"/>
                </td>
            </tr>

                <%--<th>行政区划</th>--%>
                <%--<td >--%>
                    <%--<select class="easyui-combobox hy-codeselect" id="districtid" name="districtid" type="text" codetable="district" />--%>
                <%--</td>--%>

            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    <input class="btn btn-info" type="button" value="查　询" onclick="doQuery()"/>
                    <input class="btn" type="button" value="重　置" onclick="clearAll()"/>
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
        <%--<div id="tb1" class="operate">--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="tree()">树</a>--%>
        <%--</div>--%>
        <table id="tt" class="easyui-datagrid" >

        </table>
    </div>
    <!-- 查询结果列表 end -->
    <%--<ul class="easyui-tree">--%>
        <%--<li><span>红楼梦</span>--%>
            <%--<ul>--%>
                <%--<li>第1回  甄士隐梦幻识通灵   贾雨村风尘怀闺秀</li>--%>
                <%--<li>第2回  贾夫人仙逝扬州城   冷子兴演说荣国府</li>--%>
                <%--<li>第3回  托内兄如海荐西宾   接外孙贾母惜孤女</li>--%>
                <%--<li>第4回  薄命女偏逢薄命郎   葫芦僧判断葫芦案</li>--%>
                <%--<li>第5回  贾宝玉神游太虚境   警幻仙曲演红楼梦</li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li><span>水浒传</span></li>--%>
        <%--<li><span>三国演义</span>--%>
            <%--<ul>--%>
                <%--<li>第001回 宴桃园豪杰三结义 斩黄巾英雄首立功</li>--%>
                <%--<li>第002回 张翼德怒鞭督邮 何国舅谋诛宦竖</li>--%>
                <%--<li>第003回 议温明董卓叱丁原 馈金珠李肃说吕布</li>--%>
                <%--<li>第004回 废汉帝陈留践位 谋董贼孟德献刀</li>--%>
                <%--<li>第005回 发矫诏诸镇应曹公 破关兵三英战吕布</li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li><span>西游记</span></li>--%>
    <%--</ul>--%>
</body>
</html>
<script>
    $(function(){
        doQuery();
    });
    function doQuery(){
        var data_attr = $("#form1").serialize();
        $('#tt').datagrid({
            url: '<%=basePath %>sunj/queryList.xhtml',
            queryParams: data_attr,
            singleSelect: true,
            rownumbers: true,
            pagination: true,
            pageNumber: 1,
            pageSize:10,
            pageList:[5,10,15,20],
            columns:[[
                {field:'name',title:'姓名',width:80,halign:'center'},
                {field:'sex',title:'性别',width:80,halign:'center'},
                {field:'age',title:'年龄',width:80,halign:'center'},
                {field:'birthday',title:'出生年月',width:105,halign:'center'},
                {field:'csdsheng',title:'出生地(省)',width:110,halign:'center'},
                {field:'csdshi',title:'出生地(市)',width:100,halign:'center'},
                {field:'csdxian',title:'出生地(县)',width:100,halign:'center'},
                {field:'csdjdmph',title:'具体门牌号',width:100,halign:'center'},
                {field:'bmid',title:'部门id',width:100,halign:'center',hidden:true},
                {field:'bmmc',title:'部门名称',width:120,halign:'center'},
                {field:'ah',title:'爱好',width:100,halign:'center'},
                {field:'sfyx',title:'是否有效',width:60,halign:'center'},
                {field:'cjrid',title:'创建人id',width:100,halign:'center',hidden:true},
                {field:'cjrxm',title:'创建人姓名',width:100,halign:'center'},
                {field:'cjrbmid',title:'创建人部门id',width:100,halign:'center',hidden:true},
                {field:'cjrbmmc',title:'创建人部门名称',width:100,halign:'center'},
                {field:'ly',title:'擅长领域',width:100,halign:'center'},
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
    function clearAll(){
        $("#form1").form("clear");
    }
    function add()
    {
        openWinW('<%=basePath %>sunj/gotoAdd.xhtml',"信息添加","800px","460px",false,false);
    }
    function edit(id)
    {
        openWinW('<%=basePath %>sunj/gotoEdit.xhtml?id='+id,"信息修改","800px","460px",false,false);
    }
    function del(id)
    {
        $.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
            if(result == true){
                $.ajax({
                    url: "<%=basePath %>sunj/gotoDelete.xhtml?id="+id,
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
        openWinW('<%=basePath %>sunj/gotoView.xhtml?id='+id,"信息详细","800px","500px",false,false);
    }
    <%--function tree(){--%>
        <%--$.ajax({--%>
            <%--url:'<%=basePath%>sunj/gototreeSunj.xhtml'--%>
        <%--});--%>
    <%--}--%>
</script>

