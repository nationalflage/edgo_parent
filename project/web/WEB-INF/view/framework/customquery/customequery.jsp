<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.hyjx.framework.component.customquery.*" %>
<%@ page import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//CustomQueryModel model = (CustomQueryModel)request.getAttribute("model");
	//Map<String,String> pageMap = (Map<String,String>)request.getAttribute("pageMap");
	
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title><c:out value="${model.query_name }"></c:out></title>
<script type="text/javascript">
$(function(){
	var msg = "${msg}";
	if(msg!="")
	{
		$.hyjx.alert("提示",msg,"info", function(){
			close();
		});
	}
	
})
function doQuery(){
	var data_attr = $("#form1").serialize();
	//var fa = $("#form1").formToArray();
	//console.log(fa);
	$('#tt').datagrid({
		url: '<%=basePath %>customquery/queryList.xhtml?query_id=<c:out value="${model.query_id }"></c:out>',
		queryParams: data_attr,
		rownumbers: true,
		pageNumber: 1,
		fitColumns:true,
		columns:[[
			<c:out value="${colhtml}" escapeXml="false"></c:out>
		]]
	});	
}
	function clearAll(){
 		$("#form1").form("reset");
 	}
$(document).ready(function(){
	doQuery();
});
function edit(id)
	{
		 openWinW('<%=basePath %>customquery/gotoEdit.xhtml?query_id='+id,"信息修改","1000px","600px",false,false);
	}
	function del(id)
	{
		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
		if(result == true){
			$.ajax({
			   	url: "<%=basePath %>customquery/gotoDelete.xhtml?ids="+id,
			   	success: function(msg){
			   		if("success" == msg) {
			   			$('#tt').datagrid("reload");
			   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
			   		}else {
			   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
			   		}
			   	}
			}); 
		}
		});
	}
	function view(id)
	{
		openWinW("<%=basePath%>customquery/customqueryview.xhtml?query_id=${model.query_id}&recid="+id,"信息详细","1000px","600px",false,false);
	}
</script>
</head>
<body>
<div class="content">
	<h1 class="public-title"><c:out value="${model.query_name }"></c:out></h1>
    <form id="form1" class="query-list" name="form1"  method="post" action="" data-options="novalidate:true">
    	
    	
        <c:if test="${model.query_type=='query' }">
        <!-- query table -->
        <table class="table-query">
        <tbody id="tbd">${tbodyhtml }</tbody>
            <tfoot>
				<tr>
					<td colspan="6" id="tbdbtn">
						<button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
						<button class="btn" onclick="clearAll();" type="button">清 空</button>
					</td>
				</tr>
             </tfoot>
        </table>
        </c:if>

<c:if test="${model.query_type =='advance' }">
		<table>
		<tr>
		<td valign="top">
        <table id="table1" class="table-query" style="width:1000px;border-width:1px;border-style: solid;border-color: lightgray;">
        <tbody>
		<tr>
			<td colspan="7">
				添加条件：
				<select id="sel1">
					<option>----请选择列----</option>
					<c:forEach items="${model.pageConfig.conditionConfigList}" var="c" varStatus="s">
						<option value="${c.columnName }">${c.description }</option>
					</c:forEach>
				</select>
				<input type="button" class="btn btn-info btn-sm" value="添加" onclick="addcond()"/>
				&nbsp; | &nbsp;
				<input type="hidden"	 name="query_type" value='<c:out value="${model.query_type }"></c:out>'/>
				添加括号：
				<select id="sel2"  style="width: 100px;text-align: center;">
	        	<option value="zkh">(</option>
	        	<option value="ykhx">)</option>
        		</select>
				<input type="button" class="btn btn-info btn-sm" value="添加" onclick="addlogic()"/>
				提示：添加括号请先选择某一行。
			</td>
		</tr>
        <tr id="tr1" colname="" style="display: none;" onclick="selrow(this);">
        <td style="width: 20px;"></td><!-- 括号位置 -->
        <td id="td0" style="width: 100px;">部门编号</td>
        <td id="td1" style="width: 100px;">
        <select id="sel1"  style="width: 100px;text-align: center;">
        	<option value="eq">等于</option>
        	<option value="neq">不等于</option>
        	<option value="like">包含</option>
        	<option value="gt">大于</option>
        	<option value="lt">小于</option>
        	<option value="gte">大于或等于</option>
        	<option value="lte">小于或等于</option>
        </select>
        </td>
        <td id="td2" style="width: 200px;text-align: center;">
        <input type="text" value="1234532">
        </td>
        <td id="td3" style="width: 100px;text-align: center;">
        <select id="sel2" style="width: 80px;text-align: center;margin-left: 5px;">
        <option value="and">并且</option>
        <option value="or">或者</option>
        </select>
        </td>
        <td></td><!-- 右括号 -->
        <td  align="center"><a href="javascript:void(0)" onclick="deltr(this);">删除</a></td>
        </tr>
