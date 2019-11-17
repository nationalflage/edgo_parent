<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>

<body>
<div class="content">
    <!-- 正常大小的按钮 -->
    <h1 class="public-title"><b>正常大小的按钮</b></h1>
    <input type="button" class="btn btn-info" value="查　询" />
    <input type="button" class="btn btn-warning" value="查　询" />
    <input type="button" class="btn btn-success" value="查　询" />
    <input type="button" class="btn btn-primary" value="查　询" />
    <input type="button" class="btn btn-danger" value="查　询" />
    <br/><br/>
    <!-- 小按钮 -->
    <h1 class="public-title"><b>小按钮</b></h1>
    <input type="button" class="btn btn-info btn-sm" value="查　询" />
    <input type="button" class="btn btn-warning btn-sm" value="查　询" />
    <input type="button" class="btn btn-success btn-sm" value="查　询" />
    <input type="button" class="btn btn-primary btn-sm" value="查　询" />
    <input type="button" class="btn btn-danger btn-sm" value="查　询" />
    <br/><br/>
    <!-- 大按钮 -->
    <h1 class="public-title"><b>大按钮</b></h1>
    <input type="button" class="btn btn-info btn-lg" value="查　询" />
    <input type="button" class="btn btn-warning btn-lg" value="查　询" />
    <input type="button" class="btn btn-success btn-lg" value="查　询" />
    <input type="button" class="btn btn-primary btn-lg" value="查　询" />
    <input type="button" class="btn btn-danger btn-lg" value="查　询" />
    <br/><br/>

    <!-- easyui自带的链接按钮 -->
    <h1 class="public-title"><b>easyui自带的链接按钮</b></h1>
    <p style="margin:10px;">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:80px">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="width:80px">移除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="width:80px">保存</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut'" style="width:80px">删除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">搜索</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:80px">打印</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重新加载</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-help'" style="width:80px">帮助</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:80px">确定</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="width:80px">回退</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'" style="width:80px">发送</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" style="width:80px">撤销</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" style="width:80px">清空</a>
        <a href="#" class="easyui-linkbutton" style="width:80px">纯文字按钮</a>
    </p>
    <div class="easyui-panel" style="padding:5px;">
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'">删除</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">取消</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">移除</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">搜索</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">打印</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重新加载</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'">帮助</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">确定</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'">回退</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'">转发</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'">撤销</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'">清空</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">打印</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true">纯文字按钮</a>
    </div>
    <br/>
    <div class="easyui-panel" style="padding:5px;">
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" title="添加"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" title="编辑"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'" title="保存"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'" title="删除"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" title="取消"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" title="移除"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" title="搜索"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'" title="打印"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" title="重新加载"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'" title="帮助"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'" title="确认"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'" title="回退"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'" title="转发"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'" title="撤销"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" title="清空"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'" title="打印"></a>
    </div>
    <h2 class="public-title2">不可点的按钮</h2>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add',disabled:true" title="添加"></a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit',disabled:true" title="编辑"></a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save',disabled:true" title="保存"></a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut',disabled:true" title="删除"></a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel',disabled:true" title="取消"></a>

    <h2 class="public-title2">上下结构的按钮</h2>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print',iconAlign:'top'" style="width:80px;">打印</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo',iconAlign:'top'" style="width:80px;">转发</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo',iconAlign:'top'" style="width:80px;">撤回</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',iconAlign:'top'" style="width:80px;">保存</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print',iconAlign:'top'" style="width:80px;">打印</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo',iconAlign:'top'" style="width:80px;">转发</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo',iconAlign:'top'" style="width:80px;">撤回</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save',iconAlign:'top'" style="width:80px;">保存</a>
</div>
</body>
</html>

<script>
  function check(m,n){
	  var vv=$("#xs").val();
	  
		eval("var reg1423=/^(0|[1-9]\\d{0,5})(\\.[0-9]{1,2})?$/;"); 
		
	    alert(reg1423.test(vv));
  	    
  }
 </script>
