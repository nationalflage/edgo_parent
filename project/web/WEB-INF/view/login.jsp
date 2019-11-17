<%@ page language="java" import="com.hyjx.framework.service.SessionManager" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String key = "!keye!com.hyjx.framework";
    SessionManager.set("key",key);

    Object uid=request.getAttribute("sys_uid");
    Object pwd=request.getAttribute("sys_pwd");
    String suid="";
    String spwd="";
    if(uid!=null){
        suid=uid.toString();
    }
    if(pwd!=null){
        spwd=pwd.toString();
    }
    Object subsys=request.getAttribute("subsysJson");

    String subSysJsonString="";
    if(subsys!=null){
        subSysJsonString=subsys.toString();
    }
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache" />
    
    <link rel="stylesheet" href="<%=basePath %>css/login.css"/>
    <script src="<%=basePath %>js/easyui/jquery.min.js"></script>
    <script src="<%=basePath %>js/style-login.js"></script>
    <script src="<%=basePath %>js/encode.js"></script>
    <title>华宇金信基础研发平台</title>
</head>
<body>
    <!--小图片 begin -->
    <img class="login-bg1" src="<%=basePath %>/images/login/login-bg1.png" alt="左下角图案"/>
    <img class="login-bg2" src="<%=basePath %>/images/login/login-bg2.png" alt="右上角图案"/>
    <!-- 小图片 end -->
    <h1 class="header">
        <img class="logo" src="<%=basePath %>/images/login/login-title.png"/>
    </h1>

    <div class="login">
        <img class="login-circle2" src="<%=basePath %>/images/login/login-circle2.png" alt="旋转背景"/>
        <!-- form begin-->
        <form class="loginForm" action="<%=basePath%>login.xhtml" method="post">
            <!-- 选择子系统 begin -->
            <div class="select-system">
                选择子系统：<span id="selected-system"></span>
                <ul class="dropdown-menu" id="system-dropmenu">

                </ul>
            </div>
            <input type="hidden" id="subSysJsonString" value="<%=subSysJsonString%>">
            <input type="hidden" name="subsys_id" id="subsys_id" value="console">
            <!-- 选择子系统 end -->

            <!-- 几个闪光点 begin-->
            <img class="point point1" src="<%=basePath %>/images/login/point.gif"/>
            <img class="point point2" src="<%=basePath %>/images/login/point.gif"/>
            <img class="point point3" src="<%=basePath %>/images/login/point.gif"/>
            <img class="point point4" src="<%=basePath %>/images/login/point.gif"/>
            <!-- 几个闪光点 end-->
            <p>
                <input class="username" type="text"  id="user_account"  />
           		<input type="hidden" id="user_account2" name="user_account">
            </p>
            <p>
                <input class="password" name="user_pwd" type="password"  id="user_pwd" autocomplete="off" />
            	<input class="password" type="text" value="密　码" id="text" /><!--unusable,只用于文字提示-->
            </p>
            <!-- 验证码 -->
            <p class="verify">
	            <input class="check" name="check" type="text"  id="check" >
	            <img id="checkimg" class="check-img" src="<%=basePath %>checkcode" alt="验证码图片"  onclick="changecheckcode()" title="点击更换验证码"/>
            </p>

			<%--<p>
				<select id="ss" name="ss" class="options" onchange="seturl();"
					title="请选择子系统">
					<c:forEach items="${requestScope.subsys}" var="s">
						<option value="${s.subsys_code }" url="${s.subsys_url }"
							id="${s.subsys_id }">${s.subsys_name }</option>
					</c:forEach>
				</select>
			</p>--%>

            <!-- 错误提示 begin -->
            <strong class="error-tip error-tip1" id="error-tip1" style="display: none">用户名或密码错误</strong>
            <strong class="error-tip error-tip2" id="error-tip2" style="display: none">验证码错误</strong>
            <!-- 错误提示 end -->

			<input class="btn" type="submit"  value="登　录"  onclick="if($(this).val()=='正在登录...')return;$(this).val('正在登录...');encodeup();"/>

            <!-- 记住账号和忘记密码 -->
            <%--<p style="text-align: center;">--%>
                <%--<input class="remember" id="remember" type="checkbox" />--%>
                <%--<label for="remember">记住账号</label>--%>
                <%--<a class="forget" href="javascript:void(0)">忘记密码</a>--%>
            <%--</p>--%>
        </form>
        <!-- form end-->
    </div>
</body>
</html>
<script>
    function seturl(){
        //$("#subsys_id").val($('#ss').find('option:selected').attr("id"));
    }
    function changecheckcode()
    {
        $("#checkimg").attr("src","<%=basePath %>checkcode?"+Math.random());
    }
    function encodeup()
    {
        $("#user_account2").val(encodeURIComponent(encode.encode($("#user_account").val(),'<%=key%>','core.hyjx.com','core.hyjx.com')));
        $("#user_pwd").val(encodeURIComponent(encode.encode($("#user_pwd").val(),'<%=key%>','core.hyjx.com','core.hyjx.com')));
    }
    $(document).ready(function(){
        if(top.location!=self.location){
            top.jumpToLogin();
        }

        var allsys=$("#subSysJsonString").val();
        var sysJson=eval('('+allsys+')');

        for(var i=0; i<sysJson.length; i++) {
            var name = sysJson[i].name;
            var id = sysJson[i].id;

            if(i==0){
                $("#selected-system").html(name);
                $("#subsys_id").val(id);

                $("#system-dropmenu").append("<li class=\"active\" id=\""+id+"\">"+name+"</li>");
            }else{
                $("#system-dropmenu").append("<li id=\""+id+"\">"+name+"</li>");
            }
        }

        $(document).on('click', '.dropdown-menu li', function() {
            $(this).addClass('active').siblings().removeClass('active');

            $("#selected-system").html($(this).text());
            $("#subsys_id").val($(this).attr("id"));

        });

        if("${login}"=="checkError")
        {
            $("#error-tip1").css('display','none');
            $("#error-tip2").text("验证码错误");
            $("#error-tip2").css('display','block');
        }
        if("${login}" == "loginError")
        {
            $("#error-tip2").css('display','none');
            $("#error-tip1").text("用户名或密码错误");
            $("#error-tip1").css('display','block');
        }
    });

    $(function(){
        var uid= "<%= suid%>";
        var pwd="<%= spwd%>";

        $("#user_account").val(uid);
        if(pwd!=""){
        	$("#user_pwd").show().focus();  
        	$("#text").hide(); 
        	$("#user_pwd").val(pwd);
        }
        $("#user_account").focus();
    });
</script>
