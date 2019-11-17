package com.hyjx.business.sunj_gis;

import com.hyjx.framework.orm.IBaseModel;

/*
    实体类
 */
public class Sunj_gisModel3 implements IBaseModel {
    private String num;
    private String lng;
    private String lat;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.sunj_gis";
    }
}

