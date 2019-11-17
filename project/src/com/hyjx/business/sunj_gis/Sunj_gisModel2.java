package com.hyjx.business.sunj_gis;

import com.hyjx.framework.orm.IBaseModel;

/*
    实体类
 */
public class Sunj_gisModel2 implements IBaseModel {
    private String entname;
    private String uniscid;
    private String dom;
    private String lat;
    private String lng;

    public String getEntname() {
        return entname;
    }

    public void setEntname(String entname) {
        this.entname = entname;
    }

    public String getUniscid() {
        return uniscid;
    }

    public void setUniscid(String uniscid) {
        this.uniscid = uniscid;
    }

    public String getDom() {
        return dom;
    }

    public void setDom(String dom) {
        this.dom = dom;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.sunj_gis";
    }
}

