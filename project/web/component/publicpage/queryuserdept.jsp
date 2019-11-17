<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
<script>
	function searchtree()
	{
		if($("#search").val()=="")
			return;
		//$('#tree').tree('search',$("#search").val());
		$('#tree').tree('doFilter', $("#search").val());
	}
	function returnval()
	{
		var nodestr="";
		var nodename = "";
		try{
			var nodes =$("#tree").tree('getChecked');
		}catch(e){}
		var node = $("#tree").tree('getSelected');
		if(nodes.length==0&&node==null)return;
		for(var a=0;a<nodes.length;a++)
		{
			nodestr+=nodes[a].code+",";
			nodename+=nodes[a].text+",";
		}
		nodestr+=node.code+",";
		nodename+=node.text+",";
		nodestr = nodestr.substring(0,nodestr.length-1);
		nodename= nodename.substring(0,nodename.length-1);
		if(parent.rightFrame.$("#${param.id}").length>0){
			parent.rightFrame.$("#${param.id}").val(nodestr);
			parent.rightFrame.$("#${param.id}name").val(nodename);
		}
		else if(parent.rightFrame.treeFrame.$("#${param.id}").length>0)
		{
			parent.rightFrame.treeFrame.$("#${param.id}").val(nodestr);
			parent.rightFrame.treeFrame.$("#${param.id}name").val(nodename);
			
		}
		window.parent.closeWin('部门选择框');
	}
	function resetsearch()
	{
		location.href = location.href;
	}
	function treeChecked(selected, treeMenu) {
		var roots = $('#' + treeMenu).tree('getRoots');//返回tree的所有根节点数组
		if (selected) {
			for ( var i = 0; i < roots.length; i++) {
				var node = $('#' + treeMenu).tree('find', roots[i].id);//查找节点
				$('#' + treeMenu).tree('check', node.target);//将得到的节点选中
			}
		} else {
			for ( var i = 0; i < roots.length; i++) {
				var node = $('#' + treeMenu).tree('find', roots[i].id);
				$('#' + treeMenu).tree('uncheck', node.target);
			}
		}
	}
	function enterkey()
	{
		if(event.keyCode==13)
		{
			searchtree();
		}
	}
</script>	
</head>
<body onkeydown="enterkey()">
<form action="">
<div style="margin-left: 10px;">
<input type="text" class="easyui-textbox" id="search" name="search" >
<input type="button" value="搜索" class="btn btn-info btn-sm" onclick="searchtree()" style="margin-left: 5px;margin-right: 5px">
<input type="button" value="重置" class="btn btn-warn btn-sm" onclick="resetsearch()" style="margin-left: 5px;margin-right: 5px">
<input type="button" value="确定" class="btn btn-info btn-sm" onclick="returnval()" style="margin-left: 5px;margin-right: 5px">
 <ul id="tree" class="hy-orgtree" ></ul>


</div>
</form>
</body>
</html>
