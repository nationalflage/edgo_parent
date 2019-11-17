<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<<script type="text/javascript">
function refreshMsgCount()
{
	   var url='<%=basePath %>message/refreshMsgCount.xhtml';
	   $.ajax({
			type: "POST",
		   	url: url,
		   	success: function(msg){
		   		try{
		   			msg = parseInt(msg);
		   		}catch(e)
		   		{
		   			msg = 0;
		   		}
		   		$("#msgcount").html(msg);
		   }
		});
}
</script>>