package com.hyjx.business.zhoukx;


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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * 描    述： Controller
 * @author zhy
 *
 */
@Controller
@RequestMapping("/")
public class ZhoukxController{
	@Resource
	private ZhoukxService service;
	@Resource
	private IBaseDao dao;
	/**
	 * 到列表页面
	 * @return
	 */
	@RequestMapping(value = "/gotoList" )
	public String gotoList(HttpServletRequest request){
		return "/business/zhoukx/listZhoukx";
	}
	/**
	 * 查询列表数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(ZhoukxModel model, HttpServletRequest request){
		Pager pager = dao.getPager("com.hyjx.business.zhoukx.queryList", "com.hyjx.business.zhoukx.queryCount", model);
		List<ZhoukxModel> list=pager.getResultList();
		//转码
		for(ZhoukxModel m:list){
			//部门名称
			m.setBmmc(CodeTableManager.getNameByCode("gszbm", m.getBmmc()));

			//将性别转码
			m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
			//将爱好转码
			List<String>ahl=new ArrayList<String>();
			String ahCode=m.getAh();
			if(ahCode!=null){
				String []AhC=ahCode.split(",");
				for (String str : AhC) {
					String ahs=CodeTableManager.getNameByCode("zhoukx_ah",str);
					ahl.add(ahs);
				}
				String ah="";
				for (int i = 0; i < ahl.size(); i++) {
					if (ah=="") {
						ah=ahl.get(i);
					}else {
						ah=ah+","+ahl.get(i);
					}
				}
				m.setAh(ah);
			}

			//将出生省市区转码
			m.setCsdsheng(CodeTableManager.getNameByCode("district", m.getCsdsheng()));
			m.setCsdshi(CodeTableManager.getNameByCode("district", m.getCsdshi()));
			m.setCsdxian(CodeTableManager.getNameByCode("district", m.getCsdxian()));
			//是否有效转码
			//是否有效转码
			String sfcode=m.getSfyx();

			try {
				if(sfcode.equals("1")){
					m.setSfyx("是");
				}else{
					m.setSfyx("否");
				}
			}catch (Exception e){
				m.setSfyx("否");
			}

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
		List<CodeBean> ahList = CodeTableManager.getTableList("zhoukx_ah");
		System.out.println(ahList.toString()+"检查bug");

		/*性别*/
		List<CodeBean> sex=CodeTableManager.getTableList("sex");
		/*页面*/
		ModelAndView mav = new ModelAndView("business/zhoukx/addZhoukx");
		mav.addObject("ahList",ahList);
		mav.addObject("sex",sex);
		/*
		 * 添加人信息  从session中获取逇
		 */
		UserInfo user=UserCenterService.getCurrentUserInfo();
		/*实体数据
		 */
		ZhoukxModel model=new ZhoukxModel();
		model.setCjrid(user.getUser_id());
		model.setCjrxm(user.getUser_name());
		model.setCjrbmid(user.getDepartName());
		model.setSfyx("1");
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
	public String doAdd(ZhoukxModel model) {
		model.setId(StringHelper.getPrimaryKey());
		model.setBmid(model.getBmmc());


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

		ZhoukxModel qp=new ZhoukxModel();

		qp.setId(id);

		ZhoukxModel model =(ZhoukxModel) (service.getInfoById(qp));

		ModelAndView mav = new ModelAndView("business/zhoukx/editZhoukx");
		mav.addObject("model",model);
		List<CodeBean> ahList = CodeTableManager.getTableList("zhoukx_ah");
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
	public String doEdit(ZhoukxModel model) {


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

		ZhoukxModel qp=new ZhoukxModel();
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
		ZhoukxModel qp=new ZhoukxModel();
		qp.setId(id);
		ZhoukxModel model =(ZhoukxModel) (service.getInfoById(qp));

		//部门名称
		model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));

		//将性别转码
		model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
		//将爱好转码
		List<String>ahl=new ArrayList<String>();
		String ahCode=model.getAh();
		if(ahCode!=null){
			String []AhC=ahCode.split(",");
			for (String str : AhC) {
				String ahs=CodeTableManager.getNameByCode("zhoukx_ah",str);
				ahl.add(ahs);
			}
			String ah="";
			for (int i = 0; i < ahl.size(); i++) {
				if (ah=="") {
					ah=ahl.get(i);
				}else {
					ah=ah+","+ahl.get(i);
				}
			}
			model.setAh(ah);
		}

		//将出生省市区转码
		model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
		model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
		model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
		//是否有效转码
		//是否有效转码
		String sfcode=model.getSfyx();

		try {
			if(sfcode.equals("1")){
				model.setSfyx("是");
			}else{
				model.setSfyx("否");
			}
		}catch (Exception e){
			model.setSfyx("否");
		}




		ModelAndView mav = new ModelAndView("business/zhoukx/viewZhoukx");
		mav.addObject("model",model);
		return mav;
	}

	@RequestMapping("json")
	@ResponseBody
	public List<CodeBean> getBumen(){
		List<CodeBean>list =CodeTableManager.getTableList("bmcj");
		System.out.println("List----------数据打印"+list.toString());
		return  list;

	}

}