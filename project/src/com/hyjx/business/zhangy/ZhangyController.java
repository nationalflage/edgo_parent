package com.hyjx.business.zhangy;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.orm.dao.Pager;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.uc.user.UserInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
*
* 描    述： Controller
* @author zhy
*
*/
@Controller
@RequestMapping("/zhangy")
public class  ZhangyController{
	@Resource
	private ZhangyService service;
    @Resource
    private IBaseDao dao;
	/**
	 * 到列表页面
	 * @return
	 */
	@RequestMapping(value = "/gotoList" )
	public String gotoList(HttpServletRequest request){
		return "/business/zhangy/listZhangy";
	}
	/**
	 * 查询列表数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(ZhangyModel model, HttpServletRequest request){
        Pager pager = dao.getPager("com.hyjx.business.zhangy.queryList", "com.hyjx.business.zhangy.queryCount", model);
        List<ZhangyModel> list=pager.getResultList();
        //转码
        for(ZhangyModel m:list){
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
        }
	    return  CommonUtil.getPageJsonStr(pager);
	}
	/**
	 * 到新增页面
	 * @return 
	 */
	@RequestMapping(value = "/gotoAdd",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gotoAdd(HttpServletRequest request) {
		/*
		 * 爱好
		 */
		List<CodeBean> ahList = CodeTableManager.getTableList("zhangy_ah");
		List<CodeBean> sex=CodeTableManager.getTableList("sex");
		ModelAndView mav = new ModelAndView("/business/zhangy/addZhangy");
		mav.addObject("ahList",ahList);
		mav.addObject("sex",sex);
		/*
		 * 添加人信息
		 */
		UserInfo user=UserCenterService.getCurrentUserInfo();
		ZhangyModel model=new ZhangyModel();
		model.setCjrxm(user.getUser_name());
		model.setCjrbmmc(user.getDepartName());
		mav.addObject("model", model);
		return mav;
	}
	/**
	 * 保存对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doAdd", method = RequestMethod.POST)
	@ResponseBody
	public String doAdd(ZhangyModel model) {
		model.setId(StringHelper.getPrimaryKey());
		if(service.add(model)){
			return "success";
		}else{
			return "failure";
		}
	}
	/**
	 * 到修改页面
	 * request
	 * @return
	 */
	@RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gotoEdit(HttpServletRequest request) {
		String id = request.getParameter("id");

		ZhangyModel qp=new ZhangyModel();
		
		qp.setId(id);

		ZhangyModel model =(ZhangyModel) (service.getInfoById(qp));
		
		ModelAndView mav = new ModelAndView("/business/zhangy/editZhangy");
		mav.addObject("model",model);
		List<CodeBean> ahList = CodeTableManager.getTableList("zhangy_ah");
		mav.addObject("ahList",ahList);
		return mav;
	}
	/**
	 * 更新数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doEdit", method = RequestMethod.POST)
	@ResponseBody
	public String doEdit(ZhangyModel model) {
		if(service.edit(model)>0){
			return "success";
		}else{
			return "failure";
		}
	}
	/**
	 * 删除
	 * request
	 * @return
	 */
	@RequestMapping(value = "/gotoDelete")
	@ResponseBody
	public String gotoDelete(HttpServletRequest request) {
		String id = request.getParameter("ids");

		ZhangyModel qp=new ZhangyModel();
		qp.setId(id);
		
		if(service.delete(qp)>0){
			return "success";
		}else{
			return "failure";
		}
	}
	/**
	 * 到查看页面
	 * request
	 * @return
	 */
	@RequestMapping(value = "/gotoView")
	public ModelAndView gotoView(HttpServletRequest request) {
		String id = request.getParameter("id");
		ZhangyModel qp=new ZhangyModel();
		qp.setId(id);
		ZhangyModel model =(ZhangyModel) (service.getInfoById(qp));
		
		ModelAndView mav = new ModelAndView("/business/zhangy/viewZhangy");
		mav.addObject("model",model);
		return mav;
	}
	
}