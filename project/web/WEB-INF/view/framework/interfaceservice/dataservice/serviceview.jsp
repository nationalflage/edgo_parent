<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%
	List<String> parameterlist = (List<String>) request.getAttribute("parameterlist");
	List<String> parameterrequired = (List<String>) request.getAttribute("parameterrequired");
	String srvid=(String)request.getAttribute("srvid");
	String srvtype=(String)request.getAttribute("srvtype");
	String userlogname=(String)request.getAttribute("userlogname");
	String para=(String)request.getAttribute("para");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<form id="form1" class="query-list" method="post" action=""
		data-options="novalidate:true">
		<table id="tt" class="table-query">
			<%
			for(int i=0;i<parameterlist.size();i++){
				String name=parameterlist.get(i);
				String required=parameterrequired.get(i);
				if(required.equals("0")){
				out.print("<tr> <th width='15%'>"+name
						+":</th>"
						+"<td width='30%'><input class='easyui-textbox' type='text' width='20%' align='center'  name='"+name
						+"'"+"/></td></tr>".replaceAll("\r","").replaceAll("\n",""));
					}else if(required.equals("1")){
						out.print("<tr> <th width='15%'>"+name
								+":</th>"
								+"<td width='30%'><input data-options='required:true' class='easyui-textbox' type='text' width='20%' align='center'  name='"+name
								+"'"+"/></td></tr>".replaceAll("\r","").replaceAll("\n",""));
					}
				}%>
				
		
					
		</table >
		</form>
		<form id="form2">
		<table id="showresult" class="table-query">
		<tr>
				<th width='150px'>用户名：</th>
         <td colspan="3">
				<input class="easyui-textbox" type="text" name="userid" id="userid" />
			</td>
				
			</tr>
			<tr>
				<th width='150px'>预览json串结果：</th>

				<td colspan="3" id="view1">
				<p id="p11"></p>
				<!-- <input 
					id="viewres1"  class="easyui-textbox"
					data-options="multiline:true" style="width: 400px; height: 90px;" /> -->
				</td>
			</tr>
			
			<tr>
				<th>请求url地址：</th>

				<td colspan="3" id="view2">
				<p id="p22"></p>
				<!-- <input type="test" 
					id="viewres"  class="easyui-textbox"
					data-options="multiline:true" style="width: 400px; height: 50px;" /> -->
				</td>

			
			</tr>
		</table>
</form>
		<table class="table-query">

			<tr>
			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn btn-info"
						value="预    览" onclick="doresultview1();" /> <input type="button" class="btn"
						value="关　闭" onclick="window.parent.closeWin('信息详细')" /></td>
				</tr>
			</tfoot>
			
		</table>
	
</body>
</html>

<script type="text/javascript">
	function doresultview1(){
		if(!$("#form1").form('validate')){
			return;
		}
		var type="01";
		var temp='<%=srvid%>';
		var temp2=$("#userid").combobox('getValue'); ;
		var temp3=$("#userid").combobox('getText')
		var para1="<%=para%>";
		var time;
		if(type=="01"){
			$.ajax({
			   	url: "<%=basePath %>dataservice/getCurrentTime.xhtml",
			   		data:data,
			   		cache:false,
			   		success : function(msg) {
							if (msg!=null) {
								time=msg;
							} else {
								time="111";
								}
						}
					});
			
			
			<%
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String currenttime = format.format(date);%>
			var data = $("#form1").serialize();
			
			$.ajax({
				type: "POST",
			   	url: "<%=basePath %>dataservice/doViewService.xhtml?srvid="+temp+"&para="+para1,
			   	data:data,
			   	cache:false,
			   	success : function(msg) {
					if (msg!=null) {
				
						//在table里面显示返回的json串
						//$.hyjx.alert("提示","操作成功！","info", function(){ });
						//document.getElementById("viewres").value="msg";
						//$("textarea")[0].innerText=msg;
						//$("#p1").text(msg);
						//计算checkbit位
						$.ajax({
			   				url: "<%=basePath %>dataservice/getCheckBit.xhtml?srvid="+temp+"&userid="+temp2+"&timeStamp="+time+"&userlogname="+temp3,
			   				data:data,
			   				cache:false,
			   				success : function(msg) {
							if (msg!=null) {
								var urlview="<%=basePath %>iservice/g.xhtml?srvid="+temp+"&pageNo=1&pageSize=5&timeStamp="+time+"&checkBit="+msg+"&"+data+"&userlogname="+temp3;
								$("#p22").text(urlview);
							//开始
							$.ajax({
			   				url: urlview,
			   				data:data,
			   				cache:false,
			   				success : function(msg) {
							if (msg!=null) {
								$("#p11").text(msg);								
							} else {
							
								}
						}
					});
					//结束			
								
								
								
							} else {
							
								}
						}
					});
						
						
						//拼接url地址
						
						
						//alert(urlview);
						//$("textarea")[1].innerText=urlview;
						
					} else {
						
					}
				}
			});
			
		}else if(type=="03"){
			$.ajax({
				type: "POST",
			   	url: "<%=basePath %>dataservice/.xhtml?srvid="+temp,
			   	data:data,
			   	cache:false,
			   	success : function(msg) {
					if (msg!=null) {
						
					} else {
						
					}
				}
			});
		}
		
		//document.getElementById("viewres").value="msg"
		
	} 
	
	
	function doresultview(){

		if(!$("#form1").form('validate')){
			return;
		}
		
		var temp='<%=srvid%>';
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doViewService.xhtml?srvid="+temp,
		   	data:data,
		   	success : function(msg) {
				if (msg!=null) {
					//在table里面显示返回的json串
					$.hyjx.alert("提示","操作成功！","info", function(){ });

					//document.getElementById("viewres").value="msg";
					//$("textarea")[0].innerText=msg;
					//$("#viewres").value=msg;
					
					$("#p11").text(msg);
					//拼接url地址
					
					var urlview="<%=basePath %>iservice/g.xhtml?srvid="+temp+"&userid= &checkBit= &timeStamp= &pageNo=1&pageSize=5&"+data;
					//alert(urlview);
					//$("textarea")[1].innerText=urlview;
					$("#p22").text(urlview);
				} else {
					
				}
			}
		});
		
		//document.getElementById("viewres").value="msg"
		
	} 



	function dofind() {
		alert("11");
		alert('<%=parameterlist.size()%>');
		
		var hh="<%
			for(int i=0;i<parameterlist.size();i++){
				String name=parameterlist.get(i);
				out.print("<tr> <th width='15%'>"+name
						+":</th>"
						+"<td width='30%'><input class='easyui-textbox' type='text' width='20%' align='center'  name='"+name
						+"'"+"/></td></tr>".replaceAll("\r","").replaceAll("\n",""));}%>";
		
		$('#tt').html(hh);
	}
	
	$(function() {
		//dofind();
		$("#userid").combobox({
			url:'<%=basePath %>interfacelog/queryuserList.xhtml',
			editable:false,
			valueField:'userid',
		    textField:'userlogname',
		    panelHeight:'auto'
		}); 
	});
</script>
