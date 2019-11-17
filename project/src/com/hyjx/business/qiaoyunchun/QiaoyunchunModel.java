package com.hyjx.business.qiaoyunchun;
import com.hyjx.framework.orm.IBaseModel;

/**
	实体类
*/
public class QiaoyunchunModel implements IBaseModel{
	private String id;//32位随机id
	private String name;//姓名
	private String sex;//性别
	private String age;//年龄
	private String birthday;//出生年月
	private String csdsheng;//出生地
	private String csdshi;//市
	private String csdxian;//县
	private String csdjdmph;//具体门牌号
	private String bmid;//部门id
	private String bmmc;//部门名称
	private String ah;//爱好
	private String sfyx;//是否有效
	private String cjrid;//创建人id
	private String cjrxm;//创建人姓名
	private String cjrbmid;//创建人部门id
	private String cjrbmmc;//创建人部门名称
	private String scly;//擅长领域
	private String zsc;//最擅长领域
	private String qssj;      //起始时间
	private String jzsj;      //截止时间
	private String lastdate;//最后一次添加或更新时间
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setSex(String sex){
		this.sex = sex;
	}
	public String getSex(){
		return this.sex;
	}
	public void setAge(String age){
		this.age = age;
	}
	public String getAge(){
		return this.age;
	}
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}
	public String getBirthday(){
		return this.birthday;
	}
	public void setCsdsheng(String csdsheng){
		this.csdsheng = csdsheng;
	}
	public String getCsdsheng(){
		return this.csdsheng;
	}
	public void setCsdshi(String csdshi){
		this.csdshi = csdshi;
	}
	public String getCsdshi(){
		return this.csdshi;
	}
	public void setCsdxian(String csdxian){
		this.csdxian = csdxian;
	}
	public String getCsdxian(){
		return this.csdxian;
	}
	public void setCsdjdmph(String csdjdmph){
		this.csdjdmph = csdjdmph;
	}
	public String getCsdjdmph(){
		return this.csdjdmph;
	}
	public void setBmid(String bmid){
		this.bmid = bmid;
	}
	public String getBmid(){
		return this.bmid;
	}
	public void setBmmc(String bmmc){
		this.bmmc = bmmc;
	}
	public String getBmmc(){
		return this.bmmc;
	}
	public void setAh(String ah){
		this.ah = ah;
	}
	public String getAh(){
		return this.ah;
	}
	public void setSfyx(String sfyx){
		this.sfyx = sfyx;
	}
	public String getSfyx(){
		return this.sfyx;
	}
	public void setCjrid(String cjrid){
		this.cjrid = cjrid;
	}
	public String getCjrid(){
		return this.cjrid;
	}
	public void setCjrxm(String cjrxm){
		this.cjrxm = cjrxm;
	}
	public String getCjrxm(){
		return this.cjrxm;
	}
	public void setCjrbmid(String cjrbmid){
		this.cjrbmid = cjrbmid;
	}
	public String getCjrbmid(){
		return this.cjrbmid;
	}
	public void setCjrbmmc(String cjrbmmc){
		this.cjrbmmc = cjrbmmc;
	}
	public String getCjrbmmc(){
		return this.cjrbmmc;
	}
	public void setScly(String scly){
		this.scly = scly;
	}
	public String getScly(){
		return this.scly;
	}
	public void setZsc(String zsc){
		this.zsc = zsc;
	}
	public String getZsc(){
		return this.zsc;
	}
	public void setLastdate(String lastdate){
		this.lastdate = lastdate;
	}
	public String getLastdate(){
		return this.lastdate;
	}
	public String getQssj() {
		return qssj;
	}
	public void setQssj(String qssj) {
		this.qssj = qssj;
	}
	public String getJzsj() {
		return jzsj;
	}
	public void setJzsj(String jzsj) {
		this.jzsj = jzsj;
	}
	@Override
	public String getModuleName() {
		return "com.hyjx.business.qiaoyunchun";
	}
}