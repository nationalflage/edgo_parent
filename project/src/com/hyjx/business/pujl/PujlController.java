package com.hyjx.business.pujl;


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
import java.text.Format;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/pujl")
public class PujlController {

//    加载资源
    @Resource
    private PujlService service;
    @Resource
    private IBaseDao dao;

//    跳转列表
@RequestMapping(value="/PujlGotoList")
public  String gotoList(HttpServletRequest request){
    return "/business/pujl/listPujl";
}

//    获取列表
    @RequestMapping(value = "/PujlGetList",method = RequestMethod.POST,produces ="application/json; charset=utf-8")
    @ResponseBody
    public String getList(PujlModel model, HttpServletRequest request) {

        if(model.getAh() != null){
            List<String> ah = new ArrayList<String>();
            String ahCode = model.getAh();
            if (ahCode != null) {
                String[] ahBuffer = ahCode.split(",");
                for(String str:ahBuffer){
                    String ahBuffer_Single = CodeTableManager.getCodeByName("pujl_ah",model.getAh());
                    ah.add(ahBuffer_Single);
                }
                String ah_after = "";
                for(int count = 0;count<ah.size();count++){
                    if(ah_after==""){
                        ah_after=ah.get(count);
                    }else{
                        ah_after=ah_after+","+ah.get(count);
                    }
                    model.setAh(ah_after);
                }
            }
        }

        Pager pager = dao.getPageList("com.hyjx.business.pujl.queryList", "com.hyjx.business.pujl.queryCount", model);
        List<PujlModel> listInfo=pager.getResultList();
//        开始转码
        for(PujlModel single:listInfo){
//            性别
            single.setSex(CodeTableManager.getNameByCode("sex", single.getSex()));
//            爱好
            List<String> ah = new ArrayList<String>();
            String ahCode = single.getAh();
            if (ahCode != null) {
                String[] ahBuffer = ahCode.split(",");
                for(String str:ahBuffer){
                    String ahBuffer_Single = CodeTableManager.getNameByCode("pujl_ah",str);
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
//            擅长领域
            List<String> scly = new ArrayList<String>();
            String sclyCode = single.getscly();
            if(sclyCode != null){
                String[] sclyBuffer = sclyCode.split(",");
                for (String str:sclyBuffer){
                    String scly_after = CodeTableManager.getNameByCode("pujl_scly",str);
                    scly.add(scly_after);
                }
                String scly_fin="";
                for(int count=0;count<scly.size();count++){
                    if(scly_fin==""){
                        scly_fin = scly.get(count);
                    }else {
                        scly_fin=scly_fin+","+scly.get(count);
                    }
                }
                single.setscly(scly_fin);
            }
//            地址转码
            single.setCsdsheng(CodeTableManager.getNameByCode("district", single.getCsdsheng()));
            single.setCsdshi(CodeTableManager.getNameByCode("district",single.getCsdshi()));

//            县是否为空
            if(single.getCsdxian()==null){

            }else if(!single.getCsdxian().equals("暂缺")){
                single.setCsdxian(CodeTableManager.getNameByCode("district",single.getCsdxian()));
            }

//            是否有效
            try{
                if (single.getsfyx().equals("1")) {
                    single.setsfyx("是");
                }else{
                    single.setsfyx("否");
                }
            }catch(Exception e){
                single.setsfyx("否");
            }

        }
        return CommonUtil.getPageJsonStr(pager);
    }

//    添加页面
    @RequestMapping(value="/PujlGotoAdd", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request) {
    //  获取码表
        //爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("pujl_ah");
        //擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("pujl_scly");
        //性别
        List<CodeBean> sex=CodeTableManager.getTableList("sex");

        //跳转到添加页面
        ModelAndView move=new ModelAndView("/business/pujl/addPujl");

        //保存
        move.addObject("ahList",ahList);
        move.addObject("sex",sex);
        move.addObject("scList",scList);

        //操作人信息，从session里取
        UserInfo user= UserCenterService.getCurrentUserInfo();

        //实体信息
        PujlModel model=new PujlModel();
        model.setcjrbmid(user.getDepartCode());
        model.setcjrxm(user.getUser_name());
        model.setcjrid(user.getUser_id());
        model.setcjrbmid(user.getDepart_code());
        model.setcjrbmmc(user.getDepartName());
        model.setsfyx("1");
        move.addObject("model", model);
        return move;
    }

//    提交数据到数据库
    @RequestMapping(value = "/PujlAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(PujlModel model) {
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());

//        从码表调取ID
        model.setcjrid(CodeTableManager.getCodeByName("pujl_bm",model.getcjrxm()));
        model.setcjrbmid(CodeTableManager.getCodeByName("pujl_bm",model.getcjrbmmc()));

//        不想看见县的NULL
        if(model.getCsdxian() == null || model.getCsdxian() == ""){
            model.setCsdxian("暂缺");
        }

        if(service.add(model)){
            return "success";
        }else{
            return "failure";
        }
    }

//    修改页面
    @RequestMapping(value="/PujlGotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        //获取id
        String id=request.getParameter("id");
        //创建对象
        PujlModel update=new PujlModel();
        update.setId(id);
        //根据id获取对象信息
        PujlModel model= (PujlModel) service.getInfoById(update);
        //跳转编辑页面
        ModelAndView move = new ModelAndView("business/pujl/editPujl");
        move.addObject("model",model);
        //获取爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("pujl_ah");
        move.addObject("ahList",ahList);
        //获取擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("pujl_scly");
        move.addObject("scList",scList);
        return move;
    }

//    更新提交
    @RequestMapping(value = "/PujlEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(PujlModel model) {
    //        从码表调取ID
        model.setcjrid(CodeTableManager.getCodeByName("pujl_bm",model.getcjrxm()));
        model.setcjrbmid(CodeTableManager.getCodeByName("pujl_bm",model.getcjrbmmc()));

    //        不想看见县的NULL
        if(model.getCsdxian() == null || model.getCsdxian() == ""){
            model.setCsdxian("暂缺");
        }

        if(service.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

//    删除
    @RequestMapping(value = "/PujlDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("ids");
        PujlModel model=new PujlModel();
        model.setId(id);
        if(service.delete(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

//    详细信息
    @RequestMapping(value = "/PujlGotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
//    需要查询的ID
        String id = request.getParameter("id");

        PujlModel singleBuffer=new PujlModel();
        singleBuffer.setId(id);
        PujlModel single=(PujlModel) (service.getInfoById(singleBuffer));

//            性别
        single.setSex(formatSex(single.getSex()));
//            爱好
        List<String> ah = new ArrayList<String>();
        String ahCode = single.getAh();
        if (ahCode != null) {
            String[] ahBuffer = ahCode.split(",");
            for(String str:ahBuffer){
                String ahBuffer_Single = CodeTableManager.getNameByCode("pujl_ah",str);
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
//            擅长领域
        List<String> scly = new ArrayList<String>();
        String sclyCode = single.getscly();
        if(sclyCode != null){
            String[] sclyBuffer = sclyCode.split(",");
            for (String str:sclyBuffer){
                String scly_after = CodeTableManager.getNameByCode("pujl_scly",str);
                scly.add(scly_after);
            }
            String scly_fin="";
            for(int count=0;count<scly.size();count++){
                if(scly_fin==""){
                    scly_fin = scly.get(count);
                }else {
                    scly_fin=scly_fin+","+scly.get(count);
                }
            }
            single.setscly(scly_fin);
        }
//            地址转码
        single.setCsdsheng(CodeTableManager.getNameByCode("district", single.getCsdsheng()));
        single.setCsdshi(CodeTableManager.getNameByCode("district",single.getCsdshi()));

//            县是否为空
        if(single.getCsdxian()==null){

        }else if(!single.getCsdxian().equals("暂缺")){
            single.setCsdxian(CodeTableManager.getNameByCode("district",single.getCsdxian()));
        }

//            是否有效
        try{
            if (single.getsfyx().equals("1")) {
                single.setsfyx("是");
            }else{
                single.setsfyx("否");
            }
        }catch(Exception e){
            single.setsfyx("否");
        }

        ModelAndView move = new ModelAndView("business/pujl/viewPujl");
        move.addObject("model",single);
        return move;
    }

    @RequestMapping(value = "/PujlExport")
    @ResponseBody
    public ModelAndView export(HttpServletRequest request){
        return null;
    }

    private String formatSex(String sexCode){
        return CodeTableManager.getNameByCode("sex",sexCode);
    }

}
