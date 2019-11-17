package com.hyjx.business.mengt;

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
import java.util.Date;
import java.util.List;

/**
 * @Auther: blackcat
 * @Date: 2019/10/18
 * @Description: com.hyjx.business.mengt
 * @version:
 */
@Controller
@RequestMapping("/mengt")
public class MengtController {
    @Resource
    private MengtService  service;
    @Resource
    private IBaseDao dao;

    // 跳转页面
    @RequestMapping(value = "/gotoList", method = {RequestMethod.GET, RequestMethod.POST})
    public String gotoList(HttpServletRequest request){

        return "/business/mengt/listmengt";
    }

    // 获取列表
    @RequestMapping(value = "/mengtGetList",method = RequestMethod.POST,produces ="application/json; charset=utf-8")
    @ResponseBody
    public String getList(MengtModel model, HttpServletRequest request) {

        Pager pager = dao.getPageList("com.hyjx.business.mengt.queryList", "com.hyjx.business.mengt.queryCount", model);
        List<MengtModel> listInfo=pager.getResultList();
        for(MengtModel single:listInfo){
            // 性别
            single.setSex(CodeTableManager.getNameByCode("sex", single.getSex()));
            // 爱好
            List<String> ah = new ArrayList<String>();
            String ahCode = single.getAh();
            if (ahCode != null) {
                String[] ahBuffer = ahCode.split(",");
                for(String str:ahBuffer){
                    String ahBuffer_Single = CodeTableManager.getNameByCode("mengt_ah",str);
                    ah.add(ahBuffer_Single);
                }
                String ah_after = "";
                for(int count = 0;count<ah.size();count++){
                    if(ah_after==""){
                        ah_after=ah.get(count);
                    }else{
                        ah_after=ah_after+","+ah.get(count);
                    }
                    single.setAh(ah_after);
                }
            }
            // 擅长领域
            List<String> scly = new ArrayList<String>();
            String sclyCode = single.getScly();
            if(sclyCode != null){
                String[] sclyBuffer = sclyCode.split(",");
                for (String str:sclyBuffer){
                    String scly_after = CodeTableManager.getNameByCode("mengt_sc",str);
                    scly.add(scly_after);
                }
                String sc="";
                for (int i=0;i<scly.size();i++){
                    if(sc==""){
                        sc=scly.get(i);
                    }else{
                        sc=sc+","+scly.get(i);
                    }
                }
                single.setScly(sc);
            }
            //省市区转码
            single.setCsdsheng(CodeTableManager.getNameByCode("district",single.getCsdsheng()));
            single.setCsdshi(CodeTableManager.getNameByCode("district",single.getCsdshi()));
            single.setCsdxian(CodeTableManager.getNameByCode("district",single.getCsdxian()));


            try{
                if (single.getSfyx().equals("1")) {
                    single.setSfyx("是");
                }else{
                    single.setSfyx("否");
                }
            }catch(Exception e){
                single.setSfyx("否");
            }

        }

        return CommonUtil.getPageJsonStr(pager);
    }

    // 添加页面
    @RequestMapping(value="/mengtGotoAdd", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView GotoAdd(HttpServletRequest request){
        //爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("mengt_ah");
        //擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("mengt_sc");
        //性别
        List<CodeBean> sex=CodeTableManager.getTableList("sex");

        //跳转到添加页面
        ModelAndView move=new ModelAndView("/business/mengt/addMengt");
        //保存
        move.addObject("ahList",ahList);
        move.addObject("sex",sex);
        move.addObject("scList",scList);;
        //操作人信息，从session里取
        UserInfo user= UserCenterService.getCurrentUserInfo();

        MengtModel model = new MengtModel();
        model.setCjrbmid(user.getDepartCode());
        model.setCjrxm(user.getUser_name());
        model.setCjrid(user.getUser_id());
        model.setCjrbmid(user.getDepart_code());
        model.setCjrbmmc(user.getDepartName());
        model.setSfyx("1");
        // model.setLastdate(new Date().toString());
        // model.setLastdate(new Date().toString());
        //m.addAttribute("model",model);
        move.addObject("model", model);
        System.out.println(user);
        return move;
    }

    //添加提交数据到数据库
    @RequestMapping(value = "/mengtAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(MengtModel model) {
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
        // 从码表调取ID
        //model.setCjrid(CodeTableManager.getCodeByName("mengt_bm",model.getCjrxm()));
        //model.setCjrbmid(CodeTableManager.getCodeByName("mengt_bm",model.getCjrbmmc()));
        //System.out.println("+-1111111111111111model11111111111111111-+"+model);

        model.setLastdate(new Date());
        if(service.add(model)){
            return "success";
        }else{
            return "failure";
        }

    }

    /**
     *  跳转修改页面
     * @param request
     * @return
     */
    @RequestMapping(value="/mengtGotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        //获取id
        String id=request.getParameter("id");
        MengtModel mod = new MengtModel();
        mod.setId(id);
        MengtModel model = (MengtModel) service.getInfoById(mod);
        //System.out.println(model);


        ModelAndView move = new ModelAndView("business/mengt/editMengt");
        move.addObject("model",model);
        //获取爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("mengt_ah");
        move.addObject("ahList",ahList);
        //获取擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("mengt_sc");
        move.addObject("scList",scList);

        return move;
    }

    /**
     *  更新数据
     * @param model
     * @return
     */
    @RequestMapping(value = "/mengtEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(MengtModel model) {
        // 从码表调取ID
        //model.setCjrid(CodeTableManager.getCodeByName("mengt_bm",model.getCjrxm()));
        //model.setCjrbmid(CodeTableManager.getCodeByName("mengt_bm",model.getCjrbmmc()));

        if(service.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

    @RequestMapping(value = "/mengtDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("ids");
        MengtModel model=new MengtModel();
        model.setId(id);
        if(service.delete(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

    @RequestMapping(value = "/mengtGotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        String id = request.getParameter("id");
        MengtModel mod = new MengtModel();
        mod.setId(id);
        MengtModel model = (MengtModel) service.getInfoById(mod);
        //将性别转码
        model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
        //将爱好转码
        List<String> ahl=new ArrayList<String>();
        String ahCode=model.getAh();
        if(ahCode!=null){
            String []AhC=ahCode.split(",");
            for (String str : AhC) {
                String ahs=CodeTableManager.getNameByCode("mengt_ah",str);
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

        ModelAndView move = new ModelAndView("business/mengt/viewMengt");
        move.addObject("model",model);
        return move;
    }

}
