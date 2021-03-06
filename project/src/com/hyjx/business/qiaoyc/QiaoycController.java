package com.hyjx.business.qiaoyc;

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
 * @author qyc
 * @date 2018-12-18 17:32
 * 描述：control
 **/
@Controller
@RequestMapping("/qiaoyc")
public class QiaoycController {
    @Resource
    private QiaoycService service;
    @Resource
    private IBaseDao dao;
    /*列表页面01*/
    //http://localhost:8080/qiaoyc/queryList.xhtml
    @RequestMapping("/gotoList")
    public String gotoList(HttpServletRequest request){
        return "/business/qiaoyc/listQiaoyc";
    }
    /*查询列表页面02*/
    //http://localhost:8080/qiaoyc/queryList.xhtml?random=0.19747857352232256
    @RequestMapping(value="/queryList",method= RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryList(QiaoycModel model, HttpServletRequest request){
        //分页   ？？？？     s:单页列表数   s1:查询到的列表总数    model:实体类      ？？？？
        Pager pager = dao.getPager("com.hyjx.business.qiaoyc.queryList", "com.hyjx.business.qiaoyc.queryCount", model);
        List<QiaoycModel> list=pager.getResultList();
        //转码
        for(QiaoycModel m:list){
            //部门名称
            m.setBmmc(CodeTableManager.getNameByCode("gszbm", m.getBmmc()));
            //将性别转码   码表：1 男   2 女
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
            //将爱好转码  码表
            List<String>ahl=new ArrayList<String>();
            String ahCode=m.getAh();
            if(ahCode!=null){
                String []AhC=ahCode.split(",");
                for (String str : AhC) {
                    String ahs=CodeTableManager.getNameByCode("qiaoyc_ah",str);
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
            try {
                if(sfcode.equals("1")){
                    m.setSfyx("是");
                }else{
                    m.setSfyx("否");
                }
            }catch (Exception e){
                m.setSfyx("否");
            }
            //将擅长领域领域转码  码表
            List<String>scly=new ArrayList<String>();
            String sclyCode=m.getScly();
            if(sclyCode!=null){
                String []SCLY=sclyCode.split(",");
                for (String str : SCLY) {
                    String woscly=CodeTableManager.getNameByCode("qiaoyc_scly",str);
                    scly.add(woscly);
                }
                String wodscly="";
                for (int i = 0; i < scly.size(); i++) {
                    if (wodscly=="") {
                        wodscly=scly.get(i);
                    }else {
                        wodscly=wodscly+","+scly.get(i);
                    }
                }
                m.setScly(wodscly);
            }
            //最擅长领域转码
            m.setZsc(CodeTableManager.getNameByCode("qiaoyc_scly",m.getZsc()));
        }
        return  CommonUtil.getPageJsonStr(pager);
    }
    /**
     * 到新增页面
     * @return
     */
    //http://localhost:8080/qiaoyc/gotoAdd.xhtml
    @RequestMapping(value = "/gotoAdd",  method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request) {
        /*
         * 爱好
         */
        List<CodeBean> ahList = CodeTableManager.getTableList("qiaoyc_ah");
        /*
         * 擅长领域
         */
        List<CodeBean> sclyList = CodeTableManager.getTableList("qiaoyc_scly");
        /*性别*/
        List<CodeBean> sex=CodeTableManager.getTableList("sex");
        /*页面*/
        ModelAndView mav = new ModelAndView("business/qiaoyc/addQiaoyc");
        mav.addObject("ahList",ahList);
        mav.addObject("sclyList",sclyList);
        mav.addObject("sex",sex);
        /*
         * 添加人信息  从session中获取
         */
        UserInfo user= UserCenterService.getCurrentUserInfo();
        /*实体数据
         */
        QiaoycModel model=new QiaoycModel();
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
    //http://localhost:8080/qiaoyc/doAdd.xhtml
    @RequestMapping(value = "/doAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(QiaoycModel model) {
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
    //http://localhost:8080/qiaoyc/gotoEdit.xhtml?id=7d6121a66add44e59656f3cae1bf9d3c
    @RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        String id = request.getParameter("id");
        QiaoycModel qp=new QiaoycModel();
        qp.setId(id);
        //qp.setBmmc(CodeTableManager.getNameByCode("gszbm", qp.getBmmc()));//转码
        QiaoycModel model =(QiaoycModel) (service.getInfoById(qp));
        ModelAndView mav = new ModelAndView("business/qiaoyc/editQiaoyc");
        List<CodeBean> ahList = CodeTableManager.getTableList("qiaoyc_ah");
        List<CodeBean> sclyList = CodeTableManager.getTableList("qiaoyc_scly");
        //List<CodeBean> bmmc = CodeTableManager.getTableList("gszbm");
        mav.addObject("ahList",ahList);
        mav.addObject("sclyList",sclyList);
        //mav.addObject("gszbm",bmmc);
        mav.addObject("model",model);
        return mav;
    }
    /**
     * 更新数据
     * @param model
     * @return
     */
    //http://localhost:8080/qiaoyc/doEdit.xhtml
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(QiaoycModel model) {
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
    //http://localhost:8080/qiaoyc/gotoDelete.xhtml?ids=c14cfd2315c648388c84b5426e2c2289
    @RequestMapping(value = "/gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("ids");
        QiaoycModel qp=new QiaoycModel();
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
        QiaoycModel qp=new QiaoycModel();
        qp.setId(id);
        QiaoycModel model =(QiaoycModel) (service.getInfoById(qp));
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
                String ahs=CodeTableManager.getNameByCode("qiaoyc_ah",str);
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
        try {
            if(sfcode.equals("1")){
                model.setSfyx("是");
            }else{
                model.setSfyx("否");
            }
        }catch (Exception e){
            model.setSfyx("否");
        }
        //将擅长领域领域转码  码表
        List<String>scly=new ArrayList<String>();
        String sclyCode=model.getScly();
        if(sclyCode!=null){
            String []SCLY=sclyCode.split(",");
            for (String str : SCLY) {
                String woscly=CodeTableManager.getNameByCode("qiaoyc_scly",str);
                scly.add(woscly);
            }
            String wodscly="";
            for (int i = 0; i < scly.size(); i++) {
                if (wodscly=="") {
                    wodscly=scly.get(i);
                }else {
                    wodscly=wodscly+","+scly.get(i);
                }
            }
            model.setScly(wodscly);
        }
        //最擅长领域转码
        model.setZsc(CodeTableManager.getNameByCode("qiaoyc_scly",model.getZsc()));
        ModelAndView mav = new ModelAndView("business/qiaoyc/viewQiaoyc");
        mav.addObject("model",model);
        return mav;
    }
    /*@RequestMapping("json")
    @ResponseBody
    public List<CodeBean> getBumen(){
        List<CodeBean>list = CodeTableManager.getTableList("bmcj");
        System.out.println("List----------数据打印"+list.toString());
        return  list;
    }*/

}
