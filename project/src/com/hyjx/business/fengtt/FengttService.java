package com.hyjx.business.fengtt;

import com.hyjx.business.hanr.HanrModel;
import com.hyjx.framework.orm.IBaseModel;
import com.hyjx.framework.orm.IBaseService;
import com.hyjx.framework.orm.dao.Pager;

public interface FengttService extends IBaseService {
    String queryList(FengttModel iBaseModel);
}
