<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
						<input type="text" name="age" id="age" value="${model.age }" data-options="validType:'number'"
							   class="easyui-textbox"  data-options="validType:length[0,50]"/>
					</td>
                <th>生日</th>
            <td>
                <input type="text" name="birthday" id="birthday" value="${model.birthday }"
                       class="easyui-datebox" editable="false" required="true" data-options="" style="width:180px;"/>
            </td>
			</tr>
            <tr>
                <th>出生地省</th>
                <td>
                <select class="easyui-combobox hy-codeselect" value="${model.csdsheng }" codetable="district" name="csdsheng" id="province" style="width: 180px;"></select>
		</td>
                <th>出生地市</th>
                <td>
					<select class="easyui-combobox hy-codeselect" name="csdshi" codetable="district" parentobject="province" id="city" style="width: 180px;"  ></select>
				</td>
			</tr>
            <tr>
                <th>出生地县</th>
                <td>
					<select class="easyui-combobox hy-codeselect" name="csdxian" codetable="district" parentobject="city" id="area" style="width: 180px;" ></select>
				</td>
                <th>门牌号</th>
                <td>
						<input type="text" name="csdjdmph" id="csdjdmph" value="${model.csdjdmph }"
							   class="easyui-textbox"  data-options="validType:length[0,50]"/>
					</td>
			</tr>
            <tr>
                <th>部门名称</th>
                <td>
                <input id="tagId8" class="easyui-combotree" data-options="customtree:true,customtype:'4',codetablepara:'gsbm-gszbm'" name="bmmc"/>

					</td>
                <th>爱好</th>
                <td>
					<c:forEach items="${ahList}" var="wd">
						<input name="ah" type="checkbox"  id="ah${wd.code}" value="<c:out value='${wd.code}'/>"	/>
						<c:out value='${wd.name}'/>
					</c:forEach>
			</tr>
            <tr>
                <th>有效</th>
                <td>
				 <span id="sfyx" class="hy-radio"  options="有效:1;无效:0" checkoptions="1" name="sfyx" c></span>
					</td>
                <th>创建人姓名</th>
                <td>
						<input type="text" name="cjrxm" id="cjrxm" value="${model.cjrxm }"
							   class="easyui-textbox"  data-options="validType:length[0,50]" readonly="readonly"/>
					</td>
			</tr>
            <tr>
                <th>创建人部门名称</th>
                <td>
						<input type="text" name="cjrbmmc" id="cjrbmmc" value="${model.cjrbmmc }"
							   class="easyui-textbox"  data-options="validType:length[0,50]" readonly="readonly"/>
					</td>
                <th>擅长领域</th>
                <td>
					<c:forEach items="${sclyList}" var="wd">
						<input name="scly" type="checkbox"  id="scly${wd.code}" value="<c:out value='${wd.code}'/>"/>
						<c:out value='${wd.name}'/>
					</c:forEach>
					</td>
			</tr>
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
	
	
    $(function () {
        $('#age').numberbox('textbox').attr('maxlength', 3);
    });

	function save(){
		if(!$("#form1").form('validate')){
			return;
		}
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>guox/doAdd.xhtml",
		   	data: data,
		   	success: function(msg){
		    	if("success" == msg){
					$.messager.alert("提示信息","信息添加成功！","info", function(){
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