package com.hyjx.business.sunj;

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
 * Controller
 *     jxsunj
 */
@Controller
@RequestMapping("/sunj")
public class SunjController {
    @Resource
    private SunjService service;
    @Resource
    private IBaseDao dao;

    /**
     * 显示列表页面
     * @param request 必须得有request
     * @return
     */
    @RequestMapping(value = "/gotoList")
    public String gotoList(HttpServletRequest request){
        return "business/sunj/listSunj";
    }

    /**
     * 查询列表页面
     */
    //prodeces的application/json属性可以去掉，但@ResponseBody不行
    @RequestMapping(value = "/queryList" , method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String queryList(SunjModel model, HttpServletRequest request){
        Pager pager = dao.getPager("com.hyjx.business.sunj.queryList", "com.hyjx.business.sunj.queryCount", model);
        List<SunjModel> list=pager.getResultList();
        //转码
        for(SunjModel m:list){
            //部门名称
            //m.setBmmc(CodeTableManager.getNameByCode("gszbm", m.getBmmc()));
            //m.setBmmc(m.getBmmc());
            //将性别转码
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
            //将爱好转码
            List<String>ahl=new ArrayList<String>();
            String ahCode=m.getAh();
            if(ahCode!=null){
                String []AhC=ahCode.split(",");
                for (String str : AhC) {
                    String ahs=CodeTableManager.getNameByCode("sunj_ah",str);
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
            List<String>lyl=new ArrayList<String>();
            String lyCode=m.getLy();
            if(lyCode!=null){
                String []lyC=lyCode.split(",");
                for (String str : lyC) {
                    String lys=CodeTableManager.getNameByCode("sunj_ly",str);
                    lyl.add(lys);
                }
                String ly="";
                for (int i = 0; i < lyl.size(); i++) {
                    if (ly=="") {
                        ly=lyl.get(i);
                    }else {
                        ly=ly+","+lyl.get(i);
                    }
                }
                m.setLy(ly);
            }
        }



        return  CommonUtil.getPageJsonStr(pager);
    }



/**
 * 新增页面显示，点击添加显示的页面
 */

    @RequestMapping(value = "/gotoAdd",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request){
        //添加爱好
        List<CodeBean> ahList = CodeTableManager.getTableList("sunj_ah");
        List<CodeBean> lyList = CodeTableManager.getTableList("sunj_ly");
        System.out.println(ahList.toString()+"检查bug");
        //性别
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        //给页面返回值的封装
        ModelAndView mav = new ModelAndView("business/sunj/addSunj");
        mav.addObject("ahList",ahList);
        mav.addObject("lyList",lyList);
        mav.addObject("sex",sex);
        //从session中获取添加人信息
        UserInfo user = UserCenterService.getCurrentUserInfo();

        //实体类数据封装
        SunjModel model = new SunjModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmid(user.getDepart_code());
        model.setSfyx("1");
        model.setCjrbmmc(user.getDepartName());
        mav.addObject("model", model);
        return mav;
    }
    /**
     * 保存页面
     */
    @RequestMapping(value="/doAdd",method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(SunjModel model){
        model.setId(StringHelper.getPrimaryKey());

        if(service.add(model)){
            return "success";
        }else{
            return "failure";
        }
    }
    /**
     * 到修改页面
     */
    @RequestMapping(value="/gotoEdit",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request){
        String id = request.getParameter("id");
        SunjModel sjm = new SunjModel();
        sjm.setId(id);
        SunjModel model = (SunjModel) service.getInfoById(sjm);

//        model.setCsdsheng_mc(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
//        model.setCsdshi_mc(CodeTableManager.getNameByCode("district", model.getCsdshi()));
//        model.setCsdxian_mc(CodeTableManager.getNameByCode("district", model.getCsdxian()));

        ModelAndView mav = new ModelAndView("business/sunj/editSunj");
        mav.addObject("model",model);
        List<CodeBean> ahList = CodeTableManager.getTableList("sunj_ah");
        mav.addObject("ahList",ahList);
        List<CodeBean> lyList = CodeTableManager.getTableList("sunj_ly");
        mav.addObject("lyList",lyList);


        return mav;
    }
    /*
    更新数据
     */
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(SunjModel model) {
        System.out.println(model.getId());
        if(service.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

    /**
     * 删除数据
     */
    @RequestMapping(value="/gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        SunjModel sjm = new SunjModel();
        sjm.setId(id);
        if(service.delete(sjm)>0){
            return "success";
        }else{
            return "failure";
        }

    }
    /**
     * 查看页面
     */
    @RequestMapping(value="/gotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        //先从request里获取用户id
        String id = request.getParameter("id");
        //创建对象用于插入id并做service的查询
        SunjModel sjm = new SunjModel();
        sjm.setId(id);
        //查询对象信息，并返回一个实体类
        SunjModel model = (SunjModel) service.getInfoById(sjm);
        //部门名称转码，并插入model
        //model.setBmmc(CodeTableManager.getNameByCode("gszbm",model.getBmmc()));
        //性别转码，并插入model
        model.setSex(CodeTableManager.getNameByCode("sex", model.getSex()));
        //将爱好转码，并插入model
        List<String> ah1 = new ArrayList<String>();
        //爱好不止一个，用","分割
        String ahCode = model.getAh();
        if (ahCode != null) {
            String[] ahs = ahCode.split(",");
            //分割出每一个爱好
            for (String str : ahs) {
                //把每一个爱好转码
                String ahx = CodeTableManager.getNameByCode("sunj_ah", str);
                //将每个转好码的爱好，插入数组中保存
                ah1.add(ahx);
            }
            //从List集合中将爱好整理成String格式，并用","做每个爱好的间隔
            String ah = "";
            for (int i = 0; i < ah1.size(); i++) {
                if (ah == "") {
                    ah = ah1.get(i);
                } else {
                    ah = ah + "," + ah1.get(i);
                }
            }
            model.setAh(ah);
        }
        //将领域转码，并插入model
        List<String> ly1 = new ArrayList<String>();
        //领域不止一个，用","分割
        String lyCode = model.getLy();
        if (lyCode != null) {
            String[] lys = lyCode.split(",");
            //分割出每一个领域
            if (lys != null) {
                for (String str : lys) {
                    //把每一个爱好转码
                    String lyx = CodeTableManager.getNameByCode("sunj_ly", str);
                    //将每个转好码的爱好，插入数组中保存
                    ly1.add(lyx);
                }
                //从List集合中将爱好整理成String格式，并用","做每个爱好的间隔
                String ly = "";
                for (int i = 0; i < ly1.size(); i++) {
                    if (ly == "") {
                        ly = ly1.get(i);
                    } else {
                        ly = ly + "," + ly1.get(i);
                    }

                }
                model.setLy(ly);
            } else {
                model.setLy("");
            }
        }

            //将省市县地区转码，并插入model
            model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
            model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
            model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
            //将是否有效进行判断
            String sfyx = model.getSfyx();
            try {
                if ("1".equals(sfyx)) {
                    model.setSfyx("是");
                } else {
                    model.setSfyx("否");
                }
            } catch (Exception e) {
                model.setSfyx("否");
            }
            //根据jsp路径创建所属的ModelAndView
            ModelAndView mav = new ModelAndView("business/sunj/viewSunj");
            mav.addObject("model", model);
            return mav;
        }

    /**
     * tree树实现
     */
    @RequestMapping(value="/gototreeSunj")
    @ResponseBody
    public String gototreeSunj(HttpServletRequest request){
        return "business/sunj/treeSunj";
    }
}
