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
    <table class="table-query">
        <tbody>
        <tr>
            <th>姓名</th>
            <td>
                <input type="text" id="name" class="easyui-textbox" name="name"  dat-options="validType:length[0,50]" value="${model.name}"/>
            </td>
            <th>性别</th>
            <td>
                <span id="sex" class="hy-radio" options="男:M;女:F" checkoptions="${model.sex}" name="sex"></span>
            </td>
        </tr>
        <tr>
            <th>年龄</th>
            <td>
                <%--<input type="text" id="age" name="age" class="easyui-textbox" required="true" data-options="validType:'number'" data-options="validType:length[1,3]" value="${model.age}"/>--%>
                    <input type="text" id="age" name="age" class="easyui-textbox"   data-options="required:true,validType:'areacode'" value="${model.age}" style="width: 100px" />
            </td>
            <th>出生年月</th>
            <td>
                <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                       class="easyui-datebox" required="true" data-options="" style="width:120px;"/>
            </td>
        </tr>
        <tr>
            <th>出生省</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" text="${model.csdsheng}" name="csdsheng" id="province" style="width: 180px;"  ></select>
            </td>
            <th>出生市</th>
            <td>
                <select  class="easyui-combobox hy-codeselect" name="csdshi" parentcode="${model.csdsheng}" text="${model.csdshi}" codetable="district" parentobject="province" id="city" style="width: 180px;"  ></select>
            </td>
        </tr>
        <tr>
            <th>出生县</th>
            <td>
                <select class="easyui-combobox hy-codeselect" name="csdxian" parentcode="${model.csdshi}" text="${model.csdxian}" codetable="district" parentobject="city" id="area" style="width: 180px;"  ></select>
            </td>
            <th>具体门牌号</th>
            <td>
                <input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph }"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
        </tr>
        <tr>
            <th>
                部门名称
            </th>
            <td>
                <%--<input id="tagId8" class="easyui-combotree" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'" name="bmmc"/>--%>
                    <%--<input class="easyui-combotree" id="tagId5" data-options="customtree:true,customtype:'1',treeid:'sys.codetable.bmtree'" value="${model.bmmc}" checkedvalue="${model.bmmc}"/>--%>
                    <input id="tagId6" value="${model.bmmc}" checkedvalue="${model.bmmc}"/>
            </td>
            <th>爱好</th>
            <td>
                <c:forEach items="${ahList}" var="wd">
                    <input name="ah" type="checkbox"  id="ah${wd.code}" value="<c:out value='${wd.code}'/>"/>
                    <c:out value='${wd.name}'/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>是否有效</th>
            <td>
                <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="${model.sfyx}" name="sfyx"></span>
            </td>
            <th>创建人姓名</th>
            <td>
                <input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm }"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
        </tr>
        <tr>
            <th>创建人部门名称</th>
            <td>
                <input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc }"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
        </tr>
        <tr>
            <th>擅长领域</th>
            <td>
                <c:forEach items="${lyList}" var="wd1">
                    <input name="ly" type="checkbox"  id="ly${wd1.code}" value="<c:out value='${wd1.code}'/>"/>
                    <c:out value='${wd1.name}'/>
                </c:forEach>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="hidden" name="id" id="id" value="${model.id }"/>
                <input type="hidden" name="bmid" id="bmid" />
                <input type="hidden" name="bmmc" id="bmmc" />

                <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息修改')"/>

            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    $("#tagId6").combotree({
        customtree:true,
        customtype:'1',
        treeid:'sys.codetable.bmtree'
    });
    $(function(){
        $.ajax({
            url:'<%=basePath%>selectServlet?codetable=district',
            datatype:"json",
            success:function(res){
                $("#depart_funca").combobox({
                    editable:false,
                    valueField:'code',
                    textField:'name',
                    panelHeight:'auto',
                    data:JSON.parse(res).result
                })
            },
            error:function(res){

            }
        });
        $.ajax({
            url:'<%=basePath%>selectServlet?codetable=district',
            datatype:"json",
            success:function(res){
                $("#depart_funca").combobox({
                    editable:false,
                    valueField:'code',
                    textField:'name',
                    panelHeight:'auto',
                    data:JSON.parse(res).result
                })
            },
            error:function(res){

            }
        });

        $.extend($.fn.validatebox.defaults.rules,{
            areacode : {
                validator : function(value) {
                    return /^[0-9]{1,3}$/gi.test(value);
                },
                message : '只允许1-3位数字'
            }
        });
        var ah = '${model.ah}'.split(',');
        for(var i=0;i<ah.length;i++) {
            $("#ah"+$.trim(ah[i])).attr("checked","checked");
        }

        var ly = '${model.ly}'.split(',');
        for(var i=0;i<ly.length;i++) {
            $("#ly"+$.trim(ly[i])).attr("checked","checked");
        }

        <%--$('#province').combobox('select', ${model.csdsheng});--%>
        <%--$('#city').combobox('select', ${model.csdshi});--%>
        <%--$('#area').combobox('select', ${model.csdxian});--%>

    });
    function save(){
        if(!$("#form1").form('validate')){
            return;
        }

        // var bmid = $('#tagId5').combotree('tree').tree('getSelected').code;
        // var bmmc = $('#tagId5').combotree('tree').tree('getSelected').text;
        //
        // $("#bmid").val(bmid);
        // $("#bmmc").val(bmmc);

        var bmid = $('#tagId6').combotree('tree').tree('getSelected').code;
        var bmmc = $('#tagId6').combotree('tree').tree('getSelected').text;

        $("#bmid").val(bmid);
        $("#bmmc").val(bmmc);

        var data = $("#form1").serialize();
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sunj/doEdit.xhtml",
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
