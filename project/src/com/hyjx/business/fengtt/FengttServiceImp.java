package com.hyjx.business.fengtt;

import com.hyjx.business.hanr.HanrModel;
import com.hyjx.business.hanr.IHanrService;
import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.component.codetable.CodeTableManager;
import com.hyjx.framework.orm.BaseService;
import com.hyjx.framework.orm.IBaseModel;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.orm.dao.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class FengttServiceImp extends BaseService implements FengttService {

    @Resource
    private IBaseDao dao;

    public String queryList(FengttModel model) {
        //没有复选字段直接回传
        String scly = model.getScly();
        if (scly != null && scly != "") {
            Pager pager = this.dao.getPager(model.getModuleName() + ".queryList", model.getModuleName() + ".queryCount", model);
            return CommonUtil.getPageJsonStr(pager);
        } else {//有了复选字段，分页到时候再说
            if(scly.contains(",")){
                String[] ss = scly.split(",");
                String[] sss = new String[5];
                for (int i=0;i<ss.length;i++){
                    sss[i] = ss[i];
                }
                model.setAh1(sss[0]);
                model.setAh2(sss[1]);
                model.setAh3(sss[2]);
                model.setAh1(sss[3]);
                model.setAh1(sss[4]);
                Pager pager = this.dao.getPager(model.getModuleName() + ".queryList", model.getModuleName() + ".queryCount", model);
                return CommonUtil.getPageJsonStr(pager);
            }else {//单值
                model.setAh1(scly);
                Pager pager = this.dao.getPager(model.getModuleName() + ".queryList", model.getModuleName() + ".queryCount", model);
                return CommonUtil.getPageJsonStr(pager);
            }
        }

    }
}

