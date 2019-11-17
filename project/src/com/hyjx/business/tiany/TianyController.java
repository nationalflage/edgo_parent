package com.hyjx.business.tiany;

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
@RequestMapping("/tiany")
public class TianyController {

    @Resource
    private TianyService tianyService;

    @Resource
    private IBaseDao baseDao;

    /*显示到列表页面*/
    @RequestMapping("/gotoList")
    public String gotoList(HttpServletRequest request) {
        return "/business/tiany/listTiany";
    }

    /*查询列表数据并显示*/
    @RequestMapping(value = "/queryList", method = {RequestMethod.POST}, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public String queryList(TianyModel model, HttpServletRequest request) {
        Pager pager = baseDao.getPager("com.hyjx.business.tiany.queryList","com.hyjx.business.tiany.queryCount",model);
        List<TianyModel> list = pager.getResultList();
        for(TianyModel m : list) {
            //性别转码
            m.setSex(CodeTableManager.getNameByCode("sex", m.getSex()));

            //爱好转码
            //爱好集合
            List<String> lists = new ArrayList<String>();
            //得到爱好
            String ahlist = m.getAh();
            if(ahlist != null) {
                //将多个爱好按照逗号拆分
                String[] ahlists = ahlist.split(",");
                //遍历爱好数组
                for (String ah : ahlists) {
                    //得到转码后的爱好
                    String ahs = CodeTableManager.getNameByCode("tiany_ah",ah);
                    //添加到集合中
                    lists.add(ahs);
                }
                String ahh = "";
                for (int i = 0; i < lists.size() ; i++) {
                    //将爱好拼接起来
                    if(ahh == "") {
                        ahh = lists.get(i);
                    } else {
                        ahh += "," + lists.get(i);
                    }
                }
                m.setAh(ahh);
            }

            //将有效值转码
            String sfyxcode = m.getSfyx();
            if("Y".equals(sfyxcode)){
                m.setSfyx("是");
            }else{
                m.setSfyx("否");
            }

            //将领域转码

            List<String> lLists = new ArrayList<String>();
            String lyList = m.getLy();
            if(lyList != null) {
                String[] lyLists = lyList.split(",");
                for(String ly : lyLists) {
                    String lys = CodeTableManager.getNameByCode("tiany_ly",ly);

                    lLists.add(lys);
                }

                String lyy = "";
                for(int i=0 ; i<lLists.size() ; i++) {
                    if(lyy == "") {
                        lyy = lLists.get(i);
                    }else {
                        lyy += "," + lLists.get(i);
                    }
                }
                m.setLy(lyy);
            }

            //将地址转码
            m.setCsdsheng(CodeTableManager.getNameByCode("district", m.getCsdsheng()));
            m.setCsdshi(CodeTableManager.getNameByCode("district", m.getCsdshi()));
            m.setCsdxian(CodeTableManager.getNameByCode("district", m.getCsdxian()));
        }
        return CommonUtil.getPageJsonStr(pager);
    }

    /*添加页面*/
    @RequestMapping(value = "/gotoAdd", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView gotoAdd(HttpServletRequest request) {

        List<CodeBean> ahList = CodeTableManager.getTableList("tiany_ah");
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        List<CodeBean> lyList = CodeTableManager.getTableList("tiany_ly");
        ModelAndView mav = new ModelAndView("/business/tiany/addTiany");
        mav.addObject("ahList", ahList);
        mav.addObject("sex", sex);
        mav.addObject("lyList",lyList);
        /*
         * 添加人员信息
         */
        UserInfo user = UserCenterService.getCurrentUserInfo();
        TianyModel model = new TianyModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmmc(user.getDepartName());
        model.setCjrbmmc(user.getDepartName());
        model.setSfyx("Y");
        mav.addObject("model", model);
        return mav;
    }

    /**保存对象*/
    @RequestMapping(value = "/doAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(TianyModel model) {
        model.setId(StringHelper.getPrimaryKey());
        if(tianyService.add(model)){
            return "success";
        }else{
            return "failure";
        }
    }

    /**到修改页面*/
    @RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        String id = request.getParameter("id");
        TianyModel tym = new TianyModel();
        tym.setId(id);
        TianyModel model =(TianyModel) (tianyService.getInfoById(tym));

        ModelAndView mav = new ModelAndView("business/tiany/editTiany");
        mav.addObject("model",model);
        List<CodeBean> ahList = CodeTableManager.getTableList("tiany_ah");
        mav.addObject("ahList",ahList);
        List<CodeBean> lyList = CodeTableManager.getTableList("tiany_ly");
        mav.addObject("lyList",lyList);
        return mav;
    }

    /**更新数据*/
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(TianyModel model) {
        if(tianyService.edit(model)>0){
            return "success";
        }else{
            return "failure";
        }
    }
    /**删除*/
    @RequestMapping(value = "/gotoDelete")
    @ResponseBody
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("id");
        TianyModel qp=new TianyModel();
        qp.setId(id);
        if(tianyService.delete(qp)>0){
            return "success";
        }else{
            return "failure";
        }
    }
    /**到查看页面*/
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        String id = request.getParameter("id");
        TianyModel qp=new TianyModel();
        qp.setId(id);
        TianyModel model =(TianyModel) (tianyService.getInfoById(qp));

        //性别转码
        model.setSex(CodeTableManager.getNameByCode("sex", model.getSex()));

        //爱好转码

        //爱好集合
        List<String> lists = new ArrayList<String>();
        //得到爱好
        String ahlist = model.getAh();
        if(ahlist != null) {
            //将多个爱好按照逗号拆分
            String[] ahlists = ahlist.split(",");
            //遍历爱好数组
            for (String ah : ahlists) {
                //得到转码后的爱好
                String ahs = CodeTableManager.getNameByCode("tiany_ah",ah);
                //添加到集合中
                lists.add(ahs);
            }
            String ahh = "";

            for (int i = 0; i < lists.size() ; i++) {
                //将爱好拼接起来
                if(ahh == "") {
                    ahh = lists.get(i);
                } else {
                    ahh += "," + lists.get(i);
                }
            }
            model.setAh(ahh);
        }

        //将有效值转码
        String sfyxcode = model.getSfyx();
        if("Y".equals(sfyxcode)){
            model.setSfyx("是");
        }else{
            model.setSfyx("否");
        }

        //将地址转码
        model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
        model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
        model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));

        //将领域转码
        List<String> lLists = new ArrayList<String>();
        String lyList = model.getLy();
        if(lyList != null) {
            String[] lyLists = lyList.split(",");
            for(String ly : lyLists) {
                String lys = CodeTableManager.getNameByCode("tiany_ly",ly);
                lLists.add(lys);
            }

            String lyy = "";
            for(int i=0 ; i<lLists.size() ; i++) {
                if(lyy == "") {
                    lyy = lLists.get(i);
                }else {
                    lyy += "," + lLists.get(i);
                }
            }
            model.setLy(lyy);
        }

        ModelAndView mav = new ModelAndView("/business/tiany/viewTiany");
        mav.addObject("model",model);

        return mav;
    }

}
