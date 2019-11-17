package com.hyjx.business.fengjc;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.orm.dao.Pager;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.uc.user.UserInfo;
import com.sun.org.apache.bcel.internal.classfile.Code;

@Controller
@RequestMapping("/fengjc")
public class FengjcController {

	@Resource
	private FengjcService service;
	@Resource
	private IBaseDao dao;
	/**
	 * 到列表页面
	 * @param requst
	 * @return
	 */
	@RequestMapping(value="/gotoList")
	public String gotoList(HttpServletRequest requst){
		
		return "/business/fengjc/listFengjc";
	}
	/**
	 * 获取列表
	 * @param model
	 * @param requst
	 * @return
	 */
	@RequestMapping(value="/queryList",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(FengjcModel model,HttpServletRequest requst){
	
		Pager pager=dao.getPager("com.hyjx.business.fengjc.queryList", "com.hyjx.business.fengjc.queryCount", model);
		List<FengjcModel> list=pager.getResultList();
		//转码
		for(FengjcModel m:list){
			//将性别转码
			m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
			//将爱好转码
			List<String> lists=new ArrayList<String>();
			String ah=m.getAh();
			if(ah!=null){
				String[] ahpath=ah.split(",");
				for(String str:ahpath){
					String ahs=CodeTableManager.getNameByCode("fengjc_ah", str);
					lists.add(ahs);
				}
				String aha="";
				for (int i = 0; i <lists.size() ; i++) {
					if(aha==""){
						aha=lists.get(i);
					}else{
						aha=aha+","+lists.get(i);
					}
				}
				System.out.println(aha);
				m.setAh(aha);
			}
			//将有效值转码
			String sfyxcode=m.getSfyx();
			if(sfyxcode.equals("Y")){
				m.setSfyx("是");
			}else{
				m.setSfyx("否");
			}
			//将地址转码
			m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
			m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
			m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));
			//将部门转码
			System.out.println("m.getBmmc()="+m.getBmmc());
			m.setBmmc(CodeTableManager.getNameByCode("gszbm", m.getBmmc()));
		}
		return CommonUtil.getPageJsonStr(pager);
	}
	/**
	 * 到添加页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/gotoAdd",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gotoAdd(HttpServletRequest request){
		List<CodeBean>ahList=CodeTableManager.getTableList("fengjc_ah");
		List<CodeBean>sex=CodeTableManager.getTableList("sex");
		ModelAndView mav=new ModelAndView("/business/fengjc/addFengjc");
		
		mav.addObject("ahList",ahList);
		mav.addObject("sex", sex);
		
		/*
		 * 添加人信息
		 */
		UserInfo user=UserCenterService.getCurrentUserInfo();
		
		FengjcModel model =new FengjcModel();
		model.setCjrid(user.getUser_id().toString());
		model.setCjrxm(user.getUser_name().toString());
		model.setCjrbmmc(user.getDepartName().toString());
		model.setCjrbmid(user.getDepartCode().toString());
		
		mav.addObject("model", model);
		System.out.println(user);
		return mav;
	}
	
	/**
	 * 保存对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doAdd", method = RequestMethod.POST)
	@ResponseBody
	public String doAdd(FengjcModel model) {
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
		FengjcModel qp=new FengjcModel();
		qp.setId(id);
		FengjcModel model =(FengjcModel) (service.getInfoById(qp));
		System.out.println("省为="+model.getCsdsheng());
		model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
		model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
		model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
		ModelAndView mav = new ModelAndView("/business/fengjc/editFengjc");
		mav.addObject("model",model);
		List<CodeBean> ahList = CodeTableManager.getTableList("fengjc_ah");
		mav.addObject("ahList",ahList);
		List<CodeBean> address=CodeTableManager.getTableList("district") ;
		mav.addObject("address", address);
		return mav;
	}
	/**
	 * 更新数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doEdit", method = RequestMethod.POST)
	@ResponseBody
	public String doEdit(FengjcModel model) {
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
		
		FengjcModel qp=new FengjcModel();
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
		FengjcModel qp=new FengjcModel();
		qp.setId(id);
		FengjcModel model =(FengjcModel) (service.getInfoById(qp));
		//将性别转码
		
	
		model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
		//将爱好转码
		List<String> lists=new ArrayList<String>();
		String ah=model.getAh();
		if(ah!=null){
			String[] ahpath=ah.split(",");
			for(String str:ahpath){
				String ahs=CodeTableManager.getNameByCode("fengjc_ah", str);
				lists.add(ahs);
			}
			String aha="";
			for (int i = 0; i <lists.size() ; i++) {
				if(aha==""){
					aha=lists.get(i);
				}else{
					aha=aha+","+lists.get(i);
				}
			}
			System.out.println(aha);
			model.setAh(aha);
		}
		//将有效值转码
		String sfyxcode=model.getSfyx();
		if(sfyxcode.equals("Y")){
			model.setSfyx("是");
		}else{
			model.setSfyx("否");
		}
		//将地址转码
		model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
		model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
		model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
		ModelAndView mav = new ModelAndView("/business/fengjc/viewFengjc");
		//将部门转码
		System.out.println("age"+model.getAge());
		System.out.println("11"+model.getBmid());
		System.out.println("model.getBmmc()="+model.getBmmc());
		model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));
		mav.addObject("model",model);
		return mav;
	}
}
