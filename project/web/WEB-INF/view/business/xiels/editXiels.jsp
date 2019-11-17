<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>editXliels</title>
</head>
<body>
    <form id="form1">
        <table class="table-query" style="margin-top: 30px">
            <tbody>
                <tr>
                    <input type="hidden" name="id" id="id" value="${model.id }"/>
                    <th>姓名</th>
                    <td>
                        <input type="text" name="name" required="true" id="name" value="${model.name }" class="easyui-textbox"/>
                    </td>
                    <th>性别</th>
                    <td>
                        <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex }" name="sex"></span>
                    </td>
                </tr>
                <tr>
                    <%--<th>年龄</th>
                    <td>
                        <input type="text" name="age" id="age" value="${model.age }" class="easyui-textbox"
                               style="width:95px;" data-options="validType:'number'" required="true"/>
                    </td>--%>
                    <th>出生年月</th>
                    <td>
                        <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                               class="easyui-datebox" required="true" data-options="" />
                    </td>
                    <th>出生省</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" codetable="district" name="csdsheng" required="true" value="${model.csdsheng}" text="${model.csdsheng}" id="province" style="width: 180px;">
                        </select>
                    </td>
                </tr>
                <tr>

                    <th>出生市</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" codetable="district" name="csdshi" required="true" value="${model.csdshi}" text="${model.csdshi}" parentcode="${model.csdsheng}" parentobject="province" id="city" style="width: 180px;">
                        </select>
                    </td>
                    <th>出生县</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" codetable="district" name="csdxian" value="${model.csdxian}" text="${model.csdxian}" parentcode="${model.csdshi}" parentobject="city" id="erea" style="width: 180px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>具体门牌号</th>
                    <td>
                        <input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph }" class="easyui-textbox"/>
                    </td>
                    <th>部门名称</th>
                    <td>
                        <input id="bm" class="easyui-combotree" required="true" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm',checkedvalue:'${model.bmmc}'" name="bmmc" />
                    </td>
                </tr>
                <tr>
                    <th>有效</th>
                    <td>
                        <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="${model.sfyx }" name="sfyx" c></span>
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

                    <th>创建人姓名</th>
                    <td>
                        <input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm }"
                               class="easyui-textbox"  data-options="validType:length[0,50]" readonly="readonly"/>
                    </td>
                    <th>创建人部门名称</th>
                    <td>
                        <input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc }"
                               class="easyui-textbox"  data-options="validType:length[0,50]" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <th>擅长领域</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" codetable="xiels_scly" name="scly" id="scly" text="${model.scly}"  style="width: 180px;" />
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr></tr>
                <tr>
                    <td colspan="6">
                        <input type="button" class="btn btn-info" value="修  改" onclick="save()">
                        <input type="button" class="btn" value="取   消" onclick="window.parent.closeWin('信息修改')">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    // 选中数据中有的爱好
    var ah='${model.ah}'.split(',');
    for (var i=0;i<ah.length;i++){
        $("#ah"+$.trim(ah[i])).attr("checked","checked");
    }
    function save(){
        //验证表单form1是否有数据，无就返回
        if (!$("#form1").form('validate')) {
            return;
        }
        // 将表单中的数据序列化
        var data=$("#form1").serialize();

        $.ajax({
            type:"POST",
            url:"<%=basePath%>/xiels/edit.xhtml",
            data:data,
            success:function (msg) {
                if("success"==msg){
                    $.messager.alert("信息提示","信息修改成功","info",function () {
                        parent.rightFrame.$("#tt").datagrid("reload");
                        window.parent.closeWin("信息修改");
                    });
                }else {
                    $.messager.alert("信息提示","信息修改失败,请重试","info",function () {
                    });
                }

            }
        })
    }
</script>
