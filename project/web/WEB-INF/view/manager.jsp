<%@ page import="com.hyjx.framework.service.ConfigManager" %>
<%@ page import="com.hyjx.framework.service.SystemService" %>
<%@ page import="com.hyjx.framework.service.UserCenterService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="theme" uri="/WEB-INF/tlds/theme.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title><%= ConfigManager.getConfig("sys.title")%></title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<script src="<%=basePath %>js/layer-v2.4/layer/layer.js"></script>
	
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
	
	
        function openeditpwd()
        {
            openWinW('<%=basePath %>user/editpwd.xhtml', '密码修改', '430px', '320px', true, false);
        }
        function onlineuser()
        {
            openWinW('<%=basePath %>onlineuser/list.xhtml', '在线用户', '800px', '400px', true, false);
        }
        function messageCenter()
        {
            openWinW('<%=basePath %>message/gotoList.xhtml', '消息中心', '800px', '500px', true, false);
        }
        function exitSys() {
            $.hyjx.confirm("系统信息",'确认退出吗？',function (r) {
                if(r){
                    $("#fExit").submit();
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
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:40px;">
		<!-- header begin -->
		<div class="public-header">
			<div class="center">
				<h1 class="logo-title"><img src="images/<%=SystemService.getCurrentTheme()%>/logo_title.png"/></h1>
				<div class="right-links">
					<span> <%=UserCenterService.getCurrentUserInfo().getUser_name()%>，欢迎您！</span>
					<a id="skin" href="javascript:void(0);"><img src="images/icon_skin.png"/></a>
					<a href="javascript:void(0);" title="修改密码" onclick="openeditpwd()"><img src="images/icon_set.png" /></a>
					<a href="javascript:void(0);" title="在线用户" onclick="onlineuser()"><img src="images/icon_user.png"/></a>
					<a href="javascript:void(0);" title="安全退出" onclick="exitSys();"><img src="images/icon_quit.png"/></a>
				</div>
			</div>
		</div>
		<!-- header end -->
		<form id="fExit" style="display: none" action="<%=basePath%>logout.xhtml"></form>
		<form id="fJump2Login" method="post" style="display: none" action="<%=basePath %>console.xhtml"></form>
	</div>

	<div class="leftArea" data-options="region:'west',border:false" style="width:170px;">
		<!-- 左侧菜单栏 begin-->
		<div id="menu-scroll1"><!-- 若不想要左侧菜单的自定义滚动条，去掉此层div -->
			<div class="left-menu">
				<p class="control"></p><!--控制菜单的收起展开 -->
				<!-- 上下切换的按钮 begin-->
				<p class="btn-up"></p>
				<p class="btn-down"></p>
				<!-- 上下切换的按钮 end-->

				<h1 class="menu1"><a href="<%=basePath%>demo/gotoDaiban.xhtml" target="rightFrame">
					<img class="icon" title="首页" src="images/<%=SystemService.getCurrentTheme()%>/menu1_icon1_active.png"/>首页</a>
				</h1>
				<c:forEach items="${requestScope.usermenus }" var="menu" varStatus="status">
					<h1 class="menu1">
						<a href="javascript:void(0);">
							<img title="${menu.menu_name }" class="icon" src="<%=basePath%>images/<%=SystemService.getCurrentTheme()%>/${menu.iconname }"/>${menu.menu_name }
						</a>
					</h1>
					<ul class="left-ul">
						<c:forEach items="${menu.children }" var="menu2">
							<c:if test="${menu2.menu_parent_code == menu.menu_code}">
								<c:if test="${menu2.is_leaf_node == 'Y'}">
									<li>
										<h2 class="menu2"><a href="<%=basePath%>${menu2.func_entra }" target="rightFrame">${menu2.menu_name }</a></h2>
									</li>
								</c:if>
								<c:if test="${menu2.is_leaf_node == 'N'}">
									<li>
										<h2 class="menu2"><a href="javascript:void(0)">${menu2.menu_name }</a></h2>
										<c:forEach items="${menu.children }" var="menu3">
											<c:if test="${menu3.menu_parent_code == menu2.menu_code}">
												<h3 class="menu3"><a href="<%=basePath%>${menu3.func_entra }" target="rightFrame">${menu3.menu_name }</a></h3>
											</c:if>
										</c:forEach>
									</li>
								</c:if>
							</c:if>
						</c:forEach>
					</ul>
				</c:forEach>
			</div>
		</div>

		<!-- 自定义滚动条 begin -->
		<script type="text/javascript" src="js/perfect-scrollbar.with-mousewheel.min.js"></script>
		<link href="css/perfect-scrollbar.css" rel="stylesheet"/>
		<style>
			#menu-scroll1{width:100%;height:100%;overflow: hidden;position:relative;}
		</style>
		<script>
			$(function() {
				$('#menu-scroll1').perfectScrollbar();
			});
		</script>
		<!-- 自定义滚动条 end -->
		<!-- 控制二三级菜单向上or向下移动 begin -->
		<script>
            $(document).on('click', '.btn-down', function() {
                slideUp();
            });

            $(document).on('click', '.btn-up', function() {
                slideDown();

                //因鼠标点击快，可能会多向下移，下为修正代码
                var ul=$(".left-ul[style='display: block;']");
                var marginTop=ul.find('li:first').css('marginTop');
                var marginTopD=marginTop.substring(0,marginTop.length -2 );
                if (marginTopD>0) {
                    ul.find('li:first').css("marginTop",0);
                }
            });

            function slideUp() {
                var ul=$(".left-ul[style='display: block;']");
                var marginTop=ul.find('li:first').css('marginTop');
                var marginTopD=marginTop.substring(0,marginTop.length -2 );
                if (marginTopD>0) {
                    ul.find('li:first').animate({
                        marginTop:'-=40px'
                    },'fast');
                }else {
                    var ulHeight=ul.css('height');
                    var ulHeightD=ulHeight.substring(0,ulHeight.length -2 );

                    var contentHeight=0;
                    ul.find('li').each(function(){
                        var hh=$(this).height();
                        contentHeight+=hh;
                    });

                    //如果菜单内容大于UL容器高度
                    if(contentHeight > ulHeightD){
                        var lastLiY = ul.find('li:last').offset().top;
                        var lastLiHeight=ul.find('li:last').height();

                        //如果最后一个li仍未显示
                        if(lastLiY+lastLiHeight + 20 > $(".btn-down").offset().top){
                            ul.find('li:first').animate({
                                marginTop:'-=40px'
                            },'fast');
                        }
                    }
                }
            }
            
            function slideDown() {
                var ul=$(".left-ul[style='display: block;']");
                var marginTop=ul.find('li:first').css('marginTop');
                var marginTopD=marginTop.substring(0,marginTop.length -2 );
                if (marginTopD<0) {
                    ul.find('li:first').animate({
                        marginTop:'+=40px'
                    },'fast');
				}
            }
		</script>

		<!-- 控制二三级菜单向上or向下移动 end -->
		<!-- 左侧菜单栏 end-->
	</div>

	<div class="rightArea" data-options="region:'center',border:false">
		<iframe class="rightFrame" name="rightFrame" id="rightFrame" src="<%=basePath %>demo\gotoDaiban.xhtml" frameborder="0"  allowtransparency="true"></iframe>
	</div>

	<!-- 换肤弹出层 begin -->
	<jsp:include page="../view/framework/index/skinlayer.jsp"></jsp:include>
	<!-- 换肤弹出层 end -->

</body>
</html>