package com.hyjx.business.mengt;

import com.hyjx.framework.orm.IBaseModel;

import java.util.Date;

/**
 *
 * @Auther: blackcat
 * @Date: 2019/10/18
 * @Description: com.hyjx.business.mengt
 * @version:
 */
public class MengtModel implements IBaseModel {
    private String id;//id
    private String name;//姓名
    private String sex;//性别
    private String age;//年龄
    private String birthday;//出生年月
    private String csdsheng;//出生地省
    private String csdshi;//出生地市
    private String csdxian;//出生地县
    private String csdjdmph;//出生地具体门牌号
    private String bmid;//部门id
    private String bmmc;//部门名称
    private String ah;//爱好
    private String sfyx;//是否有效
    private String cjrid;//创建人id
    private String cjrxm;//创建人姓名
    private String cjrbmid;//创建人部门id
    private String cjrbmmc;//创建人部门名称
    private Date lastdate; //更新时间

    private String scly;//擅长领域
    private String zsc;// 最擅长

    @Override
    public String toString() {
        return "MengtModel{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", birthday='" + birthday + '\'' +
                ", csdsheng='" + csdsheng + '\'' +
                ", csdshi='" + csdshi + '\'' +
                ", csdxian='" + csdxian + '\'' +
                ", csdjdmph='" + csdjdmph + '\'' +
                ", bmid='" + bmid + '\'' +
                ", bmmc='" + bmmc + '\'' +
                ", ah='" + ah + '\'' +
                ", sfyx='" + sfyx + '\'' +
                ", cjrid='" + cjrid + '\'' +
                ", cjrxm='" + cjrxm + '\'' +
                ", cjrbmid='" + cjrbmid + '\'' +
                ", cjrbmmc='" + cjrbmmc + '\'' +
                ", lastdate=" + lastdate +
                ", scly='" + scly + '\'' +
                ", zsc='" + zsc + '\'' +
                '}';
    }

    public String getScly() {
        return scly;
    }

    public void setScly(String scly) {
        this.scly = scly;
    }

    public String getZsc() {
        return zsc;
    }

    public void setZsc(String zsc) {
        this.zsc = zsc;
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

    @Override
    public String getModuleName() {
        return "com.hyjx.business.mengt";
    }
}
