<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.hyjx.framework.service.UserCenterService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String userOrgCode=UserCenterService.getCurrentUserInfo().getOrg_code();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp" ></jsp:include>
	<title></title>
	<script type="text/javascript">
	function searchTree(parentNode,searchCon){
		var children;
// 		 for(var i=0;i<parentNode.length;i++){
// 			 children = $('#tree').tree('getChildren',parentNode[i].target);//获取顶级node下所有子节点
// 			 if(children){ //如果有子节点
// 	                for(var j=0;j<children.length;j++){ //循环所有子节点
// 	                            expandParent(children[j]); 
// 	                }
// 	            }
// 		 }
        
        for(var i=0;i<parentNode.length;i++){ //循环顶级 node
            children = $('#tree').tree('getChildren',parentNode[i].target);//获取顶级node下所有子节点
            if(children){ //如果有子节点
                for(var j=0;j<children.length;j++){ //循环所有子节点
                    //if($('#tree').tree('isLeaf',children[j].target)){ //判断子级是否为叶子节点,即不是父节点
                        if(children[j].text.indexOf(searchCon)>=0){ //判断节点text是否包含搜索文本                    
                            selectNode(children[j]); //设置此节点为选择状态
                            expandParent(children[j]); //设置此节点所有父级展开
                            break;
                        }
                    //}
                }
            }else{
                if(parentNode[i].text.indexOf(searchCon)>=0){
                    selectNode(parentNode[i]);
                    expandParent(parentNode[i]);
                    break;
                }
            }
        }
    }
	function selectNode(node){
	    $('#tree').tree('select',node.target);           
	};

	function expandParent(node){
	    var parent = node;
	    var t = true;
	    do {
	    parent = $('#tree').tree('getParent',parent.target); //获取此节点父节点
	    if(parent){ //如果存在
	        t=true;
	        $('#tree').tree('expand',parent.target);
	    }else{
	        t=false;
	    }
	    }while (t);
	}; 
	function searchtree()
	{
		//top.showMask();
		$('#tree').tree('expandAll');
		$('#tree').tree('collapseAll')
		//setTimeout("$('#tree').tree('collapseAll')","1000");
		//$("#_easyui_tree_1").addClass("tree-node-selected");
 		setTimeout("searchtree2()","100");
 		//$('#tree').tree('doFilter', $("#search").val());
	}
	function searchtree2()
	{
		if(!$("#searchForm1").form('validate')){  
			return;
		}
		if($("#search").val().length>10)
		{
			return;
		}
		if($("#search").val()=="")
		{
			$("#search").focus();
			return;
		}
		var roots=$('#tree').tree('getRoots'); //得到tree顶级node
		$('#tree').tree('doFilter', $("#search").val());
	    //searchTree(roots, $("#search").val()); 
	    //hideMask();
	    fix();
	    $('#tree').tree('expandAll');
	    searchTree(roots,$("#search").val());
	   //alert($(".tree-node-selected").css("top"));
	}
	function resetsearch()
	{
		$('#tree').tree('doFilter', '');
		$('#tree').tree('reload');
		$("#search").textbox("setValue","");
	}

	</script>
</head>
<body>
	<!-- 左侧树 -->
    <div class="left-tree">
    	<h2>单位/部门树</h2>
        <!-- 搜索 -->
        <form class="searchForm1" action="" method="post">
        	<input class="easyui-textbox"  id="search" type="text" style="width:70%" title="请输入关键字"  data-options="validType:['length[1,10]']" />
            <img src="<%=basePath %>images/icon-search3.png" alt="搜索按钮" title="点此搜索" style="left:62%;" onclick="searchtree()"/>
            <button class="btn btn-info btn-sm"  type="button" onkeydown="notsearch()" onclick="javascript:location.href=location;;">重置</button>
        </form>
        <!-- 操作按钮 -->
        <div class="operate">
            <img id="addsub" class="img-btn" src="<%=basePath%>images/tree-add.png" title="添加子节点" onclick="goAddSub()"/>&nbsp;&nbsp;&nbsp;
            <img class="img-btn" src="<%=basePath%>images/tree-del.png" title="删除选中节点" onclick="doDelete()"/>
        </div>
       
        <ul id="tree"></ul>
        <input type="hidden" id="currentNodeCode"/>
	    <input type="hidden" id="currentNodeId"/>
		<input type="hidden" id="rootNodeId"/>
		<input type="hidden" id="selectedChildrenLength"/>
    </div>
    
	 <!-- 右侧div or 右侧iframe（只需加class="right-area"） -->
   	<iframe class="right-area" name="treeFrame" id="treeFrame" src="" frameborder="0"  allowtransparency="true"></iframe>

</body>
</html>

