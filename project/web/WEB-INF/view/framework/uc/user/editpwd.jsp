<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >    
    <title>编辑</title>
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    </head>
<body>

	<form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
			<table  class="table-query">
				<tr>
				<th width="30%" align="right">用户名</th>
				<td width="70%">
				<c:out value="${username}"/>
				</td>
				</tr>
				<tr>
				<th width="30%" align="right">旧密码</th>
				<td width="70%"><input name="old_pwd" id="old_pwd" class="easyui-textbox" type="password" required="true"/></td>
				</tr>
				<tr>
				<th width="30%" align="right">新密码</th>
				<td width="70%"><input name="new_pwd"  id="new_pwd" class="easyui-textbox" type="password" required="true"/></td>
				</tr>
				<tr>
				<th width="30%" align="right">确认新密码</th>
				<td width="70%"><input name="new_pwd2" id="new_pwd2" class="easyui-textbox" type="password" required="true"/></td>
				</tr>
			</table>
			
			<table  class="table-query"  style="width: 100%">
				<tr>
				<td colspan="4" align="center" >
				<center>
                        <button class="btn btn-info" onclick="save();" type="button">保 存</button>
                        <button class="btn"  onclick="closewin();">关 闭</button>
                 </center>
				</td>
				</tr>
			</table>	
		</form>
			
</body>
</html>
<script type="text/javascript">
	function closewin()
	{
        window.parent.closeWin('密码修改');
	}
	function save()
	{
		if(!$("#form1").form('validate')){  
			return;
		}
		if($("#new_pwd").val()!=$("#new_pwd2").val())
		{
			$.hyjx.alert('信息','新密码输入不一致','info',function(){});
			return;
		}
		$.ajax({
			url:"<%=basePath%>user/doeditpwd.xhtml",
			data:$("#form1").serialize(),
			type:"post",
			async:false,
			success:function(msg)
			{
				if(msg=="-1")
				{
					$.hyjx.alert('信息','旧密码错误','info',function(){});
					return;
				}
				else if(msg=="-2")
				{
					$.hyjx.alert('信息','新密码不能为空','info',function(){});
					return;
				}
				else if(msg=="-3")
				{
					$.hyjx.alert('信息','新密码输入不一致','info',function(){});
					return;
				}
				else{
					$.hyjx.alert('信息','修改成功','info',function(){
						closewin();
					});
				}
			},
			error:function(msg)
			{
				$.hyjx.alert('错误','修改失败');
			}
			
		});
	}

</script>