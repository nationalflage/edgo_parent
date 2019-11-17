package com.hyjx.business.linyw_build;
import com.hyjx.framework.orm.IBaseModel;

/**
	实体类
*/
public class LywBuild_Model implements IBaseModel{
	private String id;//主键
	private String name;//姓名
	private String sex;//性别
	private String age;//年龄
	private String birthday;//出生年月
	private String csdsheng;//出生地省
	private String csdshi;//市
	private String csdxian;//县
	private String csdjtmph;//具体门牌号
	private String bmid;//部门id
	private String bmmc;//部门名称
	private String lywAh;//爱好
	private String sfyx;//是否有效
	private String cjrid;//创建人id
	private String cjrxm;//创建人姓名
	private String cjrbmid;//创建人部门id
	private String cjrbmmc;//创建人部门名称
	private String sjc;//上次操作时间
	private String lywLy;//擅长领域
	private String zscly;//最擅长的领域
	private String qssj;
	private String jzsj;

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
	public void setCsdjtmph(String csdjtmph){
		this.csdjtmph = csdjtmph;
	}
	public String getCsdjtmph(){
		return this.csdjtmph;
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
	public void setLywAh(String lywAh){
		this.lywAh = lywAh;
	}
	public String getLywAh(){
		return this.lywAh;
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
	public void setSjc(String sjc){
		this.sjc = sjc;
	}
	public String getSjc(){
		return this.sjc;
	}
	public void setLywLy(String lywLy){
		this.lywLy = lywLy;
	}
	public String getLywLy(){
		return this.lywLy;
	}
	public void setZscly(String zscly){
		this.zscly = zscly;
	}
	public String getZscly(){
		return this.zscly;
	}

	@Override
	public String toString() {
		return "LywBuild_Model{" +
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
				", lywAh='" + lywAh + '\'' +
				", sfyx='" + sfyx + '\'' +
				", cjrid='" + cjrid + '\'' +
				", cjrxm='" + cjrxm + '\'' +
				", cjrbmid='" + cjrbmid + '\'' +
				", cjrbmmc='" + cjrbmmc + '\'' +
				", sjc='" + sjc + '\'' +
				", lywLy='" + lywLy + '\'' +
				", zscly='" + zscly + '\'' +
				", qssj='" + qssj + '\'' +
				", jzsj='" + jzsj + '\'' +
				'}';
	}

	@Override
	public String getModuleName() {
		return "com.hyjx.business.linyw_build";
	}
}