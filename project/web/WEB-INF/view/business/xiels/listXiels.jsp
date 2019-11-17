<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <title>listXliels</title>
</head>
<body>
    <div class="content">
        <h1 class="public-title"><b>查询条件</b></h1>
        <!-- 查询条件列表 begin -->
        <form id="form1" class="query-list" method="post" action="">
            <table class="table-query">
                <tbody>
                    <tr>
                        <th>姓名</th>
                        <td>
                            <input type="text" name="name" id="name" value="${model.name }" class="easyui-textbox"/>
                        </td>
                        <th>性别</th>
                        <td>
                            <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex }" name="sex"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>年龄</th>
                        <td>
                            <%--<input type="text" name="beginage" id="beginage" value="${model.beginage }" class="easyui-textbox validatebox-text"
                                   data-options="'validType':['length[0,3]','number']" style="width:95px;"/>--
                            <input type="text" name="endage" id="endage" value="${model.endage }" class="easyui-textbox"
                                   data-options="'validType':['length[0,3]','number']" style="width: 95px"/>--%>
                            <input class="easyui-numberspinner" id="beginage" name="beginage"min="0" max="100" style="width: 90px">--
                            <input class="easyui-numberspinner" id="endage" name="endage" min="0" max="100" style="width: 90px">
                        </td>
                        <th>出生年月</th>
                        <td>
                            <input type="text" name="begin_bir" class="easyui-datebox" />--
                            <input type="text" name="end_bir" class="easyui-datebox" />
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="6">
                        <input type="button" class="btn btn-info" value="查　询" onclick="doQuery()">
                        <input type="button" class="btn" value="重　置" onclick="reSet()">
                    </td>
                </tr>
                </tfoot>
            </table>
        </form>
        <!-- 查询条件列表 end -->
        <!-- 查询结果列表 begin -->
        <div class="result-list">
            <h1 class="title">
                <b>信息列表</b>
                <div id="tb" class="operate">
                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
                </div>
            </h1>
            <table id="tt" class="easyui-datagrid" >
            </table>
        </div>
        <!-- 查询结果列表 end -->
    </div>
    </body>
</html>
<script type="text/javascript">
    $(function(){
        doQuery();
    });
    // 根据条件查询并列出相关信息
    function doQuery() {
        var beginage=parseInt($("#beginage").val());
        var endage=parseInt($("#endage").val());
        console.log(beginage+","+endage);
        if(beginage!="" && endage!=""){
            // debugger;
            if(beginage>endage){
                $.messager.alert("信息提示","请输入正确的年龄段","info",function () {
                });
            }
        }
        var data_attr=$("#form1").serialize();
        // debugger;
        $('#tt').datagrid({
            url: '<%=basePath %>xiels/queryList.xhtml',
            /* 在请求远程数据的时候发送额外的参数*/
            queryParams: data_attr,
            /* true，则只允许选择一行。*/
            singleSelect: true,
            /* true 显示行列号*/
            rownumbers: true,
            /* true，则在DataGrid控件底部显示分页工具栏*/
            pagination: true,
            pageNumber: 1,
            pageSize:10,
            columns:[[
                {field:'name',title:'姓名',width:100},
                {field:'sex',title:'性别',width:100},
                {field:'age',title:'年龄',width:100},
                {field:'birthday',title:'出生年月',width:130},
                {field:'csdsheng',title:'出生地',width:100},
                {field:'csdshi',title:'市',width:100},
                {field:'csdxian',title:'县',width:100},
                {field:'csdjdmph',title:'具体门牌号',width:100},
                {field:'bmid',title:'部门id',width:100,hidden:true},
                {field:'bmmc',title:'部门名称',width:100},
                {field:'ah',title:'爱好',width:100},
                {field:'sfyx',title:'是否有效',width:100},
                {field:'cjrid',title:'创建人id',width:100,hidden:true},
                {field:'cjrxm',title:'创建人姓名',width:100},
                {field:'cjrbmid',title:'创建人部门id',width:100,hidden:true},
                {field:'cjrbmmc',title:'创建人部门名称',width:100},
                {field:'scly',title:'擅长领域',width:100},
                {field:'id',title:'操作',width:130,halign:'center',
                    formatter: function (value, rowData, rowIndex) {
                        return "<span class=\"btn-edit\" title=\"编辑\" onclick=\"edit('"+value+"')\" ></span>"+
                            "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"+
                            "<span class=\"btn-view\" title=\"查看\" onclick=\"view('"+value+"')\" ></span>"
                    }
                }
            ]]
        });
    }

    // 重置表单form1的数据(查询条件)
    function reSet() {
        $("#form1").form("clear");
    }
    // 跳转到添加信息窗口
    function add() {
        openWinW('<%=basePath %>xiels/gotoAdd.xhtml',"信息添加","800px","440px",false,false);
    }
    // 跳转到信息详情窗口
    function view(id) {
        openWinW('<%=basePath%>xiels/gotoView.xhtml?id='+id,"信息详情","800px","450px",false,false);
    }
    // 跳转到编辑页面
    function edit(id) {
        openWinW('<%=basePath%>xiels/gotoEdit.xhtml?id='+id,"信息修改","800px","440px",false,false);
    }
    // 根据id删除指定信息
    function del(id){
        $.messager.confirm("删除提示","你确定要删除",function (result) {
            if(result==true){
                $.ajax({
                    url:"delete.xhtml?id="+id,
                    success:function (msg) {
                        if("success"==msg){
                            $('#tt').datagrid("reload");
                            $.messager.alert("提示","删除成功","info",function () {});
                        }else{
                            $.messager.alert("提示","删除失败，请重试","info",function () {});
                        }
                    }
                })
            }
        })
    }
</script>
