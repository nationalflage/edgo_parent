package com.hyjx.business.linyw_build;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.hyjx.business.linyw.LinywModel;
import com.hyjx.framework.common.CommonUtil;
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
import com.hyjx.framework.common.util.StringHelper;

import java.util.ArrayList;
import java.util.List;

/**
*
* 描述： Controller
* @author DESKTOP-24SOCQR
*
*/
@Controller
@RequestMapping("/lywbuild_")
public class  LywBuild_Controller{
	@Resource
	private LywBuild_Service service;
	@Resource
	private IBaseDao baseDao;
	/**
	 * 到列表页面
	 * @return
	 */
	@RequestMapping(value = "/gotoList" )
	public String gotoList(HttpServletRequest request){
		return "/business/linyw_build/listLywBuild_";
	}
	/**
	 * 查询列表数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(LywBuild_Model model,HttpServletRequest request){
		//转码
		Pager pager =  baseDao.getPager("com.hyjx.business.linyw_build.queryList",
				"com.hyjx.business.linyw_build.queryCount",model);
		List<LywBuild_Model> list = pager.getResultList();
		for (LywBuild_Model m:list) {
			m=zhuanma(m);
		}
		return CommonUtil.getPageJsonStr(pager);
	}



	/**
	 * 到新增页面
	 * @return 
	 */
	@RequestMapping(value = "/gotoAdd",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gotoAdd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/business/linyw_build/addLywBuild_");
		List<CodeBean> ahList = CodeTableManager.getTableList("lyw_ah");
		List<CodeBean> sex = CodeTableManager.getTableList("sex");
		List<CodeBean> lyList = CodeTableManager.getTableList("lyw_ly");
		mav.addObject("ahList",ahList);
		mav.addObject("sex",sex);
		mav.addObject("lyw_ly",lyList);
		UserInfo user = UserCenterService.getCurrentUserInfo();
		LinywModel model = new LinywModel();
		model.setCjrid(user.getUser_id());
		model.setCjrxm(user.getUser_name());
		model.setCjrbmmc(user.getDepartName());
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
	public String doAdd(LywBuild_Model model) {
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
		String id = request.getParameter("ids");
		
		LywBuild_Model qp=new LywBuild_Model();
		
		qp.setId(id);

		LywBuild_Model model =(LywBuild_Model) (service.getInfoById(qp));
		model=zhuanma(model);
		ModelAndView mav = new ModelAndView("/business/linyw_build/editLywBuild_");
		List<CodeBean> ahList = CodeTableManager.getTableList("lyw_lyw_lyah");
		List<CodeBean> lyList = CodeTableManager.getTableList("");
		mav.addObject("ahList",ahList);
		mav.addObject("lyw_ly",lyList);
		mav.addObject("model",model);
		return mav;
	}
	/**
	 * 更新数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doEdit", method = RequestMethod.POST)
	@ResponseBody
	public String doEdit(LywBuild_Model model) {
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
		
		LywBuild_Model qp=new LywBuild_Model();
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
		LywBuild_Model qp=new LywBuild_Model();
		qp.setId(id);
		LywBuild_Model model =(LywBuild_Model) (service.getInfoById(qp));
		model=zhuanma(model);
		ModelAndView mav = new ModelAndView("/business/linyw_build/viewLywBuild_");
		mav.addObject("model",model);
		return mav;
	}

	private LywBuild_Model zhuanma(LywBuild_Model m) {
		//性别转码
		m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
		//出生地省市县
		m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
		m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
		m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));
		//爱好转码
		List<String> l = new ArrayList<String>();
		String ah = m.getLywAh();
		if(ah!=null){
			String[] ah_list = ah.split(",");
			for (String s:ah_list) {
				String real_ah = CodeTableManager.getNameByCode("lyw_ah",s);
				l.add(real_ah);
			}
			//爱好拼接
			String rst_ah = "";
			for (int i = 0; i < l.size() ; i++){
				if(rst_ah==""){
					rst_ah=l.get(i);
				}else {
					rst_ah += "," + l.get(i);
				}
			}
			m.setLywAh(rst_ah);
		}
		//是否有效
		//m.setSfyx(CodeTableManager.getNameByCode("sex",m.getSfyx()));
		if("Y".equals(m.getSfyx())){
			m.setSfyx("是");
		}else {
			m.setSfyx("否");
		}
		//领域转码
		List<String> ly = new ArrayList<String>();
		String lyy = m.getLywLy();
		if(lyy!=null){
			String[] ly_list = lyy.split(",");
			for (String s:ly_list) {
				String real_ly = CodeTableManager.getNameByCode("lyw_ly",s);
				ly.add(real_ly);
			}
			//领域拼接
			String rst_ly = "";
			for (int i = 0; i < ly.size() ; i++){
				if(rst_ly==""){
					rst_ly=ly.get(i);
				}else {
					rst_ly += "," + ly.get(i);
				}
			}
			m.setLywLy(rst_ly);
		}
		//最擅长领域转码
		m.setZscly(CodeTableManager.getNameByCode("lyw_ly",m.getZscly()));
		//部门转码
		m.setBmmc(CodeTableManager.getNameByCode("lyw_bm",m.getBmmc()));
		return m;
	}
}