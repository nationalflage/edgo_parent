<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
  
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>
<body >
<!-- 左侧树 -->
    <div class="left-tree" style="width: 20%">
    	<h2>菜单树</h2>
        <form class="searchForm1" action="" method="post">
            <input class="easyui-textbox"  id="search" type="text" style="width:70%" title="请输入关键字"   />
            <img src="<%=basePath %>images/icon-search3.png" alt="搜索按钮" style="left:62%;" onclick="searchtree()"/>
<!--             <button class="btn btn-info btn-sm" onclick="resetsearch()">重置</button>
 -->                     
                        <input type="button" class="btn btn-info btn-sm" onclick="resetsearch()" value="重置" />
            
      
        </form>
        
        <!-- 操作按钮 -->
        <div class="operate">
			<img id="addsub" class="img-btn" src="<%=basePath%>images/tree-add.png" title="添加子节点" onclick="goAddSub()"/>&nbsp;&nbsp;&nbsp;
			<img class="img-btn" src="<%=basePath%>images/tree-del.png" title="删除选中节点" onclick="doDelete()"/>
        </div>
        
       <ul  id="hy-menutree" ></ul>
       <input type="hidden" id="curselected" name="sysid"/>
       <input type="hidden" id="curselectedEndflag"/>
       <input type="hidden" id="curselectedMenuCode"/>
       <input type="hidden" id="subsysflag"/>
    </div>
    
	 <!-- 右侧div or 右侧iframe（只需加class="right-area"） -->
     <iframe class="right-area"  name="treeFrame" id="treeFrame" src="" frameborder="0"  allowtransparency="true" style="height: 500px;width:75%;"></iframe>
</body>
</html>

<script type="text/javascript">
$(function(){
	$("#search").textbox({
		inputEvents: $.extend({}, $.fn.textbox.defaults.inputEvents, {
		                 keypress: function (e) {
		                	
		            		  if (event.keyCode == 13){
		           			 	searchtree();
		                     }
		 }
	})
	});
});

function selectNode(node){
    $('#hy-menutree').tree('select',node.target);           
};

function expandParent(node){
    var parent = node;
    var t = true;
    do {
    parent = $('#hy-menutree').tree('getParent',parent.target); //获取此节点父节点
    if(parent){ //如果存在
        t=true;
        $('#hy-menutree').tree('expand',parent.target);
    }else{
        t=false;
    }
    }while (t);
}; 

$(function (){
	$("#hy-menutree").menutree({
		checkedvalue:"",
		showOperate:"0",
		checkbox:"0",
		isreadonly:"1",
		onclick:"switchRight",
		showAll:"1",
		applyRight:"0"
	});
});

function searchTree(parentNode,searchCon){
	var children;
    for(var i=0;i<parentNode.length;i++){ //循环顶级 node
        children = $('#hy-menutree').tree('getChildren',parentNode[i].target);//获取顶级node下所有子节点
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
 
function searchtree()
{
	if($("#search").val()=="")
	{
		$("#search").focus();
		return;
	}
	$('#hy-menutree').tree('expandAll');
	$('#hy-menutree').tree('collapseAll');
	setTimeout("searchtree2()","100");
} 

function searchtree2()
{  
	if($("#search").val()=="")
	{
		$("#search").focus();
		return;
	}
	var roots=$('#hy-menutree').tree('getRoots'); //得到tree顶级node
	$("#hy-menutree").tree('doFilter', $("#search").val());
	fix();
	searchTree(roots,$("#search").val());
}

function resetsearch()
{
	$("#hy-menutree").tree('doFilter', '');
	$("#hy-menutree").tree('reload');
	$("#search").textbox("setValue","");
}

function switchRight(node){
	 $("#curselected").val(node.id);
	 $("#curselectedEndflag").val(node.endflag);
	 $("#curselectedMenuCode").val(node.code);
	 var parentNode = $("#hy-menutree").tree('getParent', node.target);//找到父节点
	 $("#subsysflag").val("0");
     if(parentNode==""||parentNode==null){
    	 $("#subsysflag").val("1");
    	 var url = "<%=basePath%>subsys/gotoView.xhtml?id="+node.id+"&showFlag=0";
		 $("#treeFrame").attr("src",url);
     }else{
		 var url = "<%=basePath%>menu/gotoEdit.xhtml?id="+node.id;
         $("#treeFrame").attr("src",url);
     }
}

function fix()
{
	$("span[class*='tree-collapsed']").each(function(i){
		$(this).parent().next().css("display","none");
	});
}


function goAddSub(){
   
    if($("#curselectedMenuCode").val()!="console"&&$("#curselectedMenuCode").val().length!=32){
    if($("#curselectedMenuCode").val().length>=8){
     $.hyjx.alert('信息','菜单深度最大为4！！！');
    return false ;
    }
    }

	var id=$("#curselected").val();
	 if(id==null||id==''){
		 //alert("请选择父亲节点");
		 $.hyjx.alert('信息','请选择父亲节点');
		 return;
	 }
	var node = $("#hy-menutree").tree('getSelected');
	 var parentNode = $("#hy-menutree").tree('getParent', node.target);//找到父节点
	 var url = null ;
	 if(parentNode==""||parentNode==null){
		  url = '<%=basePath%>menu/gotoAdd.xhtml'+'?'+"&addsub=1"+"&sysid="+id;
	 }else{
		  url = '<%=basePath%>menu/gotoAdd.xhtml'+'?'+"&addsub=1"+"&menu_code="+id;
	 }
	$("#treeFrame").attr("src",url);
 }
 
 function goAdd(){
	var url = '<%=basePath%>menu/gotoAdd.xhtml'+'?'+$(treeFrame.form1).serialize();
     $("#treeFrame").attr("src",url);
 }
 function doDelete(){
	 var id=$("#curselected").val();
	 if(id==null||id==''){
		 $.hyjx.alert('信息','请选择节点');
		 return;
	 }
	 
	 
	 
	 var node = $("#hy-menutree").tree('getSelected');
	 
	 var parentNode = $("#hy-menutree").tree('getParent', node.target);//找到父节点
     if(parentNode==""||parentNode==null){
    	 $.hyjx.alert('信息','子系统不允许删除');
		 return;
     }
	 var childrenNew = $("#hy-menutree").tree('getChildren',node.target);
	 if(childrenNew!=""){
		 $.hyjx.alert('信息','当前节点为非末级节点，不可直接删除');
		 return;
	 }
	 
	 $.hyjx.confirm("提示信息","确定要删除选择的数据吗？",function(result){
	    if(result == true){
		   var url = '<%=basePath%>menu/gotoDelete.xhtml?ids='+id;
			$.ajax({
				url:url,
				type:"post",
				async:false,
				success:function(msg)
				{
					$("#hy-menutree").tree('remove',node.target);
					 refreshCache();
					$.hyjx.alert("提示信息","删除成功！","info", function(){
						refreshCache();
						//$("#hy-menutree").tree('reload');
					});
				},
				error:function(msg)
				{
					$.hyjx.alert('信息','删除失败');
				}
			});
	    }
	 });
 }   
 
 function refreshCache()
 {
	   var url='<%=basePath %>common/doRefreshCache.xhtml';
	   $.ajax({
			type: "POST",
		   	url: url,
		   	success: function(msg){
		   }
		});
 }
 

</script>