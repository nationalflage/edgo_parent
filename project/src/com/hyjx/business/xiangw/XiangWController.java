package com.hyjx.business.xiangw;

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
@RequestMapping("/xiangw")
public class XiangWController {
    @Resource
    private XiangWService service;
    @Resource
    IBaseDao dao;

    @RequestMapping(value = "/gotoList")
    public String gotoList(){
        return "business/xiangw/listXiangw";
    }
    @RequestMapping(value = "/queryList",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public  String queryList(XiangWModel model){
    //获取信息，分页
        Pager pager=dao.getPager("com.hyjx.business.xiangw.queryList","com.hyjx.business.xiangw.queryCount",model);
        List<XiangWModel> modelList=pager.getResultList();
     for (XiangWModel m: modelList) {
            //性别转码
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
       //获取爱好
            List<String> list=new ArrayList<String>();
            String ahList=m.getAh();
            //拆分,爱好转码
            if (ahList!=null){
                String[] allAh= ahList.split(",");
                  for (String ahs:allAh) {
                String ah=CodeTableManager.getNameByCode("xiangw_ah",ahs);
                list.add(ah);
                  }
                  //拼接爱好
                String ahs="";
                  for (int i=0;i<list.size();i++){
                      if (ahs==""){
                          ahs=list.get(i);
               }else{
                   ahs+=","+list.get(i);
               }
           }
           m.setAh(ahs);
            }
            //擅长领域
            List<String> list1=new ArrayList<String>();
            String sclyList=m.getScly();
            if (sclyList!=null){
                String[] allScly=sclyList.split(",");
                for (String sclys:allScly){
                    //擅长领域转码
                    String scly=CodeTableManager.getNameByCode("xiangw_scly",sclys);
                    list1.add(scly);
                }

                //擅长拼接
                String sclys="";
                for (int i=0;i<list1.size();i++){
                    if (sclys==""){
                        sclys=list1.get(i);
                    }else{
                        sclys+=","+list1.get(i);
                    }
                }
               m.setScly(sclys);
            }

            //有效值
            String sfyx=m.getSfyx();
            if ("1".equals(sfyx)){
                m.setSfyx("是");
            }else {
                m.setSfyx("否");
            }
            //地址转码
            m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
            m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
            m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));

        }
        return CommonUtil.getPageJsonStr(pager);
    }

    //添加页面
    @RequestMapping(value = "/gotoAdd",method = {RequestMethod.GET,RequestMethod.POST})
        public ModelAndView gotoAdd(HttpServletRequest request){
        ModelAndView mav=new ModelAndView("/business/xiangw/addXiangw");
        List<CodeBean> ahList=CodeTableManager.getTableList("xiangw_ah");
        mav.addObject("ahList",ahList);
        List<CodeBean> sex=CodeTableManager.getTableList("sex");
        mav.addObject("sex",sex);
        List<CodeBean> sclyList=CodeTableManager.getTableList("xiangw_scly");
        mav.addObject("sclyList",sclyList);
    //获取用户信息
        UserInfo userInfo= UserCenterService.getCurrentUserInfo();
        XiangWModel model=new XiangWModel();
        model.setCjrid(userInfo.getUser_id());
        model.setCjrxm(userInfo.getUser_name());
        model.setCjrbmmc(userInfo.getDepartName());
        model.setSfyx("1");
        mav.addObject("model",model);
        return mav;
    }
    //添加
    @RequestMapping(value = "/doAdd",method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(XiangWModel model,HttpServletRequest request){
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
        if (service.add(model)){
            return "success";
        }else {
            return "error";
        }
    }
    //修改页面
    @RequestMapping(value = "/gotoEdit",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request){
        //取id
        String id=request.getParameter("id");
        XiangWModel user=new XiangWModel();
        user.setId(id);
        //按id查找获取信息
        XiangWModel model=(XiangWModel) service.getInfoById(user);
        //跳转页面
        ModelAndView mav=new ModelAndView("/business/xiangw/editXiangw");
        List<CodeBean> ahList=CodeTableManager.getTableList("xiangw_ah");
        mav.addObject("ahList",ahList);
        List<CodeBean> sclyList=CodeTableManager.getTableList("xiangw_scly");
        mav.addObject("sclyList",sclyList);
        mav.addObject("model",model);
        return mav;
    }
    //修改
    @RequestMapping(value = "/doEdit",method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(XiangWModel model,HttpServletRequest request){
        String id=request.getParameter("id");
        model.setId(id);
        System.out.println(model.getBmmc());
        if (service.edit(model)>0){
            return "success";
        }else {
            return "error";
        }
    }


    //查看页面
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request){
        //获取id
        String id=request.getParameter("id");
        XiangWModel user=new XiangWModel();
        user.setId(id);
        XiangWModel m=(XiangWModel)service.getInfoById(user);
        //部门名称转码
        m.setBmmc(m.getBmmc());
        //性别转码
        m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
        //获取爱好
        List<String> list=new ArrayList<String>();
        String ahList=m.getAh();
        //拆分,爱好转码
        if (ahList!=null){
            String[] allAh= ahList.split(",");
            for (String ahs:allAh) {
                String ah=CodeTableManager.getNameByCode("xiangw_ah",ahs);
                list.add(ah);
            }
            //拼接爱好
            String ahs="";
            for (int i=0;i<list.size();i++){
                if (ahs==""){
                    ahs=list.get(i);
                }else{
                    ahs+=","+list.get(i);
                }
            }
            m.setAh(ahs);
        }
        //擅长领域
        List<String> list1=new ArrayList<String>();
        String sclyList=m.getScly();

        if (sclyList!=null){
            String[] allScly=sclyList.split(",");
            for (String sclys:allScly){
                //擅长领域转码
                String scly=CodeTableManager.getNameByCode("xiangw_scly",sclys);
                list1.add(scly);
            }

            //擅长拼接
            String sclys="";
            for (int i=0;i<list1.size();i++){
                if (sclys==""){
                    sclys=list1.get(i);
                }else{
                    sclys+=","+list1.get(i);
                }
            }
            m.setScly(sclys);
        }

        //有效值
        String sfyx=m.getSfyx();
        if ("1".equals(sfyx)){
            m.setSfyx("是");
        }else {
            m.setSfyx("否");
        }
        //地址转码
        m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
        m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
        m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));


        ModelAndView mav=new ModelAndView("/business/xiangw/viewXiangw");
        mav.addObject("model",m);
        return mav;
    }

    //删除
    @RequestMapping(value = "/gotoDel")
    @ResponseBody
    public String gotoDel(XiangWModel model){
        if (service.delete(model)>0){
            return "success";
        }else {
            return "error";
        }
    }
}

