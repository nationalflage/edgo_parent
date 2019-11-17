package com.hyjx.business.guox;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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

@Controller
@RequestMapping("/guox")
public class GuoxController {

    @Resource
    private GuoxService service;
    @Resource
    private IBaseDao dao;
    /**
     * 表页面
     */
    @RequestMapping(value="/gotoList")
    public String gotoList(HttpServletRequest requst){

        return "/business/guox/listGuox";
    }
    /**
     * 获取表
     */
    @RequestMapping(value="/queryList",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody

    public String queryList(GuoxModel model,HttpServletRequest requst){

        Pager pager=dao.getPager("com.hyjx.business.guox.queryList", "com.hyjx.business.guox.queryCount", model);
        List<GuoxModel> list=pager.getResultList();
        //转码
        for(GuoxModel m:list){
            //性别转码
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));

            //爱好转码
            String ah=m.getAh();
            ah_re(m, ah);
            String scly=m.getScly();
            scly_re(m, scly);
            //有效值转码
            String sfyxcode=m.getSfyx();
            if(sfyxcode== null){
                sfyxcode="0";
            }
            if(sfyxcode.equals("1") ){
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

    private void ah_re(GuoxModel m, String ah) {
        if(ah!=null){
            String[] ah_temp = ah.split(",");
            StringBuilder aha= new StringBuilder();
            for (String str : ah_temp){
                String ah_str = CodeTableManager.getNameByCode("guox_ah",str);
                if(aha.toString().equals("")){
                    aha = new StringBuilder(ah_str);
                }else{
                    aha.append(",").append(ah_str);
                }
            }
            System.out.println(aha);
            m.setAh(aha.toString());
        }
    }

    private void scly_re(GuoxModel m, String scly) {
        if(scly!=null){
            String[] scly_temp = scly.split(",");
            StringBuilder sclya= new StringBuilder();
            for (String str : scly_temp){
                String scly_str = CodeTableManager.getNameByCode("guox_scly",str);
                if(sclya.toString().equals("")){
                    sclya = new StringBuilder(scly_str);
                }else{
                    sclya.append(",").append(scly_str);
                }
            }
            System.out.println(sclya);
            scly = sclya.toString();
            m.setScly(scly);
        }
    }
    /**
     * 添加
     */
    @RequestMapping(value="/gotoAdd",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(){
        List<CodeBean>ahList=CodeTableManager.getTableList("guox_ah");
        List<CodeBean>sclyList=CodeTableManager.getTableList("guox_scly");
        List<CodeBean>sex=CodeTableManager.getTableList("sex");
        ModelAndView mav=new ModelAndView("/business/guox/addGuox");

        mav.addObject("ahList",ahList);
        mav.addObject("sclyList",sclyList);
        mav.addObject("sex", sex);

        /*
         * 添加人信息
         */
        UserInfo user=UserCenterService.getCurrentUserInfo();

        GuoxModel model =new GuoxModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmmc(user.getDepartName());
        model.setCjrbmid(user.getDepartCode());

        mav.addObject("model", model);
        System.out.println(user);
        return mav;
    }

    /**
     * 保存对象
     */
    @RequestMapping(value = "/doAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(GuoxModel model) {
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
        if(service.add(model)){
            return "success";
        }else{
            return "failure";
        }
    }
    /**
     * 修改页面
     */
    @RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        String id = request.getParameter("id");

        GuoxModel qp=new GuoxModel();

        qp.setId(id);

        GuoxModel model =(GuoxModel) (service.getInfoById(qp));

        ModelAndView mav = new ModelAndView("business/guox/editGuox");
        mav.addObject("model",model);

        List<CodeBean> sclyList = CodeTableManager.getTableList("guox_scly");
        mav.addObject("sclyList",sclyList);

        List<CodeBean> ahList = CodeTableManager.getTableList("guox_ah");
        mav.addObject("ahList",ahList);


        return mav;
    }
    /**
     * 更新数据
     */
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(GuoxModel model) {
        if(service.edit(model)>0){
            return "success";
        }else{
            return "fail";
        }
    }
    /**
     * 删除
     */
    @RequestMapping(value = "/gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("ids");

        GuoxModel gm=new GuoxModel();
        gm.setId(id);

        if(service.delete(gm)>0){
            return "success";
        }else{
            return "failure";
        }
    }
    /**
     * 查看页面
     */
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        String id = request.getParameter("id");
        GuoxModel gm=new GuoxModel();
        gm.setId(id);
        GuoxModel model =(GuoxModel) (service.getInfoById(gm));
        //将性别转码


        model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
        //将爱好转码
        String ah=model.getAh();
        ah_re(model, ah);
        String scly=model.getScly();
        scly_re(model, scly);
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
        ModelAndView mav = new ModelAndView("/business/guox/viewGuox");
        //将部门转码
        System.out.println("age"+model.getAge());
        System.out.println("11"+model.getBmid());
        System.out.println("model.getBmmc()="+model.getBmmc());
        model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));
        mav.addObject("model",model);
        return mav;
    }
}
