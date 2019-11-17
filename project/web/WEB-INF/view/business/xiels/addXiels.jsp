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
    <title>addXliels</title>
</head>
<body>
    <form id="form1">
        <table class="table-query" style="margin-top: 30px">
            <tbody>
                <tr>
                    <th>姓名</th>
                    <td>
                        <input type="text" name="name" required="true" id="name" value="${model.name }" class="easyui-textbox"/>
                    </td>
                    <th>性别</th>
                    <td>
                        <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="M" name="sex"></span>
                    </td>
                </tr>
                <tr>
                    <%--<th>年龄</th>
                    <td>
                        <input type="text" name="age" id="age" value="${model.age }" class="easyui-textbox"
                               style="width:95px;" data-options="validType:'number'"/>
                    </td>--%>
                    <th>出生年月</th>
                    <td>
                        <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                               class="easyui-datebox" required="true" data-options="" />
                    </td>
                    <th>出生省</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" required="true" codetable="district" name="csdsheng" id="province" style="width: 180px;">
                        </select>
                    </td>
                </tr>
                <tr>

                    <th>出生市</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" required="true" codetable="district" name="csdshi" parentobject="province" id="city" style="width: 180px;">
                        </select>
                    </td>
                    <th>出生县</th>
                    <td>
                        <select class="easyui-combobox hy-codeselect" codetable="district" name="csdxian" parentobject="city" id="erea" style="width: 180px;">
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
                        <input id="bm" class="easyui-combotree" required="true" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'" name="bmmc"/>
                    </td>
                </tr>
                <tr>
                    <th>有效</th>
                    <td>
                        <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="1" name="sfyx" c></span>
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

                    <th>创建人姓名</th>
                    <td>
                        <input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm }"
                               class="easyui-textbox" readonly="readonly"/>
                    </td>
                    <th>创建人部门名称</th>
                    <td>
                        <input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc }"
                               class="easyui-textbox" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <th>擅长领域</th>
                    <td>
                        <%--<select class="easyui-combobox">
                            <c:forEach items="${sclyList}" var="sc">
                                <option value="<c:out value='${sc.code}'/>"><c:out value='${sc.name}'/></option>
                            </c:forEach>
                        </select>--%>
                        <select class="easyui-combobox hy-codeselect" codetable="xiels_scly" name="scly" id="scly"  style="width: 180px;">
                        </select>
                        <%--<select class="easyui-combobox hy-codeselect" required="true" codetable="district" name="csdsheng" id="province" style="width: 180px;">
                        </select>--%>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr></tr>
                <tr>
                    <td colspan="6">
                        <input type="button" class="btn btn-info" value="添  加" onclick="doAdd()">
                        <input type="button" class="btn" value="取   消" onclick="window.parent.closeWin('信息添加')">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    function doAdd(){
        //验证表单form1是否有数据，无就返回
        if (!$("#form1").form('validate')) {
            return;
        }
        // 将表单中的数据序列化
        var data=$("#form1").serialize();
        // console.log(data);
        // debugger;
        $.ajax({
            type:"POST",
            url:"<%=basePath%>/xiels/add.xhtml",
            data:data,
            success: function (msg) {
                if ("success" == msg) {
                    $.messager.alert("信息提示", "信息添加成功！","info", function () {
                        parent.rightFrame.$('#tt').datagrid("reload");
                        window.parent.closeWin('信息添加');
                    });
                } else {
                    $.messager.alert("信息提示", "信息添加失败，请重试！","error", function () {
                    });
                }
            }
        });
    }
</script>
