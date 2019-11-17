package com.hyjx.framework.login;

import com.hyjx.framework.uc.user.UserInfo;
import com.hyjx.framework.uc.user.UserModel;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户服务接口
 * @author Peter
 *
 */
public interface LoginService {

	/**
	 *  验证是否已登录
	 * @return tree:已登录，false:未登录
	 */
	public boolean isLogined();

	/**
	 * 取当前登录地址
	 * @return
	 */
	public String getLoginPage();

	/**
	 * 当前登录用户所登录系统的首页地址
	 * @return 当前系统的首页地址
	 */
	public ModelAndView getCurrentHome();

	/**
	 * 登录成功后的初始化方法
	 */
	public void initLogined();

	/**
	 * 登录成功的后置事件
	 */
	public void afterLogin();

	/**
	 *  验证用户身份
	 * @param userModel 登录用户信息
	 * @return 是否通过验证  true:通过，false:未通过
	 */
	public boolean login(UserModel userModel);

	/**
	 * 用户登出
	 * @return 登出后跳转页面
	 */
	public String logout();

	/**
	 * 用户登出
	 * @return 登出后跳转页面
	 */
	public ModelAndView doLogout();

	/**
	 * 用户登出
	 * @return 登出后跳转页面
	 */
	public String getLogoutByUser(UserInfo user);
}