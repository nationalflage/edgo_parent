package com.hyjx.business.liulmNew;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
*
* 描述：用户表 Controller
* @author DESKTOP-UKAB6PO
*
*/
@Controller
@RequestMapping("/liulmnew")
public class  LiulmNewController{
	@Resource
	private LiulmNewService service;

	@Resource
	private IBaseDao dao;
	/**
	 * 到列表页面
	 * @return
	 */
	@RequestMapping(value = "/gotoList" )
	public ModelAndView gotoList(HttpServletRequest request){
		List<CodeBean> sexList = CodeTableManager.getTableList("sex");//获取性别列表
		List<CodeBean> ahList = CodeTableManager.getTableList("liulm_ah");
		List<CodeBean> sclyList = CodeTableManager.getTableList("liulm_scly");
		ModelAndView mav = new ModelAndView("/business/liulmNew/listLiulmNew");
		mav.addObject("sexList",sexList);
		mav.addObject("ahList",ahList);
		mav.addObject("sclyList",sclyList);
		return mav;
	}
	/**
	 * 查询列表数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryList" , method = {RequestMethod.POST,RequestMethod.GET},produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(LiulmNewModel model,HttpServletRequest request){
		Pager pager = dao.getPager(model.getModuleName()+".queryList",model.getModuleName()+".queryCount",model);
		List<LiulmNewModel> list = pager.getResultList();
		for(LiulmNewModel m : list){
			codeToChinese(m);
		}
		return CommonUtil.getPageJsonStr(pager);
	}

	/**
	 * 到新增页面
	 * @return 
	 */
	@RequestMapping(value = "/gotoAdd",  method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gotoAdd(HttpServletRequest request) {
		UserInfo user = UserCenterService.getCurrentUserInfo();//获取当前登陆用户信息
		LiulmNewModel model = new LiulmNewModel();

		model.setCreatedId(user.getUser_id());//获取创建人Id
		model.setCreatedName(user.getUser_name());//获取创建人姓名
		model.setCreatedDeptId(user.getDepartCode());//获取创建人部门Id
		model.setCreatedDeptName(user.getDepartName());//获取创建人部门名称

		List<CodeBean> ahList = CodeTableManager.getTableList("liulm_ah");//获取爱好列表
        List<CodeBean> sexList = CodeTableManager.getTableList("sex");//获取性别列表
		ModelAndView mav = new ModelAndView("/business/liulmNew/addLiulmNew");
		mav.addObject("sexList",sexList);
		mav.addObject("ahList",ahList);
		mav.addObject("model",model);
		return mav;
	}
	/**
	 * 保存对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doAdd", method = RequestMethod.POST)
	@ResponseBody
	public String doAdd(LiulmNewModel model) {
		model.setId(StringHelper.getPrimaryKey());
		model.setDeptId(model.getDeptName());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = format.format(new Date());
		model.setCreatedTime(nowTime);//获取当前时间
		System.out.println("当前时间为："+nowTime);
		//System.out.println("当前时间为："+new Date().toString());//格式为：Thu Dec 06 16:07:27 CST 2018
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
		LiulmNewModel qp=new LiulmNewModel();
		qp.setId(id);
		LiulmNewModel model =(LiulmNewModel) (service.getInfoById(qp));
		List<CodeBean> sexList = CodeTableManager.getTableList("sex");//获取性别列表
		List<CodeBean> ahList = CodeTableManager.getTableList("liulm_ah");//获取爱好列表
		ModelAndView mav = new ModelAndView("/business/liulmNew/editLiulmNew");
        mav.addObject("sexList",sexList);
        mav.addObject("ahList",ahList);
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
	public String doEdit(LiulmNewModel model) {
		model.setDeptId(model.getDeptName());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = format.format(new Date());
		model.setModifiedTime(nowTime);//获取当前时间
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
		
		LiulmNewModel qp=new LiulmNewModel();
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
		LiulmNewModel qp=new LiulmNewModel();
		qp.setId(id);
		LiulmNewModel model =(LiulmNewModel) (service.getInfoById(qp));
		codeToChinese(model);//转码
		ModelAndView mav = new ModelAndView("/business/liulmNew/viewLiulmNew");
		mav.addObject("model",model);
		return mav;
	}

	/**
	 * 对model对象进行转码
	 * @param m
	 */
	private void codeToChinese(LiulmNewModel m) {
		m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));//性别转码
		m.setCsdProvince(CodeTableManager.getNameByCode("district",m.getCsdProvince()));//出生省转码
		m.setCsdCity(CodeTableManager.getNameByCode("district",m.getCsdCity()));//出生市转码
		m.setCsdArea(CodeTableManager.getNameByCode("district",m.getCsdArea()));//出生县转码
		m.setDeptName(CodeTableManager.getNameByCode("gszbm",m.getDeptId()));//部门转码
		m.setScly(CodeTableManager.getNameByCode("liulm_scly",m.getScly()));//擅长领域转码
		//爱好转码
		StringBuilder hobbys = new StringBuilder();
		if(m.getHobby()!=null){
			String [] hobbyArr = m.getHobby().split(",");
			for(int i=0;i<hobbyArr.length;i++){
				String hobbyName = CodeTableManager.getNameByCode("liulm_ah",hobbyArr[i]);
				hobbys.append(hobbyName);
				if(i<hobbyArr.length-1){//不给最后一个爱好后面添加逗号
					hobbys.append(",");
				}
			}
		}
		m.setHobby(hobbys.toString());
		//是否有效转码
		if("1".equals(m.getValid())){
			m.setValid("是");
		}else {
			m.setValid("否");
		}
	}

}