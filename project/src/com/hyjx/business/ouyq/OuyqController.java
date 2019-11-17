package com.hyjx.business.ouyq;

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

@Controller
@RequestMapping("/ouyq")
public class OuyqController {
    @Resource
    private OuyqService service;
    @Resource
    private IBaseDao dao;

    /**
     * 跳转列表显示
     * @param  request
     * @return
     */
    @RequestMapping(value="/gotoList")
    public  String gotoList(HttpServletRequest request){

        return "/business/ouyq/listOuyq";
    }
    /**
     * 获取列表
     * @param model
     * @param request
     * @return
     */
   @RequestMapping(value="/queryList", method=RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String queryList(OuyqModel model,HttpServletRequest request){
       Pager pager=dao.getPageList("com.hyjx.business.ouyq.queryList","com.hyjx.business.ouyq.queryCount",model);
       List<OuyqModel> list=pager.getResultList();
       //转码
       for (OuyqModel m:list) {
           //性别转码
           m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
           //爱好转码---多个
           List<String> ah1=new ArrayList<String>();
           String ahCode=m.getAh();
           //将得到的ahCode按“，”切分
           if (ahCode!=null){
               String[] AhC=ahCode.split(",");
               for (String str:AhC) {
                   //每个爱好名称
                   String ahs= CodeTableManager.getNameByCode("ouyq_ah",str);
                   ah1.add(ahs);
               }
               String ah="";
               for (int i=0;i<ah1.size();i++){
                   if(ah==""){
                       ah=ah1.get(i);
                   }else{
                       ah=ah+","+ah1.get(i);
                   }
               }
               m.setAh(ah);
           }
           //擅长领域转码---多个
           List<String> sc1=new ArrayList<String>();
           String scCode=m.getScly();
           //将得到的scCode按“，”切分
           if (scCode!=null){
               String[] ScC=scCode.split(",");
               for (String str:ScC) {
                   //每个擅长领域名称
                   String scs= CodeTableManager.getNameByCode("ouyq_scly",str);
                   sc1.add(scs);
               }
               String sc="";
               for (int i=0;i<sc1.size();i++){
                   if(sc==""){
                       sc=sc1.get(i);
                   }else{
                       sc=sc+","+sc1.get(i);
                   }
               }
               m.setScly(sc);
           }
           //省市区转码
           m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
           m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
           m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));
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
       //对象转json
       return CommonUtil.getPageJsonStr(pager);
   }

    /**
     * 到新增页面
     * @return
     */
    @RequestMapping(value="/gotoAdd", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request) {
        //获取爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("ouyq_ah");
        System.out.println(ahList.toString()+"检查bug");

        //获取擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("ouyq_scly");
        //获取性别
        List<CodeBean> sex=CodeTableManager.getTableList("sex");

        //跳转到添加页面
        ModelAndView mav=new ModelAndView("/business/ouyq/addOuyq");
       //保存
        mav.addObject("ahList",ahList);
        mav.addObject("sex",sex);
        mav.addObject("scList",scList);

        //添加人（操作人）信息，从session里取
        UserInfo user= UserCenterService.getCurrentUserInfo();

        //实体信息
        OuyqModel model=new OuyqModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmid(user.getDepartName());
        model.setSfyx("1");
        model.setCjrbmmc(user.getDepartName());
        mav.addObject("model", model);
        return mav;
    }

    /**
     * 保存添加对象至数据库
     * @param model
     * @return
     */
    @RequestMapping(value = "/doAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(OuyqModel model) {
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
     * @return
     */
    @RequestMapping(value="/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        //获取id
        String id=request.getParameter("id");

        //创建对象
        OuyqModel om=new OuyqModel();
        om.setId(id);
        //根据id获取对象信息
        OuyqModel model= (OuyqModel) service.getInfoById(om);

        //跳转编辑页面
        ModelAndView mav = new ModelAndView("business/ouyq/editOuyq");
        mav.addObject("model",model);
        //获取爱好
        List<CodeBean> ahList=CodeTableManager.getTableList("ouyq_ah");
        mav.addObject("ahList",ahList);

        //获取擅长领域
        List<CodeBean> scList=CodeTableManager.getTableList("ouyq_scly");
        mav.addObject("scList",scList);
        return mav;
    }
    /**
     * 保存更新数据
     * @param model
     * @return
     */
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(OuyqModel model) {


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

        OuyqModel model=new OuyqModel();
        model.setId(id);

        if(service.delete(model)>0){
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
        OuyqModel om=new OuyqModel();
        om.setId(id);
        OuyqModel model =(OuyqModel) (service.getInfoById(om));

        //将性别转码
        model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
        //将爱好转码
        List<String> ahl=new ArrayList<String>();
        String ahCode=model.getAh();
        if(ahCode!=null){
            String []AhC=ahCode.split(",");
            for (String str : AhC) {
                String ahs=CodeTableManager.getNameByCode("ouyq_ah",str);
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
        //擅长领域转码---多个
        List<String> sc1=new ArrayList<String>();
        String scCode=model.getScly();
        //将得到的scCode按“，”切分
        if (scCode!=null){
            String[] ScC=scCode.split(",");
            for (String str:ScC) {
                //每个擅长领域名称
                String scs= CodeTableManager.getNameByCode("ouyq_scly",str);
                sc1.add(scs);
            }
            String sc="";
            for (int i=0;i<sc1.size();i++){
                if(sc==""){
                    sc=sc1.get(i);
                }else{
                    sc=sc+","+sc1.get(i);
                }
            }
            model.setScly(sc);
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
        ModelAndView mav = new ModelAndView("business/ouyq/viewOuyq");
        mav.addObject("model",model);
        return mav;
    }
}
