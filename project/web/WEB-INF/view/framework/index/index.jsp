<%@ page import="com.hyjx.framework.service.ConfigManager" %>
<%@ page import="com.hyjx.framework.service.SessionManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="theme" uri="/WEB-INF/tlds/theme.tld"%>
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
	<script src="<%=basePath %>js/layer-v2.4/layer/layer.js"></script>
	<script src="<%=basePath %>js/stomp.js"></script>
	<script src="<%=basePath %>js/sockjs.js"></script>
	<title><%= ConfigManager.getConfig("sys.title")%></title>
	<script>
		function showw(value){
			layer.photos({
				photos: {
					"title": "", //相册标题
					"id": 123, //相册id
					"start": 0, //初始显示的图片序号，默认0
					"data": [   //相册包含的图片，数组格式
						{
							"alt": "图片名",
							"pid": 666, //图片id
							"src": value, //原图地址
							"thumb": value //缩略图地址
						}]}
			});
		}
		function rightFrameHeight() {
			if(uiLayout=='1'){
				var ifm_right= document.getElementById("rightFrame");
				ifm_right.height="0px"; //不然谷歌浏览器下始终是所加载过页面的最大高度
				var subWeb_right = document.frames ? document.frames["rightFrame"].document : ifm_right.contentDocument;
				if(ifm_right != null && subWeb_right != null) {
                    ifm_right.height = subWeb_right.body.scrollHeight;
                    ifm_right.width = subWeb_right.body.scrollWidth;
                    //alert(ifm_right.height);
                }
			}
		}

        function jumpToLogin(){
			try{
			    //$.hyjx.alert("系统信息","会话超时，您已登出系统。");
                $("#fJump2Login").submit();
			}catch (e){
                console.log(e.message);
			}
        }
	</script>
</head>
<body>
<form id="fJump2Login" method="post" style="display: none" action="<%=basePath %>console.xhtml"></form>
<div class="big-bg"></div><!--固定的大背景-->
<!-- 头部 -->
<jsp:include page="../index/top.jsp"></jsp:include>

<!-- 一级导航 -->
<jsp:include page="../index/nav.jsp"></jsp:include>

<!-- container begin -->
<div class="container">
	<!-- 左侧菜单栏-->
	<div  class="leftArea">
		<div class="left-menu hy-pagemenu" id="leftmenu1">
		</div>
	</div>
	<!-- 右侧切换区 begin-->
	<div class="rightArea">
		<iframe class="rightFrame" name="rightFrame" id="rightFrame" src="<%=SessionManager.getString("indexFuncEntra")%>" frameborder="0" onload="rightFrameHeight();" allowtransparency="true"></iframe>
	</div>
	<!-- 右侧切换区 end-->
</div>
<!-- container end -->

<!-- 换肤按钮 begin-->
<div class="change-skin">
	<img class="button" src="images/change-skin.png"/>
	<img class="words" src="images/skin-remind.png"/>
</div>
<!-- 换肤按钮 end -->

<jsp:include page="../index/skinlayer.jsp"></jsp:include>

</body>
</html>