<!--         <tr id="tr2" style="display: none"> -->
<!--         <td colspan="4"></td> -->
<!--         <td align="center"><a href="javascript:void(0)" onclick="deltr(this);">删除</a></td> -->
<!--         </tr> -->
          </tbody>
          <tfoot>
            <tr>
                <td colspan="6" >
                    <button class="btn btn-info" type="button" onclick="doQuery()">查 询</button>
                    <button class="btn" onclick="clearAll();" type="button">清 空</button>
                    | 
                    <button class="btn btn-info " onclick="savecurquery();" type="button">保存查询为模板</button>
                    <select id="tpl" prompt="请选择模板" class="easyui-combobox" editable="false" data-options="valueField: 'id',textField: 'tpl_name'">
                    </select>
                    <a style="color: blue;margin-left: 20px;cursor:pointer;" onclick="deltpl();">删除模板</a>
                </td>
                <td></td>
            </tr>
         </tfoot>
        </table>
        </td>
		<td valign="top" style="display: none;">
        <table id="table2" class="table-query" style="width:400px;border-width:1px;border-style: solid;border-color: lightgray;margin-left: 20px;float: right;vertical-align: top: ;">
        <tbody>
        <tr style="border-bottom-style: solid;border-bottom-color: lightgray;border-bottom-width: 1px;">
        <td style="height: 20px;">
        <h3>查询模板</h3>
        </td>
        </tr>
        <tr>
        <td>
       
        <ul style="margin: 10px;">
        	<li><a href="javascript:void(0)">用户高级查询1</a><a style="color: blue;margin-left: 20px;">删除</a></li>
        	<li><a href="javascript:void(0)">用户高级查询2</a><a style="color: blue;margin-left: 20px;">删除</a></li>
        	<li><a href="javascript:void(0)">用户高级查询3</a><a style="color: blue;margin-left: 20px;">删除</a></li>
        	<li><a href="javascript:void(0)">用户高级查询4</a><a style="color: blue;margin-left: 20px;">删除</a></li>
        	<li><a href="javascript:void(0)">用户高级查询5</a><a style="color: blue;margin-left: 20px;">删除</a></li>
        	<br>
        </ul>
        
        </td>
        </tr>
        </tbody>
        
        </table>
        </td>
		</tr>
		</table>
        </c:if>
        
    	</form>
        <div class="result-list">
        <h1 class="title">查询列表</h1>
        <div id="tb" class="operate">
        </div>
		<table id="tt" class="easyui-datagrid" style="width: 100%">
		
			
		</table>
    </div>
</div>

