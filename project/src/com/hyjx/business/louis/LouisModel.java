package com.hyjx.business.louis;

import com.hyjx.framework.orm.IBaseModel;

/**
 * @Auther: Louis
 * @Description: com.hyjx.business.louis
 * @version: 1.0
 */
public class LouisModel implements IBaseModel {
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

    public void setAge(String age) { this.age = age; }

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

    public String getCsdjdmph() { return csdjdmph; }

    public void setCsdjdmph(String csdjtmph) { this.csdjdmph = csdjtmph; }

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

    public LouisModel() {
    }

    public LouisModel(String id, String name, String sex, String age, String birthday, String csdsheng, String csdshi, String csdxian, String csdjtmph, String bmid, String bmmc, String ah, String sfyx, String cjrid, String cjrxm, String cjrbmid, String cjrbmmc) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.birthday = birthday;
        this.csdsheng = csdsheng;
        this.csdshi = csdshi;
        this.csdxian = csdxian;
        this.csdjdmph = csdjdmph;
        this.bmid = bmid;
        this.bmmc = bmmc;
        this.ah = ah;
        this.sfyx = sfyx;
        this.cjrid = cjrid;
        this.cjrxm = cjrxm;
        this.cjrbmid = cjrbmid;
        this.cjrbmmc = cjrbmmc;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.louis";
    }
}
