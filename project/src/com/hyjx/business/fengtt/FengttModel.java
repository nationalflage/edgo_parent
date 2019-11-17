package com.hyjx.business.fengtt;

import com.hyjx.framework.orm.IBaseModel;



//fengtt_STUDY表的实体类
public class FengttModel implements IBaseModel {

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
    //更新时间字段
    private String updatetime;
    //追加字段
    private String scly;
    //java.sql.Date
    private String lastdate;
    private String zsc;
    //时间
    private String starttime;
    private String endtime;
    private String language;
    //emmm生活所迫
    private String ah1;
    private String ah2;
    private String ah3;
    private String ah4;
    private String ah5;

    public String getAh1() {
        return ah1;
    }

    public void setAh1(String ah1) {
        this.ah1 = ah1;
    }

    public String getAh2() {
        return ah2;
    }

    public void setAh2(String ah2) {
        this.ah2 = ah2;
    }

    public String getAh3() {
        return ah3;
    }

    public void setAh3(String ah3) {
        this.ah3 = ah3;
    }

    public String getAh4() {
        return ah4;
    }

    public void setAh4(String ah4) {
        this.ah4 = ah4;
    }

    public String getAh5() {
        return ah5;
    }

    public void setAh5(String ah5) {
        this.ah5 = ah5;
    }

    public FengttModel() {
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLastdate() {
        return lastdate;
    }

    public void setLastdate(String lastdate) {
        this.lastdate = lastdate;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getZsc() {
        return zsc;
    }

    public void setZsc(String zsc) {
        this.zsc = zsc;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getScly() {
        return scly;
    }

    public void setScly(String scly) {
        this.scly = scly;
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


    @Override
    public String getModuleName() {
        return "com.hyjx.business.fengtt";
    }
}