</body>
</html>
<script>
	var scount=0;
	function addcond()
	{
		if($("#sel1").val()=="----请选择列----"|| $("#sel1").val()==null)return;
		var tr1 = $("#tr1").clone();
		tr1.attr("style","display:'';");
		if($("#sel1 option:selected").length==1)
			tr1.children(0)[1].innerText = $("#sel1 option:selected").text();
		else
		{
			tr1.children(0)[1].innerText = $("#sel1 option:selected")[0].innerText;
		}
		var cname = $("#sel1 option:selected").val();
		$(tr1).attr("colname",cname);
		tr1.children(0)[2].children[0].name = "sel1_"+cname+"@"+scount;
		//tr1.children(0)[2].children[0].id = "sel1_"+cname+"@"+scount;
		tr1.children(0)[3].innerHTML = "<input type=text class='text' style='width:100%' name="+cname+"@"+scount+" id="+cname+"@"+scount+">"
		tr1.children(0)[4].children[0].name = "sel2_"+cname+"@"+scount;
		tr1.appendTo("#table1");
		scount++;
	}
	function deltr(tr)
	{
		$(tr).parent().parent().remove();
	}
	function addlogic()
	{
// 		var tr2 = $("#tr2").clone();
// 		tr2.attr('style','display:"";');
// 		tr2.children(0)[0].innerText =  $("#sel2 option:selected").text();
// 		tr2.appendTo("#table1");
		$("#table1 tr").each(function(i){
			if($(this).css("background-color")!="rgb(255, 255, 255)" && $(this).css("background-color")!="white")
			{
				if($("#sel2 option:selected").text()[0]=="(")
				{
					var h = "(&nbsp;&nbsp;<img src='<%=basePath %>/images/close_r.png' onclick='delkh(this)' title=删除括号 style='cursor:pointer;'></img>";
					h+="<input type='hidden'  name='kh_"+$(this).attr("colname")+"@"+(i-2)+"' value='l'/>";
					this.cells[0].innerHTML =h;
				}
				if($("#sel2 option:selected").text()[0]==")")
				{
					var h =")&nbsp;&nbsp;<img src='<%=basePath %>/images/close_r.png' onclick='delkh(this)' title=删除括号 style='cursor:pointer;'></img>";
					h+="<input type='hidden' name='kh_"+$(this).attr("colname")+"@"+(i-2)+"' value='r'/>";
					this.cells[5].innerHTML =h;
				}
			}
		});
	}
	if($("#tbd").html()!=null && $("#tbd").html().length<10)
	{
		$("#tbdbtn").css("display","none");
	}
	function savecurquery()
	{
		var setvalsc="";
		$("input[type='text']").each(function(i){
			if($(this).attr("id")!=undefined)
				setvalsc+="document.getElementById('"+$(this).attr("id")+"').value='"+$(this).val()+"';";
		});
		var trhtml = "";
		$("#table1 tr").each(function(i){
			if($(this).attr("colname")!=undefined &&$(this).attr("colname")!="")
			{
				trhtml+=$(this).prop("outerHTML");
			}
		});
		if(trhtml=="") return;
		trhtml=trhtml+"@@"+setvalsc;
		trhtml = encodeURIComponent(trhtml);
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>customquery/saveTpl.xhtml",
		   	data: "query_id=${model.query_id}&tplhtml="+trhtml,
		   	success: function(msg){

		   		openWinCallback(baseUrl+'customquery/gotoAddTpl.xhtml?id='+msg, '输入模板名称', '300px', '200px', true, false
						,function setValue(title,x){
		   			$.messager.alert("提示信息","保存成功！","info", function(){
						loadtpl();
		   			});
				});
				}
		});
	}
	function selrow(r)
	{
		$("tr").css("background-color","white");
		$(r).css("background-color","lightblue");
	}
	function delkh(o)
	{
		$(o).parent().html("")
		//$(o).prev().remove();
		//$(o).next().remove();
		//$(o).remove();
	}
	function seltpl(sel)
	{
		
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>customquery/getTplById.xhtml",
		   	data: "id="+$(sel).combobox("getValue"),
		   	success: function(msg){
		   		$("#table1 tr").eq(1).nextAll().remove(); 
				$("#table1").append(msg.split("@@")[0]);
				eval(msg.split("@@")[1]);
				doQuery();
			}
		});
	}
	function loadtpl()
	{
		$('#tpl').combobox('reload','<%=basePath %>customquery/getTplData.xhtml?query_id=<c:out value="${model.query_id }"></c:out>');
		$("#tpl").combobox("clear");
	}
	$(function(){
		$("#tpl").combobox({
			onSelect:function(){
				 seltpl(this);
			}
			
		});
		loadtpl();
	})
	function deltpl()
	{
 		$.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
			if(result == true){
				$.ajax({
					type: "POST",
				   	url: "<%=basePath %>customquery/delTpl.xhtml?id="+$("#tpl").combobox("getValue"),
				   	success: function(msg){
				   		if("success" == msg) {
				   			//loadtpl();
				   			location.href=location;
				   			$.hyjx.alert("提示","删除操作成功！","info", function(){ });
				   		}else {
				   			$.hyjx.alert("提示","删除失败，请重试！","info", function(){ });
				   		}
				   	}
				}); 
			}
 		});
	}
</script>