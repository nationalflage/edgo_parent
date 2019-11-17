package com.hyjx.business.subsys_example;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * 子系统测试类
 * @author dijian
 *
 */
@Controller
@RequestMapping("/subsys_example")
public class Subsys_exampleController {
	
	/**
	 * 进入子系统首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("/business/subsys_example/index");
		return mav;
	}
	
	/**
	 * 进入子系统登录页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("/business/subsys_login_example/login");
		return mav;
	}
	
} 