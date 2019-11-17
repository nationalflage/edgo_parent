<%@ page import="com.hyjx.framework.service.ConfigManager" %>
<%@ page import="com.hyjx.framework.service.UserCenterService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

   <div class="public-header" >
        <div class="center">
            <h1 class="title"><%= ConfigManager.getConfig("sys.title")%></h1>
            <div class="right-links">
                <span></span>
                <span class="user"><%=UserCenterService.getCurrentUserInfo().getUser_name()%>
                
                 <%--<a href="javascript:void(0)" id="msg" title="消息中心" style="margin-left: 5px;" onclick="messageCenter()">[消息中心 (<label id="msgcount" style="color: red;font-weight: bold;">0</label>)]</a>--%>
                
                <a href="#" title="修改密码" style="margin-left: 5px;" onclick="openeditpwd()">[修改密码]</a>

                    <c:set var="tempIsAdmin" value="<%= UserCenterService.getCurrentUserInfo().isSuperAdmin() %>"/>
                <c:if test="${tempIsAdmin}">
                    <a href="javascript:void(0)" title="在线用户" style="margin-left: 5px;" onclick="onlineuser()">[在线用户]</a>
                	<a href="javascript:void(0)" title="刷新缓存" style="margin-left: 5px;" onclick="refreshCache()">[刷新缓存]</a>
	            </c:if>
                <a href="javascript:void(0)" title="安全退出" onclick="exitSys();">[安全退出]</a>
                    <form id="exit111" style="display: none" method="POST" action="<%=basePath%>logout.xhtml"></form>

            </div>
        </div>
    </div>

<script type="text/javascript">
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
               $("#exit111").submit();
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
// 判断当滚动条离开顶部时令顶栏隐藏，一级导航至顶，回到顶部时恢复正常
   $(window).bind('scroll',function(){
       if ($(this).scrollTop()>50) {
         $('.public-header').hide();
         $('.navigation').css({'top':'0'});
       }else{
         $('.public-header').show();
         $('.navigation').css({'top':'55px'});
       }
   });

   </script>
