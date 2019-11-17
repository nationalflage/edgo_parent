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
	<title>窗口</title>
</head>
<body style="background-color: #fff;padding: 0 15px;">
	<h1 class="public-title"><b>正常窗口</b></h1>
	<a class="btn btn-info" href="javascript:void(0)" onclick="$('#w1').window('open')">打开</a>
	<a class="btn" href="javascript:void(0)" onclick="$('#w1').window('close')">关闭</a>
	<div class="easyui-window" id="w1" data-options="closed:true,modal:true" title="窗口名" style="width:600px;height:300px;padding:5px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'east',split:true" style="width:100px;padding:5px;">右侧内容区</div>
			<div data-options="region:'center'" style="padding:5px;">
				左侧内容区
			</div>
			<div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:alert('ok')" style="width:80px">确定</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:alert('cancel')" style="width:80px">取消</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"  href="#">Add</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'" href="#">Remove</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" href="#">Save</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cut',disabled:true" href="#">Cut</a>
				<a class="easyui-linkbutton" href="#">Text Button</a>
			</div>
		</div>
	</div>
	<h1 class="public-title"><b>多窗口</b></h1>
	<a class="btn btn-info" href="javascript:void(0)" onclick="testOpenWin1();">打开窗口-模态</a>
	<a class="btn btn-info" href="javascript:void(0)" onclick="testOpenWin2();">打开窗口-非模态1</a>
	<a class="btn btn-info" href="javascript:void(0)" onclick="testOpenWin3();">打开窗口-非模态2</a>
	<a class="btn btn-info" href="javascript:void(0)" onclick="testOpenWin4();">打开窗口-非模态3</a>
	<h1 class="public-title"><b>内联窗口</b></h1>
	<div style="margin:20px 0;">
		<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#w2').window('open')">开</a>
		<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#w2').window('close')">关</a>
	</div>
	<div class="easyui-panel" style="position:relative;width:500px;height:300px;overflow:auto;">
		<div class="easyui-window" id="w2" data-options="title:'窗口名',inline:true,modal:true" style="width:250px;height:150px;padding:10px">
			该窗口始终在父标签内
		</div>
	</div>
	<h1 class="public-title"><b>流式窗口</b></h1>
	<div style="margin:20px 0;">
		<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#w3').window('open')">开</a>
		<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#w3').window('close')">关</a>
	</div>
	<div class="easyui-window" id="w3" data-options="closed:true,modal:true,onResize:function(){$(this).window('hcenter');}" title="流式窗口" style="width:80%;height:200px;padding:10px;">
		<p>此窗口宽度是80%</p>
	</div>
	<script>
		function openwin()
		{
			openWinW('<%=basePath%>demo/gotoLayerIframe.xhtml', '弹窗', document.body.clientWidth+'px', '600px', true, false);
		}
		//弹出模态窗口
		function testOpenWin1() {
		    openWinW('<%=basePath%>demo/gotoLayerIframe.xhtml', '弹窗1','600px', '300px', false, false);
		}
		//非模态窗口（支持弹出多个）
		function testOpenWin2() {
		    openWinW('<%=basePath%>subsys/gotoList.xhtml', '弹窗2','600px', '300px', true, true,true);
		}
		function testOpenWin3() {
		    openWinW('<%=basePath%>demo/gotoLayerIframe.xhtml', '弹窗3','600px', '300px', true,true,true);
		}
		function testOpenWin4() {
		    openWinW('<%=basePath%>demo/gotoLayerIframe.xhtml', '弹窗4','600px', '300px', true,true,true);
		}
	</script>
</body>
</html>