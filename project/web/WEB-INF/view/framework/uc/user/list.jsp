<%@page import="com.hyjx.framework.service.UserCenterService"%>
<%@page import="com.hyjx.framework.uc.user.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String userOrgCode=UserCenterService.getCurrentUserInfo().getDataOrgCode();
	String userIsAdmin=UserCenterService.getCurrentUserInfo().getUserIsAdmin();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <jsp:include page="/component/publicpage/header.jsp" ></jsp:include>
    <script type="text/javascript">
    
    $(function() {
        var rootId=$("#rootNodeId").val();
    	$('#tree').orgtree({
			rootid:'<%=userOrgCode == null?"":userOrgCode%>',
			departtype:'2',
			onclick:function(node){
		    	 $("#currentNodeId").val(node['attributes']);
				 $("#currentNodeCode").val(node['code']);
				 var url = '<%=basePath%>user/gotoUserList.xhtml?departCode='+node.code+'&orgCode='+node.attributes;
                $("#treeFrame").attr("src",url);
		    },
            onloadsuccess:function () {
                //var node = $('#tree').tree('find', rootId);
                //$('#tree').tree('select', node.target);
				   var n = $("#tree").tree("getSelected");
				   $("#_easyui_tree_1").addClass("tree-node-selected");
				   if(n!=null){
						$("#currentNodeCode").val(n.code);
						$("#currentNodeId").val(n.id);
						$("#rootNodeId").val($("#currentNodeId").val());
						//var url = '<%=basePath%>depart/gotoEdit.xhtml?id='+n.id;
                      // $("#treeFrame").attr("src",url);
				   }
            }
		});
    	var url = '<%=basePath%>user/gotoUserList.xhtml?departCode=<%=userOrgCode%>&orgCode=<%=userOrgCode%>';
        $("#treeFrame").attr("src",url);
    });
</script>
</head>
<body>
    <!-- 左侧树 begin-->
    <div class="left-tree">
        <h2></h2>
        <input type="hidden" id="rootNodeId" value="<c:out value="${userOrgCode}"/>"/>
		<input type="hidden" id="currentNodeCode"/>
		<input type="hidden" id="currentNodeId"/>
        <!-- 此处是树 -->
        <h3 class="easyui-tree-title">部门树</h3>
        <ul class="easyui-tree" id="tree">
            
        </ul>
    </div>
    <!-- 左侧树 end-->

    <!-- 右侧div or 右侧iframe（只需加class="right-area"） --> 
    <iframe class="right-area" name="treeFrame" id="treeFrame" src="" frameborder="0"  allowtransparency="true" ></iframe>
</body>
</html>

