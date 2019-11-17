package com.hyjx.business.xiels;

import com.hyjx.framework.orm.IBaseModel;

/**
 * 实体类
 */
public class XielsModel implements IBaseModel {
    private String id;  //id
    private String name;    //姓名
    private String sex;     //性别
    private String age;     //年龄
    private String beginage;    //用于年龄段查询(开始年龄)
    private String endage;      //结束年龄
    private String birthday;    //出生日期
    private String csdsheng;    //出生地(省)
    private String csdshi;      //市
    private String csdxian;     //县
    private String csdjdmph;    //出生地门牌号
    private String bmid;        //部门id
    private String bmmc;        //部门名称
    private String ah;          //爱好
    private String sfyx;        //是否有效 1 是  0否
    private String cjrid;       //创建人id
    private String cjrxm;       //创建人姓名
    private String cjrbmid;     //创建人部门id
    private String cjrbmmc;     //创建人部门名称
    private String scly;        //擅长领域
    private String begin_bir;
    private String end_bir;

    public String getBegin_bir() {
        return begin_bir;
    }

    public void setBegin_bir(String begin_bir) {
        this.begin_bir = begin_bir;
    }

    public String getEnd_bir() {
        return end_bir;
    }

    public void setEnd_bir(String end_bir) {
        this.end_bir = end_bir;
    }

    public String getScly() {
        return scly;
    }

    public void setScly(String scly) {
        this.scly = scly;
    }

    public String getBeginage() {
        return beginage;
    }

    public void setBeginage(String beginage) {
        this.beginage = beginage;
    }

    public String getEndage() {
        return endage;
    }

    public void setEndage(String endage) {
        this.endage = endage;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
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

    @Override
    public String getModuleName() {
        return "com.hyjx.business.xiels";
    }
}

