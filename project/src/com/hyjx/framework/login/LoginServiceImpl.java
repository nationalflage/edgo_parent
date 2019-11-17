package com.hyjx.framework.login;

import java.lang.reflect.InvocationTargetException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.hyjx.framework.service.*;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hyjx.framework.common.Constants;
import com.hyjx.framework.common.OnlineUserListener;
import com.hyjx.framework.common.PropertyUtil;
import com.hyjx.framework.common.util.DesUtils;
import com.hyjx.framework.common.util.HttpRequestUtil;
import com.hyjx.framework.common.util.MD5Helper;
import com.hyjx.framework.common.util.SpringBeanUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.orm.dao.BaseDao;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.service.model.CacheSubSys;
import com.hyjx.framework.service.model.CacheUser;
import com.hyjx.framework.uc.admin.AdminModel;
import com.hyjx.framework.uc.admin.AdminService;
import com.hyjx.framework.uc.depart.DepartModel;
import com.hyjx.framework.uc.depart.DepartService;
import com.hyjx.framework.uc.menu.MenuModel;
import com.hyjx.framework.uc.user.UserInfo;
import com.hyjx.framework.uc.user.UserModel;

/**
 * 用户服务实现类
 * @author Peter
 */
@Service
public class LoginServiceImpl implements LoginService{
	private static final Log logger = LogFactory.getLog(LoginServiceImpl.class);
	
	@Resource
	DepartService departService;
	@Resource
	private IBaseDao dao;
	@Resource
	AdminService adminService;
	