<script type="text/javascript">
	function fix()
	{
		$("span[class*='tree-collapsed']").each(function(i){
			$(this).parent().next().css("display","none");
		});
	}
 	function notsearch()
 	{
 		 if (event.keyCode == 13){
			 	return;
        }
 	}
	var curnode = null;
    $(document).ready(function() {
    	$("#search").textbox({
    		inputEvents: $.extend({}, $.fn.textbox.defaults.inputEvents, {
    		                 keypress: function (e) {
    		            		  if (event.keyCode == 13){
    		           			 	searchtree();
    		                     }
    		 }
    	})
    	});
		//buildTree();
		$("#tree").orgtree({
            rootid:'<%=userOrgCode%>',
            validity:'-1',
			 onclick: function(node){
				 if(getLevel(node)>4)
				{
					 $("#addsub").css("display","none");
				}else
				{
					$("#addsub").css("display","");
				}
 				 curnode = node;
 				 $("#currentNodeId").val(node['id']);
 				 $("#currentNodeCode").val(node['code']);
 				 $("#selectedChildrenLength").val(node.children.length);
 				 var url = '<%=basePath%>depart/gotoEdit.xhtml?id='+node['id']; 
                 $("#treeFrame").attr("src",url);
			},
		    onloadsuccess:function(node,data){
		    	
				   var n = $("#tree").tree("getSelected");
				   $("#_easyui_tree_1").addClass("tree-node-selected");
				   if(n!=null){
						$("#currentNodeCode").val(n.code);
						$("#currentNodeId").val(n.id);
						$("#rootNodeId").val($("#currentNodeId").val());
						 var url = '<%=basePath%>depart/gotoEdit.xhtml?id='+n.id;
                       $("#treeFrame").attr("src",url);
				   }

				   
			   }
		});
		setTimeout("fix()",1000);
	});
    function getLevel(node) {//获取节点所在easyui tree树的层次，1为根节点，依次增加
        var level = 1;
        //循环调用getParent方法获取父节点进行层级累加
        while (node = $('#tree').tree('getParent', node.target)) level++;
        return level;
    }
	function reloadTree(action){
		
		if(action=="1")
		{
			$("#tree").tree("remove",curnode.target);
			return;
			var parentNode = $("#tree").tree('getParent',curnode.target);
			if(parentNode != null)
			{
				$('#tree').tree('reload',parentNode.target);
			}
			else
				$('#tree').tree('reload',curnode.target);
			$('#tree').tree('expand',curnode.target);
		}
		else if(action=="2")
		{
			try{
				if(curnode==null)
					curnode=$('#tree').tree('getRoot'); 
// 				if(curnode.target.getElementsByClassName("tree-file").length>0)
// 				{
// 					var parentNode = $("#tree").tree('getParent',curnode.target);
// 					$('#tree').tree('reload',parentNode.target);
// 					$('#tree').tree('expand',parentNode.target);
// 				}
//作用同下面代码，如下面不起作用可以参考此处。
				if(curnode.children!=undefined && curnode.children.length==0)
				{
				 	var parentNode = $("#tree").tree('getParent',curnode.target);
					$('#tree').tree('reload',parentNode.target);
				}else
				{
					if(curnode.target!=undefined)
					{
						//var parentNode = $("#tree").tree('getParent',curnode.target); 
						$('#tree').tree('reload',curnode.target);
						$('#tree').tree('expand',curnode.target);
					}
				}
			}catch(e){
				console.log(e);
			}
		}
		else
		{
			$('#tree').tree('update', {
				target: curnode.target,
				text: action
			});
		}
	}
	
	function goAdd(){
		var url = '<%=basePath%>depart/gotoAdd.xhtml';
        $("#treeFrame").attr("src",url);
	 }
	
	 function goAddSub(){
		var url = '<%=basePath%>depart/gotoAdd.xhtml?parentId='+$("#currentNodeId").val()+"&parentCode="+$("#currentNodeCode").val();
         $("#treeFrame").attr("src",url);
	 }
	 
	 function doDelete(){
		 var id=$("#currentNodeId").val();
		 if(id==null||id==''){
			 $.hyjx.alert('信息','请选择节点');
			 return;
		 }
		 
 		 if($("#selectedChildrenLength").val()>0){
 			 $.hyjx.alert('信息','当前节点为非末级节点，不可直接删除');
 			 return;
 		 }

         $.hyjx.confirm("提示信息","注意：["+curnode.text+"]所关联的用户将无效，确认删除吗？",function(result){
 			if(result == true){
 				var url = '<%=basePath%>depart/doDelete.xhtml?id='+id;
				$.ajax({
					url:url,
					type:"post",
					async:false,
					success:function(msg)
					{
						$("#currentNodeId").val('');
						$.hyjx.alert("提示信息","删除成功！","info", function(){reloadTree(1);});
						
					},
					error:function(msg)
					{
						$.hyjx.alert("提示信息","删除失败！","info", function(){});
					}
				});
 			}
		 });
	 }
    </script>
    