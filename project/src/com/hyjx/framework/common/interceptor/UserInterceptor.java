package com.hyjx.framework.common.interceptor;


import com.hyjx.framework.common.Constants;
import com.hyjx.framework.common.util.SpringBeanUtil;
import com.hyjx.framework.login.LoginService;
import com.hyjx.framework.service.CacheService;
import com.hyjx.framework.service.ConfigManager;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.uc.user.UserInfo;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class UserInterceptor implements HandlerInterceptor{
	Logger log = Logger.getLogger(UserInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	/**
	 * 身份验证的拦截事件，若存在session，则为已登录；可配置例外
	 * @param request
	 * @param response
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		String uri=request.getRequestURI();
		try{
			String ignorePattern = ConfigManager.getConfig("userIntereptor.ignorePattern");
			Pattern p = Pattern.compile(ignorePattern);
			Matcher m = p.matcher(uri);
			if(m.find())
			{
				return true;
			}
		}catch(NullPointerException ex)
		{
			log.warn(uri);
		}
		UserInfo ui= UserCenterService.getCurrentUserInfo();
		//ui=null;
		if(ui==null){
			String jSessionId = getJSessionId(request);
			LoginService loginService= (LoginService) SpringBeanUtil.getBean("loginService");
			Object userObj=CacheService.get(jSessionId);
			String logoutAction=loginService.logout();
			if(userObj!=null){
				logoutAction=loginService.getLogoutByUser((UserInfo)userObj);
				CacheService.remove(jSessionId);
			}

			String XRequested=request.getHeader("x-requested-with");
			if("XMLHttpRequest".equals(XRequested)){
				//ajax request
				response.getWriter().write("sessionInvalid");
			}else{
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				String msg = "<script>location.href='"+basePath+logoutAction+".xhtml"+"';</script>";
				response.getWriter().write(msg);
			}
			return false;
		}
		return true;
	}

	/**
	 * 取当前JSessionId
	 * @return
	 */
	private String getJSessionId(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		if(cookies==null){
			return "";
		}

		String jSessionId = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie cook = cookies[i];
			if (Constants.JSESSIONID.equals(cook.getName())) { //获取键
				jSessionId = cook.getValue().toString();
				break;
			}
		}
		return jSessionId;
	}
}