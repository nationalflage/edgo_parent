package com.hyjx.business.xiels;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.component.codetable.CodetableController;
import com.hyjx.framework.orm.IBaseModel;
import com.hyjx.framework.service.UserCenterService;
import com.hyjx.framework.uc.user.UserInfo;
import org.springframework.remoting.rmi.CodebaseAwareObjectInputStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hyjx.framework.orm.dao.IBaseDao;
import javax.annotation.Resource;
import com.hyjx.framework.orm.dao.Pager;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/xiels")
public class XielsController {
    @Resource
    private XielsService service;
    @Resource
    private IBaseDao dao;

    // 列表页面
    @RequestMapping("/gotolist")
    public String gotolist(){
        return "/business/xiels/listXiels";
    }

    // 转码(传入XielsModel,将部门、性别、爱好、省市区、有效值转码)
    public void transcode(XielsModel m){
        // 部门名称 码表中的 码表名gszmb(公司子部门),码表值
        m.setBmmc(CodeTableManager.getNameByCode("gszbm",m.getBmmc()));
        // 将性别转码
        m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
        // 将爱好转码
        List<String> ahlist=new ArrayList<String>();
        String ahCode=m.getAh();
        if(ahCode!=null){
            String [] ahCodes=ahCode.split(",");
            for (String str:ahCodes) {
                String ah= CodeTableManager.getNameByCode("xiels_ah",str);
                ahlist.add(ah);
            }
            String ahs="";
            for (int i=0;i<ahlist.size();i++){
                if(ahs=="")
                    ahs=ahlist.get(i);
                else
                    ahs=ahs+","+ahlist.get(i);
            }
            m.setAh(ahs);
        }

        //将擅长领域转码
        m.setScly(CodeTableManager.getNameByCode("xiels_scly",m.getScly()));
        // 将出生省市区转码
        m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
//            System.out.println("============================出生地市码表"+m.getCsdshi()+"============================");
        m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
//            System.out.println("============================出生地市"+m.getCsdshi()+"============================");
        m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));

        // 是否有效转码
        if(m.getSfyx().equals("1"))
            m.setSfyx("是");
        else
            m.setSfyx("否");
    }

    // 根据条件查询结果(及分页数据)
    @RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String queryList(XielsModel model, HttpServletRequest request){
        /*String beginage=model.getBeginage();
        String endage=model.getEndage();
        if(beginage!=null && (endage==null || endage=="")) {
            model.setEndage("100");
        }else if((beginage==null || beginage=="") && endage!=null){
            model.setBeginage("0");
        }*/
        Pager pager = dao.getPager("com.hyjx.business.xiels.queryList","com.hyjx.business.xiels.queryCount", model);
        List<XielsModel> list=pager.getResultList();
        // 转码
        for (XielsModel m:list) {
            transcode(m);
        }
        return CommonUtil.getPageJsonStr(pager);
    }

    // 到新增页面
    @RequestMapping("/gotoAdd")
    public ModelAndView gotoAdd(){
        ModelAndView mav = new ModelAndView("business/xiels/addXiels");
        List<CodeBean> ahList=CodeTableManager.getTableList("xiels_ah");
//        System.out.println("=================ahList1=="+ahList.get(0).getCode()+","+ahList.get(0).getName());
        mav.addObject("ahList",ahList);
        // 获取登录的用户信息
        UserInfo user= UserCenterService.getCurrentUserInfo();
        XielsModel model=new XielsModel();
//        model.setSfyx("1");
        // 设置model中创建人的信息
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmid(user.getDepartName());
        model.setCjrbmmc(user.getDepartName());
//        System.out.println("====================="+user.getDepartName()+"=====================");
        mav.addObject("model",model);
        return mav;
    }

    // 根据出生日期获取年龄
    public int getAgeByBirthday(String birthday){
        String [] date=birthday.split("-");
        int b_year=Integer.parseInt(date[0]);
        int b_month=Integer.parseInt(date[1]);
        int b_day=Integer.parseInt(date[2]);
        Calendar c=Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
        System.out.println("==============year:"+year+"month:"+month+"day:"+day);
        int age=0;
        if(month>b_month){
            age=year-b_year;
        }else if(month<b_month){
            age=year-b_year-1;
        }else if(month==b_month){
            if(day>=b_day){
                age=year-b_year;
            }else{
                age=year-b_year-1;
            }
        }
        return age;
    }

    // 新增
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public String add(XielsModel model){
        int age = getAgeByBirthday(model.getBirthday());
        model.setAge(age+"");
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
//        System.out.println("-----------------------------"+model.getName()+"-----------------------------");
        boolean result = service.add(model);
        if(result)
            return "success";
        else
            return "error";
    }

    // 删除用户
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(HttpServletRequest request){
        String id=request.getParameter("id");
//        System.out.println("--------------------------"+id+"----------------------------");
        XielsModel model=new XielsModel();
        model.setId(id);
        int rc = service.delete(model);
        if(rc>0){
            return "success";
        }else
            return "error";
    }

    // 展示用户信息
    @RequestMapping("/gotoView")
    public ModelAndView gotoView(HttpServletRequest request){
        // 获取请求中的id值
        String id=request.getParameter("id");
        XielsModel model=new XielsModel();
        model.setId(id);
        // 根据id查找
        XielsModel resultModel = (XielsModel) service.getInfoById(model);
        // 转码
        transcode(resultModel);
        ModelAndView mav=new ModelAndView("business/xiels/viewXiels");
        mav.addObject("model",resultModel);
        return mav;
    }

    @RequestMapping("/gotoEdit")
    public ModelAndView gotoEdit(HttpServletRequest request){
        // 获取请求中的id值
        String id=request.getParameter("id");
//        System.out.println(id);
        XielsModel model=new XielsModel();
        model.setId(id);
        IBaseModel resultModel = service.getInfoById(model);
        ModelAndView mav=new ModelAndView("business/xiels/editXiels");
        mav.addObject("model",resultModel);
        List<CodeBean> ahList=CodeTableManager.getTableList("xiels_ah");
        mav.addObject("ahList",ahList);
        System.out.println(model);
//        System.out.println(ahList);
        return mav;
    }

    // 编辑用户
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(XielsModel model){
//        System.out.println("====================="+model.getId()+"=====================");
        int age = getAgeByBirthday(model.getBirthday());
        model.setAge(age+"");
        int result = service.edit(model);
        if(result>0)
            return "success";
        else
            return "error";
    }

}
