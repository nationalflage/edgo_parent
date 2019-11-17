package com.hyjx.business.zhangxr;

import com.hyjx.framework.orm.IBaseModel;

/*
    实体类
 */
public class ZhangxrModel implements IBaseModel {
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
    private String cjrid;
    private String cjrxm;
    private String cjrbmid;
    private String cjrbmmc;
    private String scly;

    public String getScly() {
        return scly;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getAge() {
        return age;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getCsdsheng() {
        return csdsheng;
    }

    public String getCsdshi() {
        return csdshi;
    }

    public String getCsdxian() {
        return csdxian;
    }

    public String getCsdjdmph() {
        return csdjdmph;
    }

    public String getBmid() {
        return bmid;
    }

    public String getBmmc() {
        return bmmc;
    }

    public String getAh() {
        return ah;
    }

    public String getSfyx() {
        return sfyx;
    }

    public String getCjrid() {
        return cjrid;
    }

    public String getCjrxm() {
        return cjrxm;
    }

    public String getCjrbmid() {
        return cjrbmid;
    }

    public String getCjrbmmc() {
        return cjrbmmc;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public void setScly(String scly) {
        this.scly = scly;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setCsdsheng(String csdsheng) {
        this.csdsheng = csdsheng;
    }

    public void setCsdshi(String csdshi) {
        this.csdshi = csdshi;
    }

    public void setCsdxian(String csdxian) {
        this.csdxian = csdxian;
    }

    public void setCsdjdmph(String csdjdmph) {
        this.csdjdmph = csdjdmph;
    }

    public void setBmid(String bmid) {
        this.bmid = bmid;
    }

    public void setBmmc(String bmmc) {
        this.bmmc = bmmc;
    }

    public void setAh(String ah) {
        this.ah = ah;
    }

    public void setSfyx(String sfyx) {
        this.sfyx = sfyx;
    }

    public void setCjrid(String cjrid) {
        this.cjrid = cjrid;
    }

    public void setCjrxm(String cjrxm) {
        this.cjrxm = cjrxm;
    }

    public void setCjrbmid(String cjrbmid) {
        this.cjrbmid = cjrbmid;
    }

    public void setCjrbmmc(String cjrbmmc) {
        this.cjrbmmc = cjrbmmc;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.zhangxr";
    }
}
