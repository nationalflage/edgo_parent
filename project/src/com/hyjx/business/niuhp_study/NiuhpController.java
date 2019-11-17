package com.hyjx.business.niuhp_study;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.orm.dao.Pager;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.uc.user.UserInfo;
import com.mysql.fabric.xmlrpc.base.Array;

import org.apache.taglibs.standard.tag.common.core.ForEachSupport;
import org.bouncycastle.jcajce.provider.asymmetric.dsa.DSASigner.detDSA;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONArray;
/**
 * 控制器
 * @author i
 *
 */
@Controller
@RequestMapping("/haopeng")
public class  NiuhpController{
	@Resource
	private NiuhpService service;
    @Resource
    private IBaseDao dao;
    @Resource
    private NiuhpDeptService dservice;
    
	/**
	 * 到列表页面
	 * @return
	 */
	@RequestMapping(value = "/gotoList" )
	public String gotoList(HttpServletRequest request){
		return "/business/niuhp/listNiuhp";
	}
	/**
	 * 查询列表数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryList(NiuhpModel model,HttpServletRequest request){
        Pager pager = dao.getPager("com.hyjx.business.niuhp_study.queryList", "com.hyjx.business.niuhp_study.queryCount", model);
        List<NiuhpModel> list=pager.getResultList();
        //转码
        for(NiuhpModel m:list){
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
    				String ahs=CodeTableManager.getNameByCode("niuhp_ah",str);
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
            String sfcode=m.getSfyx();
            if(sfcode.equals("1")){
            	m.setSfyx("是");
            }else{
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
		List<CodeBean> ahList = CodeTableManager.getTableList("niuhp_ah");
		List<CodeBean>sexList=CodeTableManager.getTableList("sex");
		UserInfo user=UserCenterService.getCurrentUserInfo();
		ModelAndView mav = new ModelAndView("/business/niuhp/addNiuhp");
		mav.addObject("ahList",ahList);
		mav.addObject("sexList",sexList);
		NiuhpModel model=new NiuhpModel();
		model.setCjrid(user.getUser_id().toString());
		model.setCjrxm(user.getUser_name().toString());
		model.setCjrbmid(user.getDepart_code().toString());
		model.setCjrbmmc(user.getDepartName().toString());
		model.setSfyx("1");
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
	public String doAdd(NiuhpModel model) {
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
		
		NiuhpModel qp=new NiuhpModel();
		
		qp.setId(id);

		NiuhpModel model =(NiuhpModel) (service.getInfoById(qp));
		
		ModelAndView mav = new ModelAndView("/business/niuhp/editNiuhp");
		mav.addObject("model",model);
		List<CodeBean> ahList = CodeTableManager.getTableList("niuhp_ah");
		CodeTableManager.reloadCodeTable("gsbm");
		List<CodeBean>cityCode=CodeTableManager.getSubCodeList("district", model.getCsdsheng());
		List<CodeBean>areaCode=CodeTableManager.getSubCodeList("district", model.getCsdshi());
		System.out.println(areaCode);
		mav.addObject("cityCode",cityCode);
		mav.addObject("areaCode",areaCode);
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
	public String doEdit(NiuhpModel model) {
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
		
		NiuhpModel qp=new NiuhpModel();
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
		NiuhpModel qp=new NiuhpModel();
		qp.setId(id);
		NiuhpModel model =(NiuhpModel) (service.getInfoById(qp));
		//将性别转码
		 model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
		 //将爱好转码
         List<String>ahl=new ArrayList<String>();
         String ahCode=model.getAh();
         if(ahCode!=null){
         	String []AhC=ahCode.split(",");
             for (String str : AhC) {
 				String ahs=CodeTableManager.getNameByCode("niuhp_ah",str);
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
         String sfcode=model.getSfyx();
         if(sfcode.equals("1")){
         	model.setSfyx("是");
         }else{
         	model.setSfyx("否");
         }
         //部门名称转码
        
        model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));
		ModelAndView mav = new ModelAndView("/business/niuhp/viewNiuhp");
		mav.addObject("model",model);
		return mav;
	}
	@RequestMapping("/getTree")
	@ResponseBody
	public List<NiuhpDept> getTree(){
		
		List<NiuhpDept>root=dao.queryObjectList("queryDeptParent1", "18080900");
		//JSONArray jsonArray=JSONArray.fromObject(buildTree(root));
		// buildTree(root)
		return root;
	}
	/*public List<NiuhpDept>buildTree(List<NiuhpDept>root){
		for(int i=0;i<root.size();i++){
			List<NiuhpDept>children=dao.queryObjectList(root.get(i).getCode());
			buildTree(children);
			root.get(i).setChildren(children);
		}
		return root;
	}*/
}