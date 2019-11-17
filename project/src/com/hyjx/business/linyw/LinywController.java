package com.hyjx.business.linyw;

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
@RequestMapping("/linyw")
public class LinywController {

    @Resource
    private LinywService linywService;

    @Resource
    private IBaseDao baseDao;

    /*跳转到列表页面准备展示页面*/
    @RequestMapping("/gotoList")
    public String gotoList(HttpServletRequest request){
        return "/business/linyw/listLinyw";
    }

    /*ajax异步查询页面数据*/
    //http://localhost:8080/linyw/queryList.xhtml?random=0.34543384882360684
    //Request Method: POST
    @RequestMapping(value = "/queryList", method = {RequestMethod.POST}, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public String queryList(HttpServletRequest request,LinywModel model){
        //利用basedao进行查询,传参是sqlid与接收数据的pojo
        Pager pager =  baseDao.getPager("com.hyjx.business.linyw.queryList",
                "com.hyjx.business.linyw.queryCount",model);
        List<LinywModel> list = pager.getResultList();
        for (LinywModel m:list) {
            m=zhuanma(m);
        }
        return CommonUtil.getPageJsonStr(pager);
    }

    //添加页面
    //http://localhost:8080/linyw/gotoAdd.xhtml Request Method: GET
    @RequestMapping("/gotoAdd")
    public ModelAndView gotoAdd(HttpServletRequest request){

        ModelAndView mav = new ModelAndView("/business/linyw/addLinyw");

        //CodeTableManager在加载的时候会读取所有的码表并保存在静态变量中，后面需要的时候可以直接查询
        List<CodeBean> ahList = CodeTableManager.getTableList("lyw_ah");
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        List<CodeBean> lyList = CodeTableManager.getTableList("lyw_ly");
        mav.addObject("ahList",ahList);
        mav.addObject("sex",sex);
        mav.addObject("lyw_ly",lyList);

        //利用UserCenterService获取当前登陆得用户信息
        UserInfo user = UserCenterService.getCurrentUserInfo();
        LinywModel model = new LinywModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmmc(user.getDepartName());
        model.setCjrbmmc(user.getDepartName());
        mav.addObject("model", model);
        return mav;
    }

    //存储新增信息
    //http://localhost:8080/linyw/doAdd.xhtml  Request Method: POST
    //produces = {"application/json; charset=utf-8"}只有返回结果是json的时候才使用这个属性
    //瞎几把用会废掉页面的js
    @RequestMapping(value = "/doAdd",method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(LinywModel model){
        model.setId(StringHelper.getPrimaryKey());
        if(linywService.add(model)){
            return "success";
        }else {
            return "failed";
        }
    }

    /*修改页面跳转*/
    //http://localhost:8080/linyw/gotoEdit.xhtml   Request Method: GET
    //没有异步加载，需要从请求中获取userId后查询数据库，返回给页面
    @RequestMapping("/gotoEdit")
    public ModelAndView gotoEdit(HttpServletRequest request){
        String id = request.getParameter("id");
        LinywModel m = new LinywModel();
        m.setId(id);
        LinywModel model = (LinywModel) linywService.getInfoById(m);
        //CodeTableManager在加载的时候会读取所有的码表并保存在静态变量中，后面需要的时候可以直接查询
        //利用IBaseDao进行查询码表的操作
        ModelAndView mav=new ModelAndView("/business/linyw/editLinyw");
        List<CodeBean> ahList = CodeTableManager.getTableList("lyw_ah");
        List<CodeBean> lyList = CodeTableManager.getTableList("lyw_ly");
        mav.addObject("ahList",ahList);
        mav.addObject("lyw_ly",lyList);
        mav.addObject("model",model);
        return mav;
    }

    /*保存修改信息*/
    //http://localhost:8080/linyw/doEdit.xhtml  Request Method: POST
    @RequestMapping(value = "/doEdit",method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(LinywModel model){
        if(linywService.edit(model)>0){
            return "success";
        }else {
            return "failed";
        }

    }

    /**
     * 删除选中项*/
    //http://localhost:8080/linyw/gotoDelete.xhtml?id=ea2d400a1d9b485696d946feb8b7f72d  Request Method: GET
    @RequestMapping("/gotoDelete")
    @ResponseBody
    public String dotoDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        LinywModel temp = new LinywModel();
        temp.setId(id);
        if(linywService.delete(temp)>0){
            return "success";
        }else {
            return "failed";
        }
    }
    /**
     * 查看具体信息页面
     */
    //http://localhost:8080/linyw/gotoView.xhtml?id=ea2d400a1d9b485696d946feb8b7f72d   Request Method: GET
    @RequestMapping("/gotoView")
    @ResponseBody
    public ModelAndView gotoView(HttpServletRequest request){
        LinywModel temp = new LinywModel();
        String id = request.getParameter("id");
        temp.setId(id);
        LinywModel m = (LinywModel) linywService.getInfoById(temp);
        m=zhuanma(m);
        ModelAndView mav = new ModelAndView("/business/linyw/viewLinyw");
        mav.addObject("model",m);
        return mav;
    }


    /**
     * 转码提出来丢在外面
     * @param m
     * @return
     */
    private LinywModel zhuanma(LinywModel m) {
        //性别转码
        m.setSex(CodeTableManager.getNameByCode("sex",m.getSex()));
        //出生地省市县
        m.setCsdsheng(CodeTableManager.getNameByCode("district",m.getCsdsheng()));
        m.setCsdshi(CodeTableManager.getNameByCode("district",m.getCsdshi()));
        m.setCsdxian(CodeTableManager.getNameByCode("district",m.getCsdxian()));
        //爱好转码
        List<String> l = new ArrayList<String>();
        String ah = m.getLyw_ah();
        if(ah!=null){
            String[] ah_list = ah.split(",");
            for (String s:ah_list) {
                String real_ah = CodeTableManager.getNameByCode("lyw_ah",s);
                l.add(real_ah);
            }
            //爱好拼接
            String rst_ah = "";
            for (int i = 0; i < l.size() ; i++){
                if(rst_ah==""){
                    rst_ah=l.get(i);
                }else {
                    rst_ah += "," + l.get(i);
                }
            }
            m.setLyw_ah(rst_ah);
        }
        //是否有效
        //m.setSfyx(CodeTableManager.getNameByCode("sex",m.getSfyx()));
        if("Y".equals(m.getSfyx())){
            m.setSfyx("是");
        }else {
            m.setSfyx("否");
        }
        //领域转码
        List<String> ly = new ArrayList<String>();
        String lyy = m.getLyw_ly();
        if(lyy!=null){
            String[] ly_list = lyy.split(",");
            for (String s:ly_list) {
                String real_ly = CodeTableManager.getNameByCode("lyw_ly",s);
                ly.add(real_ly);
            }
            //领域拼接
            String rst_ly = "";
            for (int i = 0; i < ly.size() ; i++){
                if(rst_ly==""){
                    rst_ly=ly.get(i);
                }else {
                    rst_ly += "," + ly.get(i);
                }
            }
            m.setLyw_ly(rst_ly);
        }
        //最擅长领域转码
        m.setZscly(CodeTableManager.getNameByCode("lyw_ly",m.getZscly()));
        //部门转码
        m.setBmmc(CodeTableManager.getNameByCode("lyw_bm",m.getBmmc()));
        return m;
    }


}










