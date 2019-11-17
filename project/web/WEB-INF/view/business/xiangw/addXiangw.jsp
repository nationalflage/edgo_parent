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
<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true">
    <table  class="table-query">
        <tbody>
        <tr>
            <th>姓名</th>
            <td><input type="text" id="name"  class="easyui-textbox"
                       name="name"  data-options=" required:true,validType:'checkName'" /></td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex}" name="sex"></span>
            </td>
        </tr>

        <tr>
            <th>年龄</th>
            <td>
                <input  name="age" id="age"
                        class="easyui-numberbox"
                        onblur="doCheck()"
                        data-options="required:true,validType:'checkAge'"></td>
            <th>出生年月</th>
            <td>
                <input type="date" name="birthday" id="birthday" value="${model.birthday}"
                       class="easyui-datebox" data-options="" style="width:180px;"/>
            </td>
        </tr>

        <tr>
            <th>出生省</th>
            <td >
                <select class="easyui-combobox hy-codeselect"  required="true" codetable="district" name="csdsheng" id="csdsheng" value="${model.csdsheng}" style="width: 180px;" ></select>
            </td>
            <th>出生市</th>
            <td >
                <select class="easyui-combobox hy-codeselect"  required="true" codetable="district" parentobject="csdsheng" name="csdshi" id="csdshi" value="${model.csdshi}" style="width: 180px;" ></select>
            </td>
        </tr>

        <tr>
            <th>出生县</th>
            <td >
                <select class="easyui-combobox hy-codeselect"  codetable="district" parentobject="csdshi" name="csdxian" id="csdxian" value="${model.csdxian}" style="width: 180px;" ></select>
            </td>
            <th>具体门牌号</th>
            <td>
                <input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph}"
                       class="easyui-textbox"  data-options="validType:length[0,50]" style="width:180px"/>
            </td>
        </tr>

        <tr>
            <th>部门名称</th>
            <td>
                <input class="easyui-combotree" id="tagId5"
                       data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree',checkedvalue:'${model.bmmc}'"/>
            </td>
            <th>是否有效</th>
            <td>
                <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="${model.sfyx}" name="sfyx"></span>
            </td>
        </tr>

        <tr>
            <th>爱好</th>
            <td>
                <c:forEach items="${ahList}" var="ah">
                    <input name="ah" type="checkbox"  id="ah${ah.code}" value="<c:out value='${ah.code}'/>"	/>
                    <c:out value='${ah.name}'/>
                </c:forEach>
            </td>
            <th>擅长领域</th>
            <td>
                <c:forEach items="${sclyList}" var="sclys">
                    <input name="scly" type="checkbox"  id="sclys${sclys.code}" value="<c:out value='${sclys.code}'/>"	/>
                    <c:out value='${sclys.name}'/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>创建人名称</th>
            <td>
                <input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm}"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
            <th>创建人部门</th>
            <td>
                <input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc}"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="hidden" id="bmid" name="bmid" />
                <input type="hidden" id="bmmc" name="bmmc"  />
                <input type="button" class="btn btn-info" value="保　存" onclick="save()"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息添加')"/>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
</html>

<script type="text/javascript">

    $(function () {
        //表单验证
        $.extend($.fn.validatebox.defaults.rules,{
            //长度验证
            checkName:{
                validator : function(value) {
                    return /^[\u4e00-\u9fa5]{2,20}$|^[\dA-Za-z_]{2,20}$/.test(value);
                },
                message : '长度2-20'
            },
            //年龄1-100验证
            checkAge : {
                validator : function(value) {
                    return /^([1-9][0-9]{0,1}|100)$/.test(value);
                },
                message : '只允许1-100'
            }
        });
    });
    
    function save() {
        var bmid = $('#tagId5').combotree('tree').tree('getSelected').code;
        var bmmc = $('#tagId5').combotree('tree').tree('getSelected').text;
        $("#bmid").val(bmid);
        $("#bmmc").val(bmmc);

        //表单所有数据正确才能执行保存
        if (!$("#form1").form('validate')) {
            return;
        }
        var data = $("#form1").serialize();
        $.ajax({
            type: "POST",
            url: "<%=basePath %>xiangw/doAdd.xhtml",
            data: data,
            success: function (msg) {
                if ("success" == msg) {
                    $.messager.alert("提示信息", "信息添加成功！", "info", function () {
                        parent.rightFrame.$('#tt').datagrid("reload");
                        window.parent.closeWin('信息添加');
                    });
                } else {
                    $.messager.alert("提示信息", "信息添加失败，请重试！", "error", function () {
                    });
                }
            }
        });
    }

</script>
