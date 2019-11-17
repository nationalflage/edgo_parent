package com.hyjx.business.sunj_gis;

import com.hyjx.framework.orm.IBaseModel;

/*
    实体类
 */
public class Sunj_gisModel implements IBaseModel {
    private String id ;
    private String mainid;
    private String pid;
    private String name;
    private String boundary;
    private String datetime;
    private String type;
    private String innerBoundary;
    private String centerLng;
    private String centerLat;
    private String airgeion;
    private String airmc;
    private String town;
    private String townmc;
    private String lng;
    private String lat;
    private String business;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMainid() {
        return mainid;
    }

    public void setMainid(String mainid) {
        this.mainid = mainid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBoundary() {
        return boundary;
    }

    public void setBoundary(String boundary) {
        this.boundary = boundary;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getInnerBoundary() {
        return innerBoundary;
    }

    public void setInnerBoundary(String innerBoundary) {
        this.innerBoundary = innerBoundary;
    }

    public String getCenterLng() {
        return centerLng;
    }

    public void setCenterLng(String centerLng) {
        this.centerLng = centerLng;
    }

    public String getCenterLat() {
        return centerLat;
    }

    public void setCenterLat(String centerLat) {
        this.centerLat = centerLat;
    }

    public String getAirgeion() {
        return airgeion;
    }

    public void setAirgeion(String airgeion) {
        this.airgeion = airgeion;
    }

    public String getAirmc() {
        return airmc;
    }

    public void setAirmc(String airmc) {
        this.airmc = airmc;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getTownmc() {
        return townmc;
    }

    public void setTownmc(String townmc) {
        this.townmc = townmc;
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

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.sunj_gis";
    }
}

