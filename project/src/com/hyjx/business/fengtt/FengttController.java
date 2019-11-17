package com.hyjx.business.fengtt;
import java.util.*;
import java.sql.Timestamp;

import com.alibaba.fastjson.JSON;
import com.hyjx.business.fengtt.FengttModel;
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
import java.text.SimpleDateFormat;
import java.util.logging.SimpleFormatter;

@Controller
@RequestMapping("/fengtt")
public class FengttController {

    @Resource
    private FengttService service;
    @Resource
    IBaseDao dao;

    /**
     * 查看列表页面
     * @return :list.jsp
     */
    //修改gotoList，将爱好，擅长领域码表封进去
    @RequestMapping(value = "/gotoList", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView gotoList(HttpServletRequest request) {
        List<CodeBean> ahList = CodeTableManager.getTableList("fengttAh");
        List<CodeBean> sclyList = CodeTableManager.getTableList("fengttScly");
        ModelAndView mav = new ModelAndView("/business/fengtt/list");
        mav.addObject("ahList", ahList);
        //scly封装成json
        String liJson = Util.getSclyJson();
        mav.addObject("sclyList", liJson);
        System.out.println("list页面加载scly下拉树JSON串："+liJson);
        return mav;
    }

    /**
     * 查询列表数据
     * @param model
     * @param request
     */
    @RequestMapping(value = "/queryList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryList(FengttModel model, HttpServletRequest request) {
        System.out.println("擅长领域回传值："+model.getScly());

        //将组件回传值转换成DATE类型
        System.out.println("输出传回值starttime："+model.getStarttime());
        System.out.println("输出传回值endtime："+model.getEndtime());

        //分页
        Pager pager = dao.getPager("com.hyjx.business.fengtt.queryList", "com.hyjx.business.fengtt.queryCount", model);
        List<FengttModel> list = pager.getResultList();
        //遍历转码
        for (FengttModel m : list) {
            //性别转码
            m.setSex(CodeTableManager.getNameByCode("sex", m.getSex()));
            //爱好转码
            String ahCode = m.getAh();
            Util.changeMutiCode(ahCode, m,"fengttAh");
            //擅长领域转码
            String sclyCode = m.getScly();
            Util.changeMutiCode(sclyCode, m,"fengttScly");
            //最擅长领域转码
            String zscCode = m.getZsc();
            Util.changeMutiCode(zscCode, m,"fengttScly");
            //将出生省市区转码
            m.setCsdsheng(CodeTableManager.getNameByCode("district", m.getCsdsheng()));
            m.setCsdshi(CodeTableManager.getNameByCode("district", m.getCsdshi()));
            m.setCsdxian(CodeTableManager.getNameByCode("district", m.getCsdxian()));
            //部门名称转码
            m.setBmmc(CodeTableManager.getNameByCode("gszbm", m.getBmmc()));
            m.setBmmc(m.getBmmc());
            //有效值转码
            String sfcode = m.getSfyx();
            if ("1".equals(sfcode)) {
                m.setSfyx("是");
            } else {
                m.setSfyx("否");
            }
        }
        System.out.println("hhhhhhhhhhhhhhh输出："+CommonUtil.getPageJsonStr(pager));
        return CommonUtil.getPageJsonStr(pager);
    }


    /**
     * 新增数据页面
     */
    @RequestMapping(value = "/gotoAdd", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ModelAndView gotoAdd(HttpServletRequest request) {
        List<CodeBean> ahList = CodeTableManager.getTableList("fengttAh");
        List<CodeBean> sex = CodeTableManager.getTableList("sex");
        List<CodeBean> sclyList = CodeTableManager.getTableList("fengttScly");
//        String s = JSON.toJSONString(ahList);
//        System.out.println("这里返回的是："+s);
        ModelAndView mav = new ModelAndView("/business/fengtt/add");
        mav.addObject("ahList", ahList);
        mav.addObject("sex", sex);
        mav.addObject("sclyList", sclyList);
        //从session中获取user信息
        UserInfo user = UserCenterService.getCurrentUserInfo();
        FengttModel model = new FengttModel();
        model.setCjrid(user.getUser_id());
        model.setCjrxm(user.getUser_name());
        model.setCjrbmid(user.getDepartName());
        model.setSfyx("1");
        model.setCjrbmmc(user.getDepartName());
        //追加改动
        model.setUpdatetime(CommonUtil.getCurrentDateStr());
        model.setLastdate(CommonUtil.getCurrentDateStr());

        mav.addObject("model", model);

        String sclyListJSON = Util.getSclyJson();
        System.out.println("输出json:"+sclyListJSON);
        mav.addObject("sclyListJSON", sclyListJSON);
        return mav;
    }

    /**
     * 通过前端获取擅长字段动态生成最擅长下拉列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/gotoGetJson", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String gotoGetJson(FengttModel model){
        List<CodeBean> sclyList = CodeTableManager.getTableList("fengttScly");
        String s = model.getScly();
        System.out.println("输出前台返回的码表字段样式"+s);
        String[] ss = s.split(",");
        //通过传回字段查询码表封装json串回传
        class sclyPojo{
            int id;
            String text;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getText() {
                return text;
            }
            public void setText(String text) {
                this.text = text;
            }
        }
        List<sclyPojo> list = new ArrayList<sclyPojo>();
        List<HashMap<String,String>> list2 = new ArrayList<HashMap<String, String>>();
        for(int i=0;i<ss.length;i++){
            HashMap<String,String> map = new HashMap<String, String>();
            String name = CodeTableManager.getNameByCode("fengttScly",ss[i]);
            map.put("id",ss[i]);
            map.put("text",name);
            list2.add(map);
//            for(CodeBean cc:sclyList){
//                if(cc.getCode().equals(ss[i])){
//                    sclyPojo sc =new sclyPojo();
//                    sc.setId(Integer.parseInt(cc.getCode()));
//                    sc.setText(cc.getName());
//                    list.add(sc);
//                }
//            }
        }
        String liJson = CommonUtil.getJsonString(list);
        String liJson1 = JSON.toJSONString(list);
        System.out.println("查看封装的JSON串是否符合easyui格式"+list2);
        return  JSON.toJSONString(list2);
    }


    /**
     * 保存对象
     * @param model
     * @return
     */
    @RequestMapping(value = "/doAdd", method = RequestMethod.POST)
    @ResponseBody
    public String doAdd(FengttModel model) {
        //32位随机值
        model.setId(StringHelper.getPrimaryKey());
        model.setBmid(model.getBmmc());
        //追加改动
        model.setUpdatetime(CommonUtil.getCurrentDateStr());
        model.setLastdate(CommonUtil.getCurrentDateStr());

//        String ss = JSON.toJSONString(model);
//        System.out.println("MODEL的样子：" + ss);

        if (service.add(model)) {
            return "success";
        } else {
            return "failure";
        }
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/gotoEdit", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoEdit(HttpServletRequest request) {
        String id = request.getParameter("id");
        FengttModel fm = new FengttModel();
        fm.setId(id);

        FengttModel model = (FengttModel) (service.getInfoById(fm));
        //追加改动
        model.setUpdatetime(CommonUtil.getCurrentDateStr());
        model.setLastdate(CommonUtil.getCurrentDateStr());

        ModelAndView mav = new ModelAndView("business/fengtt/edit");
        mav.addObject("model", model);
        List<CodeBean> ahList = CodeTableManager.getTableList("fengttAh");
        List<CodeBean> sclyList = CodeTableManager.getTableList("fengttScly");
        mav.addObject("ahList", ahList);
        mav.addObject("sclyList", sclyList);
        //追加
        //scly封装成json
        class sclyPojo{
            String id;
            String text;

            public String getId() {
                return id;
            }

            public void setId(String id) {
                this.id = id;
            }

            public String getText() {
                return text;
            }
            public void setText(String text) {
                this.text = text;
            }
        }
        List<sclyPojo> li = new ArrayList<sclyPojo>();
        for(CodeBean cc:sclyList){
            sclyPojo temp = new sclyPojo();
            temp.setId(cc.getCode());
            temp.setText(cc.getName());
            li.add(temp);
        }
        String liJson = CommonUtil.getJsonString(li);
        mav.addObject("sclyListJSON", liJson);
        //最擅长封装一个json
        String zscName = CodeTableManager.getNameByCode("fengttScly",model.getZsc());
        sclyPojo zsc1 = new sclyPojo();
        zsc1.setId(model.getZsc());
        zsc1.setText(zscName);
        mav.addObject("zscJson", zsc1);
        return mav;
    }

    /**
     * 更新数据
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(FengttModel model) {
        //追加改动
        model.setUpdatetime(CommonUtil.getCurrentDateStr());
        model.setLastdate(CommonUtil.getCurrentDateStr());
        //受影响的行数
        if (service.edit(model) > 0) {
            return "success";
        } else {
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
    public String gotoDelete(HttpServletRequest request) {
        String id = request.getParameter("ids");
        FengttModel fm = new FengttModel();
        fm.setId(id);
        if (service.delete(fm) > 0) {
            return "success";
        } else {
            return "failure";
        }
    }

    /**
     * 查看页面
     */
    @RequestMapping(value = "/gotoView")
    public ModelAndView gotoView(HttpServletRequest request) {
        String id = request.getParameter("id");
        FengttModel fm=new FengttModel();
        fm.setId(id);
        FengttModel model =(FengttModel) (service.getInfoById(fm));
        model.setBmmc( model.getBmmc());
        //将性别转码
        model.setSex(CodeTableManager.getNameByCode("sex",model.getSex()));
        //部门名称转码
        model.setBmmc(CodeTableManager.getNameByCode("gszbm", model.getBmmc()));
        model.setBmmc(model.getBmmc());
        //爱好转码
        String ahCode = model.getAh();
        Util.changeMutiCode(ahCode, model,"fengttAh");
        //擅长领域转码
        String sclyCode = model.getScly();
        Util.changeMutiCode(sclyCode, model,"fengttScly");
        //最擅长转码
        String zscCode = model.getZsc();
        Util.changeMutiCode(zscCode, model,"fengttScly");
        //有效值转码
        String sfcode = model.getSfyx();
        if ("1".equals(sfcode)) {
            model.setSfyx("是");
        } else {
            model.setSfyx("否");
        }
        //将地址转码
        model.setCsdsheng(CodeTableManager.getNameByCode("district", model.getCsdsheng()));
        model.setCsdshi(CodeTableManager.getNameByCode("district", model.getCsdshi()));
        model.setCsdxian(CodeTableManager.getNameByCode("district", model.getCsdxian()));

        ModelAndView mav = new ModelAndView("/business/fengtt/view");
        mav.addObject("model",model);
        return mav;
    }
}



