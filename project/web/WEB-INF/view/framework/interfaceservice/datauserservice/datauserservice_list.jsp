<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<title></title>
</head>
<body style="background-color: #fff">
<!-- 左侧树 -->
	<div class="left-tree">
	<h2>数据用户</h2>
	<table >
		<th>类型：</th>
		<td>
		<select class="easyui-combobox" onchange="select()" id="user_type" style="width: 100px;" data-options="panelHeight:'auto'">
			 <option value ="">请选择</option>
			 <option value ="01">企业</option>
			 <option value ="02">委办局</option>
		</select>
		</td>
	</table>
		<!-- 操作按钮 -->
		<ul id="tree"></ul>

		<input type="hidden" id="currentNodeCode" /> 
		<input type="hidden" id="currentNodeId" />
		<input type="hidden" id="rootNodeId" /> 
		<input type="hidden" id="currentNodeEndflag" />
	</div>

	<!-- 右侧div or 右侧iframe（只需加class="right-area"） -->
	<iframe class="right-area" name="treeFrame" id="treeFrame" src="" frameborder="0"  allowtransparency="true"></iframe>
</body>
</html>

<script type="text/javascript">
     $(document).ready(function() {
		buildTree();
	    $("#user_type").combobox({  
	           onSelect: function () {  
	               //var newPtion = $("#user_type").combobox('getValue')  
	               var s = $("#user_type").combobox('getValue');
	       		//	alert(s);
	        		$('#tree').tree({
	       			url:'<%=basePath%>/userservice/gotoListTree.xhtml?usertype='+s,
	       			animate : true,
	       			checkbox : false,
	       			onClick : function(node) {
	       				
	       			//	$("#currentNodeId").val(node['id']);
	       			//	alert(node['id']);
	       			//	doQuery()
	       				if(node['id']=="root"){
	       					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
	       				}else{
	       					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
	       				}
	       			},
	       			onLoadSuccess : function(node, data) {
	       				$("#_easyui_tree_1").addClass("tree-node-selected");
	       				var n = $("#tree").tree("getSelected");
	       				if (n != null) {
	       					$("#currentNodeId").val(n.id);

	       				}
	       			}
	       		});
	           }  
	       })  
		
	});
    
     function doQuery(){
		//	var data_attr = $("#form1").serialize();
			$('#tt').datagrid({
				url: '<%=basePath %>userservice/gotoListAdmit.xhtml',
				queryParams: data_attr,
				
				singleSelect: true,
				rownumbers: true,
				
				pageNumber: 1,
				columns:[[
						{field:'userlogname',title:'服务名称',width:100},
						{field:'username',title:'服务类型',width:100},
						
					{field:'userid',title:'操作列',width:100,halign:'center',
 		        	formatter: function (value, rowData, rowIndex) {
 		        		 return  "<span class=\"btn-delete\" title=\"删除\" onclick=\"del('"+value+"')\" ></span>"
 		        	}
 		        }
				]]
			});	
		}
	
 	function select(){
 		
 		//	var select = document.getElementById('user_type');
 	
 		var s = $('#user_type').val();
		//	alert(s);
 		$('#tree').tree({
			url:'<%=basePath%>/userservice/gotoListTree.xhtml?usertype='+s,
			animate : true,
			checkbox : false,
			onClick : function(node) {
				
			//	$("#currentNodeId").val(node['id']);
			//	alert(node['id']);
			//	doQuery()
				if(node['id']=="root"){
					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
				}else{
					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
				}
			},
			onLoadSuccess : function(node, data) {
				$("#_easyui_tree_1").addClass("tree-node-selected");
				var n = $("#tree").tree("getSelected");
				if (n != null) {
					$("#currentNodeId").val(n.id);

				}
			}
		});
	}

	function buildTree(){
		$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid=root");

		$('#tree').tree({
			url:'<%=basePath%>/userservice/gotoAllListTree.xhtml?',
			animate : true,
			checkbox : false,
			onClick : function(node) {
				//$("#currentNodeId").val(node['id']);
			//	$("#treeFrame").attr("src","framework/interfaceservice/datauserservice/admitinfo.jsp"); 
				
				if(node['id']=="root"){
					//alert(node['id']);
					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
				}else{
					//alert(node['id']);
					$("#treeFrame").attr("src","<%=basePath %>userservice/gotoListAdmittemp.xhtml?userid="+node['id']);
				}
				 
			},
			onLoadSuccess : function(node, data) {
				$("#_easyui_tree_1").addClass("tree-node-selected");
				var n = $("#tree").tree("getSelected");
				if (n != null) {
					$("#currentNodeId").val(n.id);

				}
			}
		});
	}

	function reloadTree(type) {
		$('#tree').tree('reload');

	}
</script>