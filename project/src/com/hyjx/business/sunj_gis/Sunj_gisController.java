package com.hyjx.business.sunj_gis;
import com.alibaba.fastjson.JSONObject;
import com.hyjx.framework.orm.dao.IBaseDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping("/sunj_gis")
public class Sunj_gisController {
    @Resource
    private IBaseDao dao;
    /**
     * 边界
     */
    @RequestMapping(value = "/sunj_map_gis")
    public ModelAndView gotoList() {
        //创建视图解析器，用于定位和传递数据
        ModelAndView mav = new ModelAndView("/business/sunj_web_gis/sunj_map_gis");
        //创建model对象，数据载体javabean
        Sunj_gisModel model  = new Sunj_gisModel();
        //给model插入查询条件，查询区
        model.setType("2");
        //查询符合条件的值，封装成字符串返回
        String jsonStr = dao.getPageJsonStr(model.getModuleName() + ".queryArea",
                model.getModuleName() + ".queryCount", model, 1, 17);
        //将字符串转换成jsonObject
        JSONObject jsonObject = JSONObject.parseObject(jsonStr);
        //转换成json数组
        com.alibaba.fastjson.JSONArray rows = jsonObject.getJSONArray("rows");
        //区域
        List<List<String>> bdary = new ArrayList<List<String>>();
        //中心
        List<List<String>> center = new ArrayList<List<String>>();
        //区域名字，中心点名称
        List<String> name = new ArrayList<String>();
        //开始封装数据
        for(int i = 0;i<rows.size();i++){
            //边界数据
            List<String> P = new ArrayList<String>();
            //中心点数据
            List<String> ct = new ArrayList<String>();
            JSONObject Object = rows.getJSONObject(i);
            //获取数据
            String boundary = Object.getString("boundary");
            String s1 = Object.getString("name");
            String lng = Object.getString("lng");
            String lat = Object.getString("lat");
            String[] str = boundary.split(";");
            for (String s:str){
                //将边界数据放入P集合中
                P.add(s);
            }
            //将中心点的数据放入ct集合中
            ct.add(lng);
            ct.add(lat);
            //区域名称放入name集合中
            name.add(s1);
            //将中心点放到center集合中
            center.add(ct);
            //边界数据最后多带一个;所以多分一次，移除最后一个空数据
            P.remove(P.size()-1);
            //将边界数据放入bdary集合中
            bdary.add(P);
        }
        //做数据转换
        net.sf.json.JSONArray areaBdary = net.sf.json.JSONArray.fromObject(bdary);
        net.sf.json.JSONArray areaName = net.sf.json.JSONArray.fromObject(name);
        net.sf.json.JSONArray areaCenter = net.sf.json.JSONArray.fromObject(center);
        //将数据放到mav中返回
        mav.addObject("points",areaBdary);
        mav.addObject("name",areaName);
        mav.addObject("center",areaCenter);
        //返回mav
        return mav;
    }

    /**
     * 边界
     * @param request
     * @return
     */
    @RequestMapping(value="/xxx")
    public String index0(HttpServletRequest request){
        //用list接收返回的数据
        List<Sunj_gisModel> list = new ArrayList<Sunj_gisModel>();
        list = dao.queryObjectList("com.hyjx.business.sunj_gis.queryList1");
        //将list放入request中，前端可以接收
        request.setAttribute("list",list);
        //返回jsp路径
        return  "/business/sunj_web_gis/sunj_map_gis";
    }


    @RequestMapping(value = "/gotoList")
    public String index1(HttpServletRequest request){
        List<Sunj_gisModel2> list= dao.queryObjectList("com.hyjx.business.sunj_gis.queryList2");
        request.setAttribute("list",list);
        return "/business/sunj_web_gis/sunj_ent_gis";
    }

    @RequestMapping(value = "/gotoRed")
    public String index2(HttpServletRequest request){
        List<Sunj_gisModel2> list= dao.queryObjectList("com.hyjx.business.sunj_gis.queryList3");
        request.setAttribute("list",list);
        return "/business/sunj_web_gis/sunj_red_gis";
    }

}

