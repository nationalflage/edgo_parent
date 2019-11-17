<%--
  Created by IntelliJ IDEA.
  User: 31545518
  Date: 2019/10/18
  Time: 16:41
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >

    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <title></title>
</head>
<body>
<form id="form1" class="query-list" method="post" action="">
    <table  class="table-query">
        <tbody>
        <tr>
            <th>姓名</th>
            <td>
                <input type="text" name="name" id="name" value="${model.name}" data-options="required:true,validType:'checkName'" class="easyui-textbox" />
            </td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex }" name="sex" required="false" data-options="validType:length[0,50]"></span>
            </td>
        </tr>
        <tr>
            <th>年龄</th>
            <td>
                <input type="text" id="age" name="age" class="easyui-textbox"   data-options="required:true,validType:'checkAge'" value="${model.age}" style="width: 180px" />
            </td>
            <th>出生年月</th>
            <td>
                <input type="text" name="birthday" id="birthday" data-options="required:true,validType:'checkDate'" value="${model.birthday }" class="easyui-datebox" data-options="" style="width:180px;"/>
            </td>
        </tr>
        <tr>
            <th>出生地</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" name="csdsheng" id="csdsheng" value="${model.csdsheng}"  required="true" data-options="validType:length[0,50]"></select>
            </td>
            <th>市</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" name="csdshi" id="csdshi" parentobject="csdsheng" value="${model.csdshi}"  required="true" data-options="validType:length[0,50]"></select>
            </td>
        </tr>
        <tr>
            <th>县</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" name="csdxian" id="csdxian" parentobject="csdshi" value="${model.csdxian}" ></select>
            </td>
            <th>具体门牌号</th>
            <td>
                <input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph }" class="easyui-textbox" required="true" data-options="validType:length[0,50]"/>
            </td>
        </tr>
        <tr>
            <th>部门名称</th>
            <td>
                <input class="easyui-combotree" id="tagId5" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'${model.bmmc}'"/>
            </td>
            <th>是否有效</th>
            <td>
                <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="${model.sfyx }" name="sfyx"></span>
            </td>
        </tr>
        <tr>
            <th>爱好</th>
            <td>
                <c:forEach items="${ahList}" var="wd">
                    <input name="ah" type="checkbox"  id="ah${wd.code}" value="<c:out value='${wd.code}'/>"/>
                    <c:out value='${wd.name}'/>
                </c:forEach>
            </td>
            <th>擅长领域</th>
            <td>
                <c:forEach items="${scList}" var="sc">
                    <input name="scly" type="checkbox"  id="sc${sc.code}" value="<c:out value='${sc.code}'/>"/>
                    <c:out value='${sc.name}'/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>最擅长</th>
            <td>
                <input type="text" name="zsc" id="zsc" value="${model.zsc}" data-options="required:true" class="easyui-textbox" />
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="hidden" name="cjrid" id="cjrid" value="${model.cjrid}"/>
                <input type="hidden" name="cjrxm" id="cjrxm" value="${model.cjrxm}"/>
                <input type="hidden" name="cjrbmid" id="cjrbmid" value="${model.cjrbmid}"/>
                <input type="hidden" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc}"/>



                <input type="hidden" name="bmid" id="bmid"/>
                <input type="hidden" name="bmmc" id="bmmc"/>
                <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息添加')"/>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript">
    $(function(){
        $.extend($.fn.validatebox.defaults.rules,{
            checkAge : {
                validator : function(value) {
                    return /^[0-9]{1,3}$/.test(value);
                },
                message : '只允许1-3位数字'
            },
            checkDate : {
                validator : function(value){
                    return /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(value);
                },
                message : '请选中日期表中的日期'
            }
        });
        $.ajax({
            url: '<%=basePath%>selectServlet?codetable=district',
            datatype: "json",
            success: function(res) {
                $("#depart_funca").combobox({
                    editable: false,
                    valueField: 'code',
                    textField: 'name',
                    panelHeight: 'auto',
                    data: JSON.parse(res).result
                })
            },
            error: function(res) {}
        });
        $.ajax({
            url: '<%=basePath%>selectServlet?codetable=district',
            datatype: "json",
            success: function(res) {
                $("#depart_funca").combobox({
                    editable: false,
                    valueField: 'code',
                    textField: 'name',
                    panelHeight: 'auto',
                    data: JSON.parse(res).result
                })
            },
            error: function(res) {}
        });



    });

    function save(){
        var bmid=$('#tagId5').combotree('tree').tree('getSelected').code;
        var bmmc=$('#tagId5').combotree('tree').tree('getSelected').text;

        $("#bmid").val(bmid);
        $("#bmmc").val(bmmc);
        if(!$("#form1").form('validate')){
            return;
        }
        var data = $("#form1").serialize();
        $.ajax({
            type: "POST",
            url: "<%=basePath %>mengt/mengtAdd.xhtml",
            data: data,
            success: function(msg){
                if("success" == msg){
                    $.messager.alert("提示信息","信息添加成功！","info", function(){
                        parent.rightFrame.$('#tt').datagrid("reload");
                        window.parent.closeWin('信息添加');
                        $('#teacherDataGrid').datagrid('reload');
                    });
                }else{
                    $.messager.alert("提示信息","信息添加失败，请重试！","error", function(){});
                }
            }
        });

    }


</script>
</body>
</html>