	@Override
	public boolean isLogined() {
		if(UserCenterService.getCurrentUserInfo()==null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public String getLoginPage() {
		return "/login";
	}

	@Override
	public ModelAndView doLogout() {
		SessionManager.invalidate();
		return new ModelAndView("redirect:/console.xhtml");
	}

	@Override
	public ModelAndView getCurrentHome() {
		Map<String, CacheSubSys> sysMenus = RightManager.getSysMenus();
		String sysId=UserCenterService.getCurrentSubsys_id();
		String homeUrl=null;
		if("2".equals(ConfigManager.getUiLayout())){
			homeUrl="/index_layout";
		}else {
			homeUrl=sysMenus.get(sysId).getSubSys().getSubsys_url();
		}
		//return new ModelAndView("redirect:/index.xhtml?menuId=01");
		return new ModelAndView(homeUrl);
	}

	@Override
	public void initLogined() {
		HttpServletRequest request= SystemService.getRequest();
		UserInfo ui=UserCenterService.getCurrentUserInfo();
		String userId=ui.getUser_id();

		request.removeAttribute("sys_uid");
		request.removeAttribute("sys_pwd");

		UserModel userModel = RightManager.getSysUsers().get(userId).getUser();
		ui.setClient_ip(HttpRequestUtil.getRemoteHost(request));
		try {
			ui.setServer_ip(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		ui.setUser_account(userModel.getUser_account());
		ui.setUser_name(userModel.getUser_name());
		ui.setUserIsAdmin(userModel.getUserIsAdmin());
		ui.setSuperAdmin(userModel.isSuperAdmin());
		ui.setOrg_code(userModel.getOrg_code());
		ui.setDepart_code(userModel.getDepart_code());
		ui.setDataOrgCode(RightManager.getUserDataOrgCode(userModel.getOrg_code()));

		Map<String, CacheUser> sysUsers = RightManager.getSysUsers();
		CacheUser cu=sysUsers.get(userId);
		if(cu!=null){
			ui.setExtData(cu.getUser().getExtData());
		}
		//本功能使用session的监听器实现用户退出系统或者session失效时自动情况session中的信息，所以必须采用web容器的session
		request.getSession().setAttribute("OnlineUserListener", new OnlineUserListener(ui));
		if("1".equals(ConfigManager.getUiLayout()))
			SessionManager.set("activeMenuId","home");
		
		//只给layout布局用
		if("2".equals(ConfigManager.getUiLayout())){
			CacheUser cacheUser = RightManager.getSysUsers().get(UserCenterService.getCurrentUserId());
			List<MenuModel> menuModels = cacheUser.getRightMenuMap().get(UserCenterService.getCurrentSubsys_id());
			request.setAttribute("usermenus",menuModels);
		}
	}
	@Override
	public void afterLogin() {
	}
	@Override
	public boolean login(UserModel userModel) {
		HttpServletRequest request= SystemService.getRequest();
		//验证码组件开关
		if(!"0".equals(ConfigManager.getConfig("sys.checkcode")))
		{
			String validationCode = SessionManager.getString(Constants.VALIDATIONCODE);
			if(validationCode==null)
				validationCode = (String) request.getSession().getAttribute(Constants.VALIDATIONCODE);
			if(validationCode==null){
				validationCode="";
			}
			String check = request.getParameter("check");
			if( !validationCode.equals(check))
			{
				//验证码不正确
				request.setAttribute("errorCode","1001");
				return false;
			}
		}
		String key = SessionManager.getString("key");
		if(userModel.getUser_account()!=null && key !=null) {
			String userAccount=DesUtils.strDec(userModel.getUser_account(), key, "core.hyjx.com", "core.hyjx.com");
			logger.info(StringHelper.getDateTimeMill()+" account:"+userAccount);
			userModel.setUser_account(userAccount);
			request.setAttribute("sys_uid",userAccount);
			try {
				String pagePwd = DesUtils.strDec(userModel.getUser_pwd(), key, "core.hyjx.com", "core.hyjx.com");
				request.setAttribute("sys_pwd",pagePwd);
				userModel.setUser_pwd(MD5Helper.encrypt(pagePwd).toUpperCase());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}else{
			logger.info(StringHelper.getDateTimeMill()+" 登录失败，account或key为空");
			request.setAttribute("errorCode","1004");
			return false;
		}

		UserModel user = RightManager.getUserByAccount(userModel.getUser_account());
		if(user!=null&&user.getUser_pwd().equalsIgnoreCase(userModel.getUser_pwd())){
			if("N".equals(user.getValidity())){
				logger.info(StringHelper.getDateTimeMill()+" 登录失败，用户无效");
				request.setAttribute("errorCode","1002");
				return false;
			}
	
		}else{
			logger.info(StringHelper.getDateTimeMill()+" 登录失败，缓存取到用户为空或密码不正确，查询数据库。");
			dao = (IBaseDao) SpringBeanUtil.getBean("baseDao");
			List<UserModel> users = dao.queryObjectList("login.getUserByUserAccount",userModel);
			if(users==null || users.size()==0)
			{
				AdminModel am = new AdminModel();
				am.setAdmin_account(userModel.getUser_account());
				adminService = (AdminService) SpringBeanUtil.getBean("adminServiceImpl");
				am = adminService.login(am);
				if(am!=null)
				{
					user = new UserModel();
					user.setUser_account(am.getAdmin_account());
					user.setUser_pwd(am.getAdmin_pwd());
					user.setValidity(am.getValidity());
					user.setUser_id(am.getAdmin_id());
					user.setDepart_code(am.getDepart_id());
				}
			}else
			{
				user = users.get(0);
			}
			
			if(user==null)
			{
				logger.info(StringHelper.getDateTimeMill()+" 登录失败，用户无效");
				request.setAttribute("errorCode","1002");
				return false;
			}
			if(user.getUser_pwd().equalsIgnoreCase(userModel.getUser_pwd()))
			{
				if(!"Y".equals(user.getValidity()))
				{
					logger.info(StringHelper.getDateTimeMill()+" 登录失败，用户无效");
					request.setAttribute("errorCode","1002");
					return false;
				}
			}else
			{
				logger.info(StringHelper.getDateTimeMill()+" 登录失败，用户无效");
				request.setAttribute("errorCode","1002");
				return false;
			}
			
		}
		UserInfo ui=new UserInfo();
		String userId=user.getUser_id();
		ui.setUser_id(userId);
		ui.setUser_name(user.getUser_name());
		ui.setDepart(RightManager.getDepartByCode(user.getDepart_code()));
		try {
			BeanUtils.copyProperties(ui, user);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		SessionManager.set(Constants.USERINFO,ui);
		String jSessionId = SystemService.getJSessionId();
		if(!"".equals(jSessionId)){
			CacheService.set(jSessionId,ui);
		}
		return true;
		
		
		
	}

	@Override
	public String logout() {
		return getLoginPage();
	}

	@Override
	public String getLogoutByUser(UserInfo user) {
		return "logout";
	}
}