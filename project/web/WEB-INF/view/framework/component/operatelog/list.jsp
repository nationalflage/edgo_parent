<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="UTF-8">
    <title>信息列表</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<style type="text/css">
		th{
		white-space:nowrap;
	}
	td{
		white-space:nowrap;
	}
	</style>
  </head>
  <body>
  <div class="content">
        <!-- 左侧操作列表 begin -->
        <div class="operate-list">
            <h2 class="title">操作列表</h2>
      <ul>
		<c:forEach items="${oplist }" var="op" begin="0" end="10">
		  	<li id="operate_nav1" <c:if test="${op.ologid==param.oid}">class="active"</c:if>>
		    <a href='<%=basePath%>operatelog/gotoList.xhtml?oid=<c:out value="${op.ologid }"></c:out>'>
		    <img class="icon" src="<%=basePath%>images/operate-list1.png" alt="蓝色图标"/>
		  	<p class="name" title="${op.user_id }"><c:out value="${op.user_id }"></c:out></p>
		  	<p class="date"><c:out value="${op.timestamp }"></c:out></p>
		  	<p class="con" title="${op.url }"><c:out value="${op.url }"></c:out></p>
		  	</a>
		  	</li>
	  	</c:forEach>
      </ul>
</div>
<div class="operate-right">
		<h2 class="title">操作详情</h2>
		<c:forEach items="${opdlist }" var="opd" varStatus="l">
            <div id="operate_con1" style="display: block;">
                <!-- 操作详情 begin -->
                <div class="operate-detail">
                    <p class="name">操作<c:out value="${l.index+1 }"></c:out></p>
                    <p class="con" style="margin-bottom:8px;"><c:out value="${opd.sql }"></c:out></p>
                    <p class="date"><c:out value="${opd.timestamp }"></c:out></p>
                    <p class="con">消耗时间：<c:out value="${opd.spendtime }"></c:out>ms</p>
                    <p class="con">原始数据：</p>
                    <textarea <c:if test="${opd.origrec!=null && opd.lastrec!=null }">id="origrec"</c:if> rows="5" cols="80"><c:out value="${opd.origrec }"></c:out>	</textarea>
                    <p class="con">最新数据：</p>
                    <textarea <c:if test="${opd.origrec!=null && opd.lastrec!=null }">id="lastrec"</c:if> rows="5" cols="80"><c:out value="${opd.lastrec }"></c:out></textarea>
                     <p class="clear"/>
                </div>
               </div>
	</c:forEach>
  </div>
	 <p class="clear"/>
</div>
</body>
</html>
<script>
$(document).ready(function(){
	$("textarea").each(function(i){
		var p = $(this).text();
		if($.trim(p)=="") $(this).replaceWith("");
		if(p!="\n\t\n\t"){
			var json;
			try{
				json = JSON.parse(p);
			var id="";
			if($(this).attr("id")!= null)
				id="id="+$(this).attr("id");
			var t1="<table class=table-result "+id+" ><thead><tr>";
			var flag=0;
			var tr1="<tr>";
			for(var j in json)
			{
				if(flag>0)
				{
					t1+="<tr>";
				}
				for(var item in json[j])
				{
					if(flag==0)
					{
						if(item!="")
							t1+="<th class=center >"+item+"</th>";
						tr1+="<td align=center >"+json[j][item]+"</td>";
					}else
					{
						t1+="<td align=center >"+json[j][item]+"</td>";
					}
				}
				if(flag==0)
					t1+="</tr></thead>"+tr1+"</tr>";
				else
					t1+="</tr>";
				flag++;
			}
			$(this).replaceWith(t1);
			}catch(e)
			{
			}
		}
	});
	$("table").each(function(i){
		if($(this).attr("id")!=undefined)
		{
			//alert($(this).attr("id"));
		}
	});
	var ts = $("table[id$=rec]");
	for(var i=0;i<ts.length;i+=2)
	{
		for(var c=0;c<ts[i].rows[1].cells.length;c++)
		{
			var a = ts[i].rows[1].cells[c].innerText;
			var b = ts[i+1].rows[1].cells[c].innerText;
			if(a!=b)
			{
				ts[i].rows[1].cells[c].style.backgroundColor='red';
				ts[i].rows[1].cells[c].style.color='white';
				ts[i+1].rows[1].cells[c].style.backgroundColor='red';
				ts[i+1].rows[1].cells[c].style.color='white';
			}else if(a==""&&b=="")
			{
				ts[i].rows[0].cells[c].style.display='none';
				ts[i+1].rows[0].cells[c].style.display='none';
				ts[i].rows[1].cells[c].style.display='none';
				ts[i+1].rows[1].cells[c].style.display='none';
			}
		}
		//alert(t);
	}
});

</script>