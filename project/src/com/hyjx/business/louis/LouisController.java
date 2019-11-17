package com.hyjx.business.louis;

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
 * @Auther: Louis
 * @Description: com.hyjx.business.louis
 * @version: 1.0
 */

@Controller
@RequestMapping("/louis")
public class LouisController {

    @Resource
    private LouisService service;
    @Resource
    private IBaseDao dao;

    @RequestMapping(value = "/gotoList" )
    public String gotoList(){
        return "/business/louis/listLouis";
    }

    @RequestMapping(value = "/queryList", method = {RequestMethod.POST,RequestMethod.GET},produces = "application/json; charset=utf-8")
    @ResponseBody
    public String queryList(LouisModel model, HttpServletRequest request){
        Pager pager = dao.getPager(model.getModuleName()+".queryList",model.getModuleName()+".queryCount",model);
        System.out.println(pager);
        List<LouisModel> list = pager.getResultList();
        //转码
        for(LouisModel m:list){
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
                    String ahs=CodeTableManager.getNameByCode("louis_ah",str);
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

        return CommonUtil.getPageJsonStr(pager);
    }

    /**
     * 到新增页面
     * @return
     */
    @RequestMapping(value = "/gotoAdd",  method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request) {
        List<CodeBean> ahList = CodeTableManager.getTableList("louis_ah");
        List<CodeBean>sexList=CodeTableManager.getTableList("sex");
        UserInfo user= UserCenterService.getCurrentUserInfo();
        ModelAndView mav = new ModelAndView("/business/louis/addLouis");
        mav.addObject("ahList",ahList);
        mav.addObject("sexList",sexList);
        LouisModel model=new LouisModel();
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
    public String doAdd(LouisModel model) {
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());

        if(service.add(model)){
            return "success";
        }else{
            return "failure";
        }
    }

    /**
     * 查看
     * @param request
     * @return
     */
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request){
        String id = request.getParameter("id");
        LouisModel lModel = new LouisModel();
        lModel.setId(id);
        LouisModel model = (LouisModel) service.getInfoById(lModel);
        //将性别转码
        model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
        //将爱好转码
        List<String>ahl=new ArrayList<String>();
        String ahCode=model.getAh();
        if(ahCode!=null){
            String []AhC=ahCode.split(",");
            for (String str : AhC) {
                String ahs=CodeTableManager.getNameByCode("louis_ah",str);
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

        ModelAndView mav = new ModelAndView("/business/louis/viewLouis");
        mav.addObject("model",model);
        return mav;
    }

    /**
     * 删除
     * request
     * @return
     */
    @RequestMapping(value = "/gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("id");

        LouisModel model=new LouisModel();
        model.setId(id);

        if(service.delete(model)>0){
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
        LouisModel Lmodel=new LouisModel();

        Lmodel.setId(id);

        LouisModel model =(LouisModel) (service.getInfoById(Lmodel));

        ModelAndView mav = new ModelAndView("/business/louis/editLouis");
        List<CodeBean> ahList = CodeTableManager.getTableList("louis_ah");
        List<CodeBean> sexList=CodeTableManager.getTableList("sex");
        mav.addObject("ahList",ahList);
        mav.addObject("sexList",sexList);
        //将出生省市区转码
        model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
        model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
        model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
        //部门名称转码
        model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));
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
    public String doEdit(LouisModel model) {
        if(service.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }
}
