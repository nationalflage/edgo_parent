package com.hyjx.business.pujl;

import com.hyjx.framework.orm.IBaseModel;

/**
 * @Auther: Pujl
 * @Description: com.hyjx.business.pujl
 * @version: 1.0
 */

public class PujlModel implements IBaseModel {

//    定义实体类
    String id;
    String name;
    String sex;
    String age;
    String birthday;
    String csdsheng;
    String csdshi;
    String csdxian;
    String csdjdmph;
    String bmid;
    String bmmc;
    String ah;
    String sfyx;
    String cjrid;
    String cjrxm;
    String cjrbmid;
    String cjrbmmc;
    String scly;
    String lastdate;
    String zxc;

    //    封装
    //    ID
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    //姓名
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    //性别
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    //年龄
    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }
    //生日
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    //出生地省
    public String getCsdsheng() {
        return csdsheng;
    }
    public void setCsdsheng(String csdsheng) {
        this.csdsheng = csdsheng;
    }
    //出生地市
    public String getCsdshi() {
        return csdshi;
    }
    public void setCsdshi(String csdshi) {
        this.csdshi = csdshi;
    }
    //    出生地县
    public String getCsdxian() {
        return csdxian;
    }
    public void setCsdxian(String csdxian) {
        this.csdxian = csdxian;
    }
    //    出生地具体门牌号
    public String getCsdjdmph() {
        return csdjdmph;
    }
    public void setCsdjdmph(String csdjdmph) {
        this.csdjdmph = csdjdmph;
    }
    //    部门ID
    public String getBmid() {
        return bmid;
    }
    public void setBmid(String bmid) {
        this.bmid = bmid;
    }
    //    部门名称
    public String getBmmc() {
        return bmmc;
    }
    public void setBmmc(String bmmc) {
        this.bmmc = bmmc;
    }
    //    爱好
    public String getAh() {
        return ah;
    }
    public void setAh(String ah) {
        this.ah = ah;
    }
    //    是否有效
    public String getsfyx() {
        return sfyx;
    }
    public void setsfyx(String sfyx) {
        this.sfyx = sfyx;
    }
//    创建人ID
    public String getcjrid(){
        return cjrid;
    }
    public void setcjrid(String cjrid){
        this.cjrid = cjrid;
    }
//    创建人姓名
    public String getcjrxm(){
        return cjrxm;
    }
    public void setcjrxm(String cjrxm){
        this.cjrxm = cjrxm;
    }
//    创建人部门ID
    public String getcjrbmid(){
        return cjrbmid;
    }
    public void setcjrbmid(String cjrbmid){
        this.cjrbmid = cjrbmid;
    }
//    创建人部门名称
    public String getcjrbmmc(){
        return cjrbmmc;
    }
    public void setcjrbmmc(String cjrbmmc){
        this.cjrbmmc = cjrbmmc;
    }
//    擅长领域
    public String getscly(){
        return scly;
    }
    public void setscly(String scly){
        this.scly = scly;
    }
//    修改日期
    public String getlastdate(){
        return lastdate;
    }
    public void setlastdate(String lastdate){
        this.lastdate = lastdate;
    }
//    最擅长
    public String getzxc(){
        return zxc;
    }
    public void setzxc(String zxc){
        this.zxc = zxc;
    }

    @Override
    public String getModuleName() {
        return "com.hyjx.business.pujl";
    }
}
