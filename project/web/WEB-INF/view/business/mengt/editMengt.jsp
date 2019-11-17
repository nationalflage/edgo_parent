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
<form id="form1" class="query-list" method="post" action="">
    <table  class="table-query">
        <tbody>
        <tr>
            <th>姓名</th>
            <td>
                <input type="text" name="name" id="name" value="${model.name }"
                       class="easyui-textbox" required="true" data-options="validType:length[0,50]"/>
            </td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex }" name="sex"></span>
            </td>
        </tr>
        <tr>
            <th>年龄</th>
            <td>
                <input type="text" name="age" id="age" value="${model.age }"
                       class="easyui-textbox"  required="true" data-options="validType:length[0,50]"/>
            </td>
            <th>出生年月</th>
            <td>
                <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                       class="easyui-datebox" required="true" data-options="validType:length[0,50]" style="width:180px;"/>
            </td>
        </tr>

        <tr>
            <th>出生地</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdsheng}" name="csdsheng"
                        id="csdsheng" value="${model.csdsheng}"></select>
            </td>
            <th>市</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdshi}" parentcode="${model.csdsheng}" name="csdshi"
                        id="csdshi" parentobject="csdsheng" value="${model.csdshi}"></select>
            </td>
        </tr>
        <tr>
            <th>县</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdxian}" parentcode="${model.csdshi}" name="csdxian"
                        id="csdxian" parentobject="csdshi" value="${model.csdxian}" ></select>
            </td>

            <th>具体门牌号</th>
            <td>
                <input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph }"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
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
        <%--<tr>
            <th>最擅长</th>
            <td>
                <input type="text" name="zsc" id="zxc" value="${model.zsc }"
                       class="easyui-textbox" required="true" data-options="validType:length[0,50]"/>
            </td>
        </tr>--%>
        </tbody>
        <tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="hidden" name="id" id="id" value="${model.id }"/>
                <input type="hidden" name="bmid" id="bmid"/>
                <input type="hidden" name="bmmc" id="bmmc"/>
                <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息修改')"/>
            </td>
        </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">

    $(function(){
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


        var ah = '${model.ah}'.split(',');
        for(var i=0;i<ah.length;i++) {
            $("#ah" + $.trim(ah[i])).attr("checked", "checked");
        }

        var scly = '${model.scly}'.split(',');
        for(var i=0;i<scly.length;i++) {
            $("#sc" + $.trim(scly[i])).attr("checked", "checked");
        }
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
            url: "<%=basePath %>mengt/mengtEdit.xhtml",
            data: data,
            success: function(msg){
                if("success" == msg){
                    $.messager.alert("提示信息","信息修改成功！","info", function(){
                        parent.rightFrame.$('#tt').datagrid("reload");
                        window.parent.closeWin('信息修改');
                    });
                }else{
                    $.messager.alert("提示信息","信息修改失败，请重试！","error", function(){});
                }
            }
        });
    }

</script>

</body>
</html>
