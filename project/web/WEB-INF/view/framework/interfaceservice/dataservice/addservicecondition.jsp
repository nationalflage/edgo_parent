<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String t=(String)request.getAttribute("srvid");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
				<th>参数名称</th>
				<td>
				<input type="text" id="parameter" name="parameter" data-options="required:true"
					size="40" class="easyui-textbox" validType="length[0,32]" />
				</td>
				<th>参数类型</th>
				<td width="30%">
				<input type="radio" name=type id="type1" value="1" checked="true" /> 字符串
				<input type="radio" name="type" id="type0" value="0"/> 整型
				</td>
				
				<!-- <td><input type="text"  id="type"
					name="type" size="40" class="easyui-textbox"
					validType="length[0,10]" /></td> -->
			</tr>
			<tr>
				<th>字段内容</th>
				<td width="30%"><input id="field_content" name="field_content" data-options="required:true"
					 class="easyui-textbox"
					validType="length[0,30]" />
				</td>
				
				<th>参数是否必须</th>
				<td width="30%">
				<input type="radio" name="required" id="yes" value="1" checked="true"/> 是
				<input type="radio" name="required" id="no" value="0"/> 否
				</td>




			</tr>



			<tr>
				<th>参数含义说明</th>

				<td colspan="3"><input 
					id="parameter_means" name="parameter_means" class="easyui-textbox"
					data-options="multiline:true" style="width: 495px; height: 90px;"validType="length[0,255]" />
				</td>

				
			</tr>

			


			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn btn-info"
						value="保　存" onclick="save();" /> <input type="button" class="btn"
						value="关　闭" onclick="window.parent.closeWin('参数条件添加')" /></td>
				</tr>
			</tfoot>
		</table>



		<input type="hidden" id="conditionConfigNum" value="0" />

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
		
		var srvid='<%=t %>';
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doAddCondition.xhtml?srvid="+srvid,
		   	data:data,
		   	success : function(msg) {
				if ("success" == msg) {
					$.hyjx.alert("提示信息", "信息添加成功！", "info", function() {
						parent.doQuery();
						//alert("111");
						window.parent.closeWin('参数条件添加');
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