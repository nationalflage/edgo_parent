package com.hyjx.business.moyf;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.common.util.StringHelper;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.orm.IBaseModel;
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
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/moyf")
public class MoyfController {
    @Resource
    private MoyfService service;
    @Resource
    private IBaseDao dao;
    /**
     * 展示页面
     */
    @RequestMapping(value = "/gotolist")
    public String gotolist(HttpServletRequest request){
        return "/business/moyf/listMoyf" ;
    }



    /**
     * 获取表
     */
    @RequestMapping(value="/queryList" ,method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryList(MoyfModel model ,HttpServletRequest request){
        //fenye 查询
        Pager pager = dao.getPager("com.hyjx.business.moyf.queryList","com.hyjx.business.moyf.queryCount",model);
        List<MoyfModel> list = pager.getResultList();
        //zhuanma
        for (MoyfModel m : list) {
            transcode(m);
        }
        return CommonUtil.getPageJsonStr(pager);
    }


    /**
     * 展示用户信息
     */
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request){
        // 获取请求中的id值
        String id = request.getParameter("id");
        MoyfModel model = new MoyfModel();
        model.setId(id);
        // 根据id查找
        MoyfModel resModel = (MoyfModel) service.getInfoById(model);
        // 转码
        transcode(resModel);
        ModelAndView mav = new ModelAndView("business/moyf/viewMoyf");
        mav.addObject("model",resModel);
        return mav;
    }



    /**
     *  添加页面信息
     */
    @RequestMapping(value = "/gotoAdd" ,method ={RequestMethod.GET,RequestMethod.POST} )
    public ModelAndView gotoAdd(){
        //添加页面
        ModelAndView mav = new ModelAndView("/business/moyf/addMoyf");
        //tongguo ma biao获取爱好 moyf_ah。擅长领域 Scly_moyf。性别 sex
        List<CodeBean> moyf_ah = CodeTableManager.getTableList("moyf_ah");
        List<CodeBean> Scly_moyf = CodeTableManager.getTableList("Scly_moyf");
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        //添加 爱好 擅长领域 性别
        mav.addObject("moyf_ah",moyf_ah);
        mav.addObject("Scly_moyf",Scly_moyf);
        mav.addObject("sex",sex);
        // 获取登录的用户信息
        UserInfo user = UserCenterService.getCurrentUserInfo();
        MoyfModel model = new MoyfModel();
        //设置model中创建人的信息
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmid(user.getDepartCode());
        model.setCjrbmmc(user.getDepartName());
        mav.addObject("model",model);
        return mav;
    }



    /**
     *  添加信息
     */
    @RequestMapping(value = "/doAdd",method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(MoyfModel model){
        int age = getInForByAge(model.getBirthday());
        model.setAge(age+"");
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
        boolean result = service.add(model);
        if (result){
            return "success";
        }else {
            return "error";
        }
    }



    /**
     * 修改页面
     */
    @RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        // 获取请求中的id值
        String id = request.getParameter("id");
        MoyfModel model = new MoyfModel();
        model.setId(id);
        IBaseModel resultModel = service.getInfoById(model);
        ModelAndView mav=new ModelAndView("business/moyf/editMoyf");
        mav.addObject("model",resultModel);
        List<CodeBean> ahList=CodeTableManager.getTableList("moyf_ah");
        mav.addObject("ahList",ahList);
        List<CodeBean> Scly_moyf = CodeTableManager.getTableList("Scly_moyf");
        mav.addObject("Scly_moyf",Scly_moyf);
        return mav;
    }



    /**
     * 更新数据
     */
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(MoyfModel model) {
        int age = getInForByAge(model.getBirthday());
        model.setAge(age+"");
        int result = service.edit(model);
        if(result>0){
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
        MoyfModel gm=new MoyfModel();
        gm.setId(id);
        if(service.delete(gm)>0){
            return "success";
        }else{
            return "failure";
        }
    }



    /**
     * 根据出生日期获取年龄
    */
    public int  getInForByAge(String birthday){
        String [] date=birthday.split("-");
        //获取添加人的出生日期
        int b_year=Integer.parseInt(date[0]);
        int b_month=Integer.parseInt(date[1]);
        int b_day=Integer.parseInt(date[2]);
        Calendar c= Calendar.getInstance();
        //获取当前日期
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
        int age=0;
        if(month>b_month){
            age=year-b_year;
        }else if(month<b_month){
            age=year-b_year+1;
        }else if(month==b_month){
            if(day>=b_day){
                age=year-b_year;
            }else{
                age=year-b_year+1;
            }
        }
        return age;
    }



    /**
     * 转码  (传入MoyfModel,将部门、性别、爱好、省市县、有效值转码)
     */
    public void transcode(MoyfModel m){
        //    Bmmc部门名称     gszbm
        m.setBmmc(CodeTableManager.getNameByCode("gszbm",m.getBmmc()));
        //    sex性别    sex
        m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
        //爱好    moyf_ah
        List<String> ahlist = new ArrayList<String>();
        //获取爱好
        String ahcode = m.getAh();
        if(ahcode!=null){
            String[] split = ahcode.split(",");
            for (String s : split) {
                String ah = CodeTableManager.getNameByCode("moyf_ah", s);
                ahlist.add(ah);
            }
            String ahs = "";
            for (int i = 0; i < ahlist.size(); i++) {
                if (ahs==""){
                    ahs = ahlist.get(i);
                }else {
                    ahs = ahs+","+ahlist.get(i);
                }
            }
            m.setAh(ahs);
        }
        //擅长领域 Scly    Scly_moyf
        m.setScly(CodeTableManager.getNameByCode("Scly_moyf",m.getScly()));
        //省市县  district
        m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
        m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
        m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));
        // 是否有效转码
       if (m.getSfyx().equals("1")){
                m.setSfyx("是");
            }else{
                m.setSfyx("否");
            }
    }

}
