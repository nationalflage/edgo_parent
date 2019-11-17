<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String t=(String)request.getAttribute("srvid");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
</head>

<body>
	<form id="form1" class="query-list" method="post" action="">
		<table class="table-query">
			<tr>
				<th width="20%">参数名称</th>
				<td>${model.parameter}</td>
				
				<th width="20%">参数类型</th>
				<td width="30%">
				<input type="radio" disabled="disabled" name="type" id="type1" <c:if test="${model.type  eq '1'}">checked="checked"</c:if> value="1"/> 字符串
				<input type="radio" disabled="disabled" name="type" id="type0" <c:if test="${model.type  eq '0'}">checked="checked"</c:if> value="0"/> 整型
				</td>
				
				<%-- <td><input value="<c:out value="${model.type }"/>" type="text"  id="type"
					name="type" size="40" class="easyui-textbox"
					validType="length[0,10]" /></td> --%>
			</tr>
			<tr>
				<th>字段内容</th>
				<td width="30%">${model.field_content }
				</td>
				
				<th>参数是否必须</th>
				<td width="30%">
				<input type="radio" name="required" disabled="disabled" id="yes" <c:if test="${model.required  eq '1'}">checked="checked"</c:if> value="1"/> 是
				<input type="radio" name="required"disabled="disabled" id="no" <c:if test="${model.required  eq '0'}">checked="checked"</c:if> value="0"/> 否
				</td>




			</tr>



			<tr>
				<th>参数含义说明</th>

				<td colspan="3">${model.parameter_means }
				</td>

				
			</tr>
			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn btn-info"
						value="关　闭" onclick="window.parent.closeWin('信息详细')" /></td>
				</tr>
			</tfoot>
		</table>



		<input type="hidden" id="id" name="id" value="<c:out value="${model.id }"/>"/>
		<input type="hidden" id="srvid" name="srvid" value="<c:out value="${model.srvid }"/>"/>
	</form>
</body>
</html>

<script type="text/javascript">

	function deltr(tr){
		$(tr).parent().parent().remove(); 
	}

	function addCondition() {

	//	alert("1");
		var num = $('#conditionConfigNum').val();
		var numtemp = parseInt($('#conditionConfigNum').val(),10) + 1;
		$('#conditionConfigNum').val(numtemp);
		
		
		var tr = $("#temptr").clone();   
		
		
		tr.attr('style','display:"";');
		tr.attr('id','temptr'+numtemp);
		
		tr.html(tr.html().replace(/\[\d+\]/g,'['+numtemp+']'));
		
		/* for (var j = 0; j < 6; j++){
			tr.eq(j).find("input").id="";   
			tr.eq(j).find("input").name="";  
		} */
		
		
		tr.appendTo("#tt1");  
	//	alert("11");
		
		/* var tr = document.createElement("tr");
		for (var j = 0; j < 6; j++) {
			var td = document.createElement("td"); //新建一个td类型的Element节点
			// innerHTML='<input type="text" id="reName" value="'+"myText"
			// td.innerHTML = '<input type="text" id="reName"/>';

			var input = document.createElement("input ");
			input.type = "text";
			input.id = "reName";
			input.value = myText;
			td.appendChild(input);

			tr.appendChild(td); //将节点td加入tr中 
		}

		$('#tt1').appendChild(tr); //将节点tr加入tbody中

		//$('#tt1').*/
	}

	$(document).ready(function() {
		$.ajax({
		url : '<%=basePath%>selectServlet?codetable=interface_srv_type',
		datatype:"json",
		
		success:function(res)
		{
			$("#srvtype").combobox({
				editable:false,
				valueField:'code',
			    textField:'name' ,
			    panelHeight:'auto',
			    data:JSON.parse(res).result
			});
		},
		error:function(res)
		{
			//$.hyjx.alert("提示信息",res.responseText,"info", function(){});
		}
	});
});
	
	

	function save(){
		
		if(!$("#form1").form('validate')){
			return;
		}
		
		//var srvid='<%=t %>';
		var data = $("#form1").serialize();
		alert(data);
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doEditCondition.xhtml",
		   	data:data,
		   	success : function(msg) {
				if ("success" == msg) {
					$.hyjx.alert("提示信息", "信息修改成功！", "info", function() {
						parent.$('#tt').datagrid("reload");
						//alert("eee");
						window.parent.closeWin('参数信息修改');
					});
				} else {
					$.hyjx.alert("提示信息", "信息添加失败，请重试！", "error",
							function() {
							});
				}
			}
		});
		
		//window.parent.parent.closeWin('参数条件添加');
	}
</script>