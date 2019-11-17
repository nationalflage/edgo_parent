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
                         <span id="sex" class="hy-radio"  options="男:M;女:F" checkoptions="${model.sex}" name="sex"></span>
					</td>
			</tr>
            <tr>
                <th>年龄</th>
                <td>
						<input type="text" name="age" id="age" value="${model.age }"
							   class="easyui-textbox"   data-options="validType:'number'" data-options="validType:length[0,50]"/>
					</td>
                <th>出生年月</th>
                <td>
						<input type="text" name="birthday" id="birthday" value="${model.birthday}"
							   class="easyui-datebox" required="true" data-options="" style="width:150px;"/>
					</td>
			</tr>
            <tr>
                <!--  <th>出生地</th>
                <td>
						<input type="text" name="csdsheng" id="csdsheng" value="${model.csdsheng }"
							   class="easyui-textbox"  data-options="validType:length[0,50]"/>
					</td>
                <th>市</th>
                <td>
					</td>
			</tr>-->
            <tr>
                <!-- <th>县</th>
                <td>
					</td> -->

                <%--c出生地直接3个码表--%>
					<th>出生地</th>
                        <td colspan="3">
                            <select class="easyui-combobox hy-codeselect" codetable="district" name="csdsheng" id="csdsheng" value="${model.csdsheng}" style="width: 140px;" ></select>
                            <select class="easyui-combobox hy-codeselect" codetable="district" parentobject="csdsheng" name="csdshi" id="csdshi" value="${model.csdshi}" style="width: 140px;" ></select>
                            <select class="easyui-combobox hy-codeselect"  codetable="district" parentobject="csdshi" name="csdxian" id="csdxian" value="${model.csdxian}" style="width: 140px;" ></select>
                        </td>
                
			</tr>
			<tr>
			<th>具体门牌号</th>
                <td>
						<input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph}"
							   class="easyui-textbox"  data-options="validType:length[0,50]" style="width:100%"/>
					</td>
			</tr>
                        
                    
            <tr>
                <th>部门名称</th>
                  <td>
                    <%--<select  class="easyui-combotree hy-codeselect" id="cc" value="${list.bmmc}" style="width:200px;"   codetable="bmcj" parentobject="bmmc"></select>
                    <a href="#" id="btn" class="easyui-linkbutton" onclick="getValue()">getValue</a>
					</td>--%>
                        <input id="tagId8"  name ="bmmc"class="easyui-combotree"  data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'"/>

                <th>爱好</th>
                <td>
                    <c:forEach items="${ahList}" var="wd">
                        <input name="ah" type="checkbox"  id="ah${wd.code}" value="<c:out value='${wd.code}'/>"	/>
                        <c:out value='${wd.name}'/>
                    </c:forEach>
                </td>
			</tr>name
            <tr>
                <th>是否有效</th>
                <td>
                        <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="${model.sfyx}" name="sfyx"></span>
					</td>
                <th>创建人姓名</th>
                <td>
						<input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm}"
							   class="easyui-textbox"  data-options="validType:length[0,50]"/>
					</td>
			</tr>
            <tr>
                <th>创建人部门名称</th>
                <td>
						<input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc}"
							   class="easyui-textbox"  data-options="validType:length[0,50]"/>
					</td>
        </tr>
	</tbody>
	<tfoot>
        <tr height="100">
            <td colspan="4">
                <input type="button" class="btn btn-info" value="保　存" onclick="save();"/>
                <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息添加')"/>
                
            </td>
        </tr>
    </tfoot>
	</table>
</form>
</body>
</html>

<script type="text/javascript">

    /*部门 下拉树的js*/

       $(function(){
           $('#cc').combotree({
               url: '<%=basePath %>/json.xhtml'

           });
       })
        function getValue() {
            var value = $('#cc').combotree('getValue');
        }




	$(function() {
        $.ajax({
            url: '<%=basePath%>selectServlet?codetable=district',
            datatype: "json",
            success: function (res) {
                $("#depart_funca").combobox({
                    editable: false,
                    valueField: 'code',
                    textField: 'name',
                    panelHeight: 'auto',
                    data: JSON.parse(res).result
                })
            },
            error: function (res) {
            }
        });
        $.ajax({
            url: '<%=basePath%>selectServlet?codetable=district',
            datatype: "json",
            success: function (res) {
                $("#depart_funca").combobox({
                    editable: false,
                    valueField: 'code',
                    textField: 'name',
                    panelHeight: 'auto',
                    data: JSON.parse(res).result
                })
            },
            error: function (res) {
            }
        });
    });


        function save() {

            if (!$("#form1").form('validate')) {
                return;
            }
            var data = $("#form1").serialize();
            $.ajax({
                type: "POST",
                url: "<%=basePath %>/doAdd.xhtml",
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