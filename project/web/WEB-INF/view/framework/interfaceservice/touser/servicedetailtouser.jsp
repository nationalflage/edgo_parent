<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%
	String srvid=(String)request.getAttribute("srvid");
	String srvtype=(String)request.getAttribute("srvtype");
	String userid=(String)request.getAttribute("userid");
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
				JSONObject finjson=(JSONObject)request.getAttribute("finjson");
				JSONObject ser=(JSONObject)finjson.get("service");
				String servicename="";
				String interfacedesc="";
				if(ser.get("servicename")!=null){
					servicename=(String)ser.get("servicename");
				}else{
					
				}
				if(ser.get("interfacedesc").equals("")){
					
				}else{
					interfacedesc=(String)ser.get("interfacedesc");
				}
				 

				out.print("<tr> <th width='15%'>服务名称"
						+":</th>"
						+"<td width='20%'>"+servicename
						+"</td><th width='15%'></th><td width='20%'></td><th width='15%'></th><td width='15%'></td></tr>".replaceAll("\r","").replaceAll("\n",""));
				out.print("<tr> <th>接口信息描述"
						+":</th>"
						+"<td width=''>"+interfacedesc
						+"</td></tr>".replaceAll("\r","").replaceAll("\n",""));	
				
				
				
				JSONArray array=(JSONArray)finjson.get("servicecondition");
				for(int i=0;i<array.size();i++){
					JSONObject obj=(JSONObject)array.get(i);
					String required=(String)obj.get("required");
					String name=(String)obj.get("parametername");
					String paratype=(String)obj.get("paratype");
					String parameter_means="";
					if(obj.get("parameter_means").equals("")){
					 
					}else{
						parameter_means=(String)obj.get("parameter_means");
					}
					
					
					if(required.equals("否")){
					out.print("<tr> <th >"+name
							+":</th>"
							+"<td ><input class='easyui-textbox' type='text' width='20%' align='center'  name='"+name
							+"'"+"/></td> <th >参数类型："+paratype
							+"<th >参数含义："+parameter_means
							+"</tr>".replaceAll("\r","").replaceAll("\n",""));
						}else if(required.equals("是")){
								out.print("<tr> <th >"+name
								+":</th>"
								+"<td ><input data-options='required:true' class='easyui-textbox' type='text' width='20%' align='center'  name='"+name
								+"'"+"/></td><th >参数类型："+paratype
								+"<th >参数含义："+parameter_means
								+"</tr>".replaceAll("\r","").replaceAll("\n",""));
					
				}
				
				}%>
				
		
					
		</table >
		<table id="showresult" class="table-query">
			<tr>
				<th width="200">预览json串结果：</th>

				<td colspan="3" >
				<p id="p1"></p>
				</td>
			</tr>
			<tr>
				<th>请求url地址：</th>
				<td colspan="3">
				<p id="p2"></p>
				</td>
			</tr>
		</table>

		<table class="table-query">

			<tr>
			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn btn-info"
						value="预    览" onclick="doresultview1()" /> </td>
				</tr>
			</tfoot>
			
		</table>
	</form>
</body>
</html>

<script type="text/javascript">
	
	
	function doresultview1(){
		if(!$("#form1").form('validate')){
			return;
		}
		var type='<%=srvtype%>';
		var temp='<%=srvid%>';
		var temp2='<%=userid%>';
		var temp3='<%=userlogname%>';
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
			
			
			<%Date date = new Date();
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
								$("#p2").text(urlview);
							//开始
							$.ajax({
			   				url: urlview,
			   				data:data,
			   				cache:false,
			   				success : function(msg) {
							if (msg!=null) {
								$("#p1").text(msg);								
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
</script>
