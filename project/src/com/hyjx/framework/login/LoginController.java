package com.hyjx.framework.login;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hyjx.framework.service.SessionManager;
import com.hyjx.framework.service.model.CacheSubSys;
import com.hyjx.framework.uc.subsys.SubsysModel;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hyjx.framework.common.util.SpringBeanUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.service.ConfigManager;
import com.hyjx.framework.service.RightManager;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.service.model.CacheUser;
import com.hyjx.framework.uc.menu.MenuModel;
import com.hyjx.framework.uc.user.UserModel;

/**
 * 用户控制器
 * @author Peter
 *
 */
@Controller
@RequestMapping("/")
public class LoginController {
	private static final Log logger = LogFactory.getLog(LoginController.class);

	@RequestMapping(value = "/console")
	public ModelAndView console(HttpServletRequest request) throws SQLException
	{
		List<SubsysModel> list=RightManager.getAllSubsys();

		StringBuffer sb=new StringBuffer();
		sb.append("[");
		int i=0;
		for(SubsysModel model:list){
			if("N".equals(model.getValidity()))
				continue;
			if(i>0){
				sb.append(",");
			}
			sb.append("{'id':'"+model.getSubsys_id()+"','name':'"+model.getSubsys_name()+"'}");
			i++;
		}
		sb.append("]");

		request.setAttribute("subsysJson", sb.toString());
		ModelAndView mav = new ModelAndView("/login");
		if(UserCenterService.getCurrentUserInfo()!=null)
		{
			if("2".equals(ConfigManager.getUiLayout())){
				CacheUser cacheUser = RightManager.getSysUsers().get(UserCenterService.getCurrentUserId());
				List<MenuModel> menuModels = cacheUser.getRightMenuMap().get(UserCenterService.getCurrentSubsys_id());
				request.setAttribute("usermenus",menuModels);
			}
			LoginService loginService= (LoginService) SpringBeanUtil.getBean("loginService");
			mav = loginService.getCurrentHome();
		}
		return mav;
	}

	@RequestMapping(value = "/manager")
	public ModelAndView manager(HttpServletRequest request) throws SQLException
	{
		String sysId="console";
		CacheUser cacheUser = RightManager.getSysUsers().get("admin");
		List<MenuModel> menuModels = cacheUser.getRightMenuMap().get(sysId);
		request.setAttribute("usermenus",menuModels);

		return new ModelAndView("/manager");
	}
	/**
	 * 登录验证
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param userModel 登录用户信息
	 * @return 跳转页面对象
	 */
	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,UserModel userModel) {
		LoginService loginService= (LoginService) SpringBeanUtil.getBean("loginService");
		logger.info(StringHelper.getDateTimeMill()+" 开始校验登录");
		if(loginService.isLogined()){
			//若已登录
			logger.info(StringHelper.getDateTimeMill()+" 之前已登，直接跳转到首页");
			//只给layout布局用
			if("2".equals(ConfigManager.getUiLayout())){
				CacheUser cacheUser = RightManager.getSysUsers().get(UserCenterService.getCurrentUserId());
				List<MenuModel> menuModels = cacheUser.getRightMenuMap().get(UserCenterService.getCurrentSubsys_id());
				request.setAttribute("usermenus",menuModels);
			}
			return loginService.getCurrentHome();
		}

		String sysId=request.getParameter("subsys_id");
		SessionManager.set("subsys_id",sysId);

		ModelAndView mav = null;
		//未登录，验证登录
		if(loginService.login(userModel)){
			//登录成功
			logger.info(StringHelper.getDateTimeMill()+" 登录成功");
			loginService.initLogined();
			loginService.afterLogin();
			return loginService.getCurrentHome();
		}else{
			List<SubsysModel> list=RightManager.getAllSubsys();

			StringBuffer sb=new StringBuffer();
			sb.append("[");
			int i=0;
			for(SubsysModel model:list){
				if("N".equals(model.getValidity()))
					continue;
				if(i>0){
					sb.append(",");
				}
				sb.append("{'id':'"+model.getSubsys_id()+"','name':'"+model.getSubsys_name()+"'}");
				i++;
			}
			sb.append("]");

			request.setAttribute("subsysJson", sb.toString());

			mav = new ModelAndView(loginService.getLoginPage());
			String errorCode = request.getAttribute("errorCode").toString();

			if("1001".equals(errorCode)){
				mav.addObject("login", "checkError");
				//mav.addObject("user_pwd", userModel.getUser_pwd());
				logger.info(StringHelper.getDateTimeMill()+" 登录失败，验证码错误");
			}else if("1002".equals(errorCode)){
				logger.info(StringHelper.getDateTimeMill()+" 登录失败，用户名或密码错误");
				mav.addObject("login", "loginError");
			}
			return mav;
		}
	}

	/**
	 * 登出
	 * @param request 请求对象
	 * @return 跳转地址
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.setAttribute("subsys", RightManager.getAllSubsys());
		LoginService loginService= (LoginService) SpringBeanUtil.getBean("loginService");
		return loginService.doLogout();
	}
}