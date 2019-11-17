package com.hyjx.business.xiangw;

import com.hyjx.framework.orm.IBaseModel;

import java.util.Date;

public class XiangWModel implements IBaseModel {
    private String id;
    private String name;
    private String sex;
    private String age;
    private String birthday;
    private String csdsheng;
    private String csdshi;
    private String csdxian;
    private String csdjdmph;
    private String bmid;
    private String bmmc;
    private String ah;
    private String sfyx;
    private String scly;
    private String cjrid;
    private String cjrxm;
    private String cjrbmid;
    private String cjrbmmc;
    private  Date  lastdate;
    private String begindate;
    private String enddate;

    public String getBegindate() {
        return begindate;
    }

    public void setBegindate(String begindate) {
        this.begindate = begindate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCsdsheng() {
        return csdsheng;
    }

    public void setCsdsheng(String csdsheng) {
        this.csdsheng = csdsheng;
    }

    public String getCsdshi() {
        return csdshi;
    }

    public void setCsdshi(String csdshi) {
        this.csdshi = csdshi;
    }

    public String getCsdxian() {
        return csdxian;
    }

    public void setCsdxian(String csdxian) {
        this.csdxian = csdxian;
    }

    public String getCsdjdmph() {
        return csdjdmph;
    }

    public void setCsdjdmph(String csdjdmph) {
        this.csdjdmph = csdjdmph;
    }

    public String getBmid() {
        return bmid;
    }

    public void setBmid(String bmid) {
        this.bmid = bmid;
    }

    public String getBmmc() {
        return bmmc;
    }

    public void setBmmc(String bmmc) {
        this.bmmc = bmmc;
    }

    public String getAh() {
        return ah;
    }

    public void setAh(String ah) {
        this.ah = ah;
    }

    public String getSfyx() {
        return sfyx;
    }

    public void setSfyx(String sfyx) {
        this.sfyx = sfyx;
    }

    public String getCjrid() {
        return cjrid;
    }

    public void setCjrid(String cjrid) {
        this.cjrid = cjrid;
    }

    public String getCjrxm() {
        return cjrxm;
    }

    public void setCjrxm(String cjrxm) {
        this.cjrxm = cjrxm;
    }

    public String getCjrbmid() {
        return cjrbmid;
    }

    public void setCjrbmid(String cjrbmid) {
        this.cjrbmid = cjrbmid;
    }

    public String getCjrbmmc() {
        return cjrbmmc;
    }

    public void setCjrbmmc(String cjrbmmc) {
        this.cjrbmmc = cjrbmmc;
    }

    public String getScly() {
        return scly;
    }

    public void setScly(String scly) {
        this.scly = scly;
    }

    @Override
    public String toString() {
        return "XiangWModel{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", birthday='" + birthday + '\'' +
                ", csdsheng='" + csdsheng + '\'' +
                ", csdshi='" + csdshi + '\'' +
                ", csdxian='" + csdxian + '\'' +
                ", csdjpbm='" + csdjdmph + '\'' +
                ", bmid='" + bmid + '\'' +
                ", bmmc='" + bmmc + '\'' +
                ", ah='" + ah + '\'' +
                ", sfyx='" + sfyx + '\'' +
                ", cjrid='" + cjrid + '\'' +
                ", cjrxm='" + cjrxm + '\'' +
                ", cjrbmid='" + cjrbmid + '\'' +
                ", cjrbmmc='" + cjrbmmc + '\'' +
                ", scly='" + scly + '\'' +
                '}';
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.xiangw";
    }
}
