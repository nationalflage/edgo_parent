package com.hyjx.business.zhangxr;

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
@RequestMapping("/zhangxr")
public class ZhangxrController {
    @Resource
    private IZhangxrService service;
    @Resource
    IBaseDao dao;

    /**
     * 列表页面
     */
    @RequestMapping(value = "/gotoList")
    public String gotoList(HttpServletRequest request){
        return "/business/zhangxr/listZhangxr";
    }

    /**
     * 查询列表数据
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/queryList",method= RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryList(ZhangxrModel model, HttpServletRequest request){
        //分页
        Pager pager = dao.getPager("com.hyjx.business.zhangxr.queryList","com.hyjx.business.zhangxr.queryCount",model);
        List<ZhangxrModel> list = pager.getResultList();
        //转码
        for (ZhangxrModel m: list){
            //部门名称，爱好，性别转码
            m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
            List<String> ah = new ArrayList<String>();
            List<String> scly = new ArrayList<String>();
            String ahCode = m.getAh();
            String sclyCode = m.getScly();

            if(sclyCode!=null) {
                String[] SclyC = sclyCode.split(",");
                for (String str : SclyC) {
                    String sclys = CodeTableManager.getNameByCode("ZHANGXR_SCLY", str);
                    scly.add(sclys);
                }
                String scly1 = "";
                for (int i = 0; i < scly.size(); i++) {
                    if (scly1 == "") {
                        scly1 = scly.get(i);
                    } else {
                        scly1 = scly1 + "," + scly.get(i);
                    }
                }
                m.setScly(scly1);
            }
            if(ahCode!=null){
                String[]AhC = ahCode.split(",");
                for(String str:AhC){
                    String ahs = CodeTableManager.getNameByCode("zhangxr",str);
                    ah.add(ahs);
                }
                String ah1="";
                for(int i=0;i<ah.size();i++){
                    if(ah1==""){
                        ah1=ah.get(i);
                    }else{
                        ah1=ah1+","+ah.get(i);
                    }
                }
                m.setAh(ah1);
            }

            //将出生省市区转码
            m.setCsdsheng(CodeTableManager.getNameByCode("district", m.getCsdsheng()));
            m.setCsdshi(CodeTableManager.getNameByCode("district", m.getCsdshi()));
            m.setCsdxian(CodeTableManager.getNameByCode("district", m.getCsdxian()));
            //是否有效
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
        System.out.println("这里返回的是："+CommonUtil.getPageJsonStr(pager));
        return CommonUtil.getPageJsonStr(pager);
    }

    /**
     * 新增数据页面
     */
    @RequestMapping(value = "/gotoAdd",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request){
        /*
         * 爱好，性别码表列
         */
        List<CodeBean> ahList = CodeTableManager.getTableList("zhangxr");
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        List<CodeBean> sclyList = CodeTableManager.getTableList("ZHANGXR_SCLY");
        //页面
        ModelAndView mav = new ModelAndView("/business/zhangxr/addZhangxr");
        mav.addObject("ahList",ahList);
        mav.addObject("sex",sex);
        mav.addObject("sclyList",sclyList);
        /*
         * 添加人信息
         */
        UserInfo user = UserCenterService.getCurrentUserInfo();
        //实体数据
        ZhangxrModel model = new ZhangxrModel();
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
    @RequestMapping(value="/doAdd",method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(ZhangxrModel model){
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
     * @param request
     * @return
     */
    @RequestMapping(value="/gotoEdit",method = {RequestMethod.GET,RequestMethod.GET})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        String id = request.getParameter("id");
        ZhangxrModel qp = new ZhangxrModel();
        qp.setId(id);
        ZhangxrModel model = (ZhangxrModel)(service.getInfoById(qp));
        ModelAndView mav = new ModelAndView("business/zhangxr/editZhangxr");
        mav.addObject("model",model);
        List<CodeBean> ahList = CodeTableManager.getTableList("zhangxr");
        List<CodeBean> sclyList = CodeTableManager.getTableList("ZHANGXR_SCLY");
        mav.addObject("ahList",ahList);
        mav.addObject("sclyList",sclyList);
        return mav;
    }

    /**
     * 更新数据
     * @param model
     * @return
     */
    @RequestMapping(value="/doEdit",method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(ZhangxrModel model){
        if(service.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }

    /**
     * 删除
     * @param request
     * @return
     */
    @RequestMapping("gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request){
        String id = request.getParameter("ids");
        ZhangxrModel qp = new ZhangxrModel();
        qp.setId(id);
        if(service.delete(qp)>0){
            return "success";
        }else{
            return "failure";
        }
    }

    /**
     * 到查看页面
     * @param request
     * @return
     */
    @RequestMapping("gotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        String id = request.getParameter("id");
        ZhangxrModel qp = new ZhangxrModel();
        qp.setId(id);
        ZhangxrModel model = (ZhangxrModel) (service.getInfoById(qp));
        //部门名称，性别爱好转码
        model.setBmmc( model.getBmmc());
        model.setSex(CodeTableManager.getNameByCode("sex", model.getSex()));

        List<String> ah = new ArrayList<String>();
        String ahCode = model.getAh();
        if (ahCode != null) {
            String[] AhC = ahCode.split(",");
            for (String str : AhC) {
                String ahs = CodeTableManager.getNameByCode("zhangxr", str);
                ah.add(ahs);
            }
            String ah1 = "";
            for (int i = 0; i < ah.size(); i++) {
                if (ah1 == "") {
                    ah1 = ah.get(i);
                } else {
                    ah1 = ah1 + "," + ah.get(i);
                }
            }
            model.setAh(ah1);
        }

        //将出生省市区转码
        model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
        model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
        model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));
        //是否有效转码
        String sfcode = model.getSfyx();
        try {
            if(sfcode.equals("1")){
                model.setSfyx("是");
            }else{
                model.setSfyx("否");
            }
        }catch (Exception e){
            model.setSfyx("否");
        }

        ModelAndView mav = new ModelAndView("business/zhangxr/viewZhangxr");
        mav.addObject("model",model);
        return mav;
    }

/*    @RequestMapping("json")
    @ResponseBody
    public List<CodeBean> get*/
}
