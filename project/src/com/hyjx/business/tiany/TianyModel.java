package com.hyjx.business.tiany;

import com.hyjx.framework.orm.IBaseModel;

/**
 实体类
 */
public class TianyModel implements IBaseModel {
    private String id;
    private String name;
    private String sex;
    private String age;
    private String birthday;
    private String csdsheng;
    private String csdshi;
    private String csdxian;
    private String csdjtmph;
    private String bmid;
    private String bmmc;
    private String ah;
    private String sfyx;
    private String cjrid;
    private String cjrxm;
    private String cjrbmid;
    private String cjrbmmc;
    private String ly;

    public String getLy() {
        return ly;
    }

    public void setLy(String ly) {
        this.ly = ly;
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

    public String getCsdjtmph() {
        return csdjtmph;
    }

    public void setCsdjtmph(String csdjtmph) {
        this.csdjtmph = csdjtmph;
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

    @Override
    public String toString() {
        return "TianyModel{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", birthday='" + birthday + '\'' +
                ", csdsheng='" + csdsheng + '\'' +
                ", csdshi='" + csdshi + '\'' +
                ", csdxian='" + csdxian + '\'' +
                ", csdjtmph='" + csdjtmph + '\'' +
                ", bmid='" + bmid + '\'' +
                ", bmmc='" + bmmc + '\'' +
                ", ah='" + ah + '\'' +
                ", sfyx='" + sfyx + '\'' +
                ", cjrid='" + cjrid + '\'' +
                ", cjrxm='" + cjrxm + '\'' +
                ", cjrbmid='" + cjrbmid + '\'' +
                ", cjrbmmc='" + cjrbmmc + '\'' +
                ", expert='" + ly + '\'' +
                '}';
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.tiany";
    }
}
