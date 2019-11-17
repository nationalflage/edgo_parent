<%@page import="com.hyjx.framework.component.customquery.ListConfig"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>信息详细</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>
<body>
	<table  class="table-list">
			
		<%
		Map<String,String> map = (Map<String,String>)request.getAttribute("map");
		List<ListConfig> listconfig = (List<ListConfig>)request.getAttribute("listconfig");
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext())
		{
			String key = iter.next();
			out.print("<tr>");
			for(ListConfig lc: listconfig)
			{
				if(lc.getColumnName().equals(key))
				{
					Object value = map.get(key);
					if(value==null)value = "";
					if(lc.getTitleName()!=null && lc.getTitleName().trim().length()>0)
					{
						out.print("<th>");
						out.print(lc.getTitleName());
						out.print("</th>");
						out.print("<td>");
						out.print(String.valueOf(value));
						out.print("</td>");
					}					
				}
			}
			out.print("</tr>");
		
		}
		%>
		
		<tr>
			<td colspan="4" style="text-align:center" valign="bottom">
			 <div class="buttons">
                      <button class="btn"  onclick="window.parent.closeWin('信息详细');">关 闭</button>
                    </div>
			</td>
		</tr>
	</table>
</body>
</html>