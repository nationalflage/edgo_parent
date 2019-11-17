package com.hyjx.business.tiany;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.orm.BaseService;
import com.hyjx.framework.orm.IBaseModel;
import com.hyjx.framework.orm.dao.IBaseDao;
import com.hyjx.framework.orm.dao.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TianyServiceImpl extends BaseService implements TianyService {
//    @Resource
//    private IBaseDao dao;
//
//
//
//    public String queryList(IBaseModel model) {
//        Pager pager = this.dao.getPager(model.getModuleName() + ".queryList", model.getModuleName() + ".queryCount", model);
//        return CommonUtil.getPageJsonStr(pager);
//    }
//
//    public Pager queryListA(IBaseModel model) {
//        Pager pager = this.dao.getPager(model.getModuleName() + ".queryList", model.getModuleName() + ".queryCount", model);
//        return pager;
//    }
//
//    public boolean add(IBaseModel model) {
//        return this.dao.addObject(model.getModuleName() + ".insert", model);
//    }
//
//    public IBaseModel getInfoById(IBaseModel model) {
//        return (IBaseModel)this.dao.queryObject(model.getModuleName() + ".getInfoById", model);
//    }
//
//    public int edit(IBaseModel model) {
//        return this.dao.updateObject(model.getModuleName() + ".update", model);
//    }
//
//    public int delete(IBaseModel model) {
//        return this.dao.deleteObject(model.getModuleName() + ".delete", model);
//    }
}
