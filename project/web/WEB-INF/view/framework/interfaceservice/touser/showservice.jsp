<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="com.hyjx.framework.component.interfaceservice.datauserservice.*" %>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%
	List list=(ArrayList)request.getAttribute("list");
	
	String userid=(String)request.getAttribute("userid");
	String para=(String)request.getAttribute("para");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN">
<!-- <!DOCTYPE html> -->
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
</head>
<body>

	 <div class="result-list">
        <h1 class="title">接口服务:</h1>
       
       <select name="" id="servicelist" onchange="select1()"  >
       		<option value="请选择" selected="selected">请选择</option>
 				<% for(int i=0;i<list.size();i++){
 					DataUserServiceModel temp=(DataUserServiceModel)list.get(i);
 				%>
  			<option value="<%=temp.getSrvid() %>">
  			<%=temp.getSrvname()%>
 			</option>
  			 <%  }   %>
       </select>
    </div>
    
    <iframe name="tableFrame" id="tableFrame"
		src="" frameborder="0"
		onload="this.height=tableFrame.document.body.scrollHeight;"
		allowtransparency="true" width="100%" style="border:1px solid red;">
	</iframe>
	<%-- <form id="form1" class="query-list" method="post" action=""
		data-options="novalidate:true">
		<table id="tt" class="table-query">
			
		
					
		</table >
		<table id="showresult" class="table-query">
			<tr>
				<th>预览json串结果：</th>

				<td colspan="3" id="view1">
				<p id="p1"></p>
				<!-- <input 
					id="viewres1"  class="easyui-textbox"
					data-options="multiline:true" style="width: 400px; height: 90px;" /> -->
				</td>

				<td>
				<input type="text" value="<c:out value="${model.interfacedesc }"/>" id="interfacedesc" name="interfacedesc" size="40" class="easyui-textbox" validType="length[0,1000]"/>
			</td>
			</tr>
			<tr>
				<th>请求url地址：</th>

				<td colspan="3" id="view2">
				<p id="p2"></p>
				<!-- <input type="test" 
					id="viewres2"  class="easyui-textbox"
					data-options="multiline:true" style="width: 400px; height: 50px;" /> -->
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
	</form> --%>
</body>
</html>

<script type="text/javascript">
	//document.getElementById('servicelist').attachEvent("onpropertychange","select1()");	
	function select1(){
		var id = $("#servicelist").val();
		var para1="<%=(para==null?"":para)%>";
		//para1 = encodeURI(para1);
		if(id=="请选择"){
			
		}else{
			$("#tableFrame").attr("src","<%=basePath %>userservice/doUserServiceDetail.xhtml?srvid="+id+"&para="+para1);
			//openWinW("<%=basePath %>userservice/doUserServiceDetail.xhtml?srvid="+id+"&para="+para1,"数据用户添加","800px","500px",false,false);
		}
		

	}
	
	
	<%-- function select(){
		//alert("1");
	//	$("#view1").append("");
	//	$("#view1").remove();
		$("#p1").text("");
		$("#p2").text("");
	//	$("#view2").innerHTML="";
		var s = $("#servicelist").val();
		//alert(s);
		$.ajax({
			url: "<%=basePath %>userservice/doUserServiceDetailOneJsp.xhtml?srvid="+s,
			cache:false,
			type:"POST",
			success: function(msg){
				if(msg!=null) {
					$("#tt").html(msg);
					
				}else {
					alert("返回数据失败！");
					}
			}
		});
		
		
	}

	function doresultview1() {
		//alert("1");
		if (!$("#form1").form('validate')) {
			return;
		}
		//	alert("1");
		var temp = $("#servicelist").val();
		var temp2='<%=userid%>';
		<%Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String currenttime = format.format(date);%>
		var time=<%=currenttime%>;
	//	alert(temp);
		var data = $("#form1").serialize();
		$.ajax({
			type: "POST",
		   	url: "<%=basePath %>dataservice/doViewService.xhtml?srvid="+temp,
		   	data:data,
		   	cache:false,
		   	success : function(msg) {
				if (msg!=null) {
					alert(msg);
					//在table里面显示返回的json串
					$.hyjx.alert("提示","操作成功！","info", function(){ });

					//document.getElementById("viewres").value="msg";
					//$("textarea")[0].value=msg;
					//$("#viewres1").val(msg);
					$("#p1").text(msg);
					//拼接url地址
					
					var urlview="<%=basePath %>iservice/g.xhtml?srvid="+temp+" &checkBit=  &pageNo=1&pageSize=5&"+data+"&userid="+temp2+"&timeStamp="+time;
					$("#p2").text(urlview);
					//alert(urlview);
					//$("textarea")[1].val(urlview);
					//$("#viewres2").val(urlview);
					//$("#view2").append(urlview);
				} else {
					
				}
			}
		});
		
		//document.getElementById("viewres").value="msg"
		
	}  --%>
</script>
