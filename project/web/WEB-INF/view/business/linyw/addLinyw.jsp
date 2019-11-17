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
                <input type="text" id="age" name="age" class="easyui-textbox"   data-options="required:true,validType:'areacode'" value="${model.age}" style="width: 180px" />

            </td>
            <th>出生年月</th>
            <td>

                <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                       class="easyui-datebox" required="true" data-options="" style="width:180px;"/>

            </td>
        </tr>
        <tr>
            <th>出生省</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="district" name="csdsheng" id="province" style="width: 180px;"></select>
            </td>
            <th>出生市</th>
            <td>
                <select  class="easyui-combobox hy-codeselect" name="csdshi" codetable="district" parentobject="province" id="city" style="width: 180px;"  ></select>
            </td>
        </tr>
        <tr>
            <th>出生县</th>
            <td>
                <select class="easyui-combobox hy-codeselect" name="csdxian" codetable="district" parentobject="city" id="area" style="width: 180px;" ></select>
            </td>
            <th>具体门牌号</th>
            <td>
                <input type="text" name="csdjtmph" id="csdjtmph" value="${model.csdjtmph }"
                       class="easyui-textbox"  data-options="validType:length[0,50]"/>
            </td>
        </tr>
        <tr>
            <th>部门名称</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="lyw_bm" name="bmmc" id="bmmc" style="width: 180px;"></select>
            </td>
            <th>是否有效</th>
            <td>
                <span id="sfyx" class="hy-radio"  options="有效:Y;无效:N" checkoptions="${model.sfyx}" name="sfyx"></span>
            </td>


        </tr>

        <tr>
            <th>领域</th>
            <td>
                <c:forEach items="${lyw_ly}" var="ly">
                    <input name="lyw_ly" type="checkbox"  id="ly${ly.code}" value="<c:out value='${ly.code}'/>"/>
                    <c:out value='${ly.name}'/>
                </c:forEach>
            </td>
            <th>爱好</th>
            <td>
                <c:forEach items="${ahList}" var="lyw">
                    <input name="lyw_ah" type="checkbox"  id="ah${lyw.code}" value="<c:out value='${lyw.code}'/>"/>
                    <c:out value='${lyw.name}'/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>最擅长领域</th>
            <td>
                <select class="easyui-combobox hy-codeselect" codetable="lyw_ly" name="zscly" id="zscly" style="width: 180px;"></select>
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


    });

    function save(){
        if(!$("#form1").form('validate')){
            return;
        }
        var data = $("#form1").serialize();
        alert(data)
        $.ajax({
            type:"POST",
            url:"<%=basePath%>linyw/doAdd.xhtml",
            data:data,
            success:function(msg){
                if("success"==msg){
                    $.messager.alert("提示信息","信息添加成功","info",function(){
                        parent.rightFrame.$('#tt').datagrid("reload");
                        window.parent.closeWin('信息添加');
                    });
                }else{
                    $.messager.alert("提示信息","信息添加失败，请重试！","error", function(){});
                }
            }
        });
    }
</script>
