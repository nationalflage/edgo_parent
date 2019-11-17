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
							+"<th >参数类型："+paratype
							+"</th><th >参数含义："+parameter_means
							+"</th></tr>".replaceAll("\r","").replaceAll("\n",""));
						}else if(required.equals("是")){
								out.print("<tr> <th >"+name
								+":</th>"
								+"<th >参数类型："+paratype
								+"</th><th >参数含义："+parameter_means
								+"</th></tr>".replaceAll("\r","").replaceAll("\n",""));
					
				}
				
				}%>
				
		
					
		</table >
		<table id="showresult" class="table-query">
			<tr>
				<th width="200">更新的参数数据：</th>

				<td colspan="3" >
					<input id="datajson"  name="datajson"  class="easyui-textbox"  data-options="multiline:true,required:true"  
                	style="width:600px;height:90px;" validType="length[0,1000]"/>
				</td>
			</tr>
			<tr>
				<th>返回结果：</th>
				<td colspan="3">
				<p id="p1"></p>
				</td>
			</tr>
		</table>

		<table class="table-query">

			<tr>
			<tfoot>
				<tr height="100">
					<td colspan="4"><input type="button" class="btn btn-info"
						value="更新  数据 " onclick="doresultview1()" /> </td>
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
		var time;
		if(type=="02"){
			
			$.ajax({
				type: "POST",
				async: false,
			   	url: "<%=basePath%>dataservice/getCurrentTime.xhtml",
			   	cache:false,
			   	success : function(msg) {
					if (msg!=null) {
						time=msg;
					} else {
						
					}
				}
			});
			
			
			
			var checkBit;
			$.ajax({
   				url: "<%=basePath%>dataservice/getCheckBit.xhtml?srvid="+temp+"&userid="+temp2+"&timeStamp="+time+"&userlogname="+temp3,
   				async: false,
   				cache:false,
   				success : function(msg) {
					if (msg!=null) {
						checkBit=msg;
					} 
				}
			});
			
		
			
			var data = $("#form1").serialize();
			var data1=$("#datajson").val();
			
			var datafin={'srvid':temp,'userid':temp2,'userlogname':temp3,'checkBit':checkBit,'timeStamp':time,'datajson':data1};
			$.ajax({
		 	 	   	url: "<%=basePath%>iservice/u.xhtml",
					type : "POST",
					async: false,
					data : datafin,
					success : function(msg) {
							if(msg!=null){
								//alert("1");
								$("#p1").text(msg);
								
							}
							
						}
			});
		}
	} 
</script>
