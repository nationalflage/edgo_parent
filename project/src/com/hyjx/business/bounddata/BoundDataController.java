package com.hyjx.business.bounddata;

import com.alibaba.fastjson.JSONObject;
import com.hyjx.framework.orm.dao.IBaseDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
*
* 描述： Controller
* @author DESKTOP-24SOCQR
*
*/
@Controller
@RequestMapping("/lyw")
public class  BoundDataController{
	@Resource
    private IBaseDao dao;

	@RequestMapping("/area")
	public ModelAndView getArea(){
		ModelAndView mav = new ModelAndView("/business/bounddata/area");
		BoundDataModel model=new BoundDataModel();
		model.setType("2");//找区，不找镇
        String jsonStr = dao.getPageJsonStr(model.getModuleName() + ".queryList",
                model.getModuleName() + ".queryCount", model, 1, 17);
        JSONObject jsonObject = JSONObject.parseObject(jsonStr);
        com.alibaba.fastjson.JSONArray rows = jsonObject.getJSONArray("rows");
        List<List<String>> sb = new ArrayList<List<String>>();
        List<List<String>> center = new ArrayList<List<String>>();
        List<String> name = new ArrayList<String>();
        for (int i = 0; i < rows.size(); i++) {
            List<String> P = new ArrayList<String>();
            List<String> ct = new ArrayList<String>();
            JSONObject Object = rows.getJSONObject(i);
            String boundary = Object.getString("boundary");
            String s1 = Object.getString("name");
            String lng = Object.getString("lng");
            String lat = Object.getString("lat");
            String[] str = boundary.split(";");
            for (String s :str) {
                P.add(s);
            }
            ct.add(lng);
            ct.add(lat);
            name.add(s1);
            center.add(ct);
            P.remove(P.size()-1);
            sb.add(P);
        }

        net.sf.json.JSONArray jsonArrays = net.sf.json.JSONArray.fromObject(sb);
        net.sf.json.JSONArray jsonname = net.sf.json.JSONArray.fromObject(name);
        net.sf.json.JSONArray cent = net.sf.json.JSONArray.fromObject(center);
        mav.addObject("points",jsonArrays);
        mav.addObject("name",jsonname);
        mav.addObject("center",cent);
		return mav;
	}


}