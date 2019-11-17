package com.hyjx.business.niuhp_study;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyjx.framework.orm.BaseService;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
@Service
public class NiuhpDeptServiceImp extends BaseService  implements NiuhpDeptService {
	/*
	@Override
	public List<NiuhpDept> findByCode(String code) {
		List<NiuhpDept>deptListP=null;
		try {
			deptListP=sqlMap.queryForList("queryDeptParent",code);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deptListP;
	}

	@Override
	public List<NiuhpDept> findbyParentCode(String parentcode) {
		List<NiuhpDept>deptListC=null;
		try {
			deptListC=sqlMap.queryForList("queryDeptChildren",parentcode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deptListC;
	}*/

}
