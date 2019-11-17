package com.hyjx.business.liulmNew;
import com.hyjx.framework.orm.IBaseModel;

/**
	实体类
*/
public class LiulmNewModel implements IBaseModel{
	private String id;//32位随机id
	private String name;//姓名
	private String sex;//性别
	private String age;//年龄
	private String birthday;//出生日期
	private String csdProvince;//出生地
	private String csdCity;//出生地
	private String csdArea;//出生地
	private String csdAddress;//具体门牌号
	private String deptId;//部门id
	private String deptName;//部门名称
	private String hobby;//爱好
	private String valid;//是否有效
	private String createdId;//创建人id
	private String createdName;//创建人姓名
	private String createdDeptId;//创建人部门id
	private String createdDeptName;//创建人部门名称
	private String scly;//擅长领域
	private String createdTime;//创建时间
	private String modifiedTime;//修改时间

	private String minAge;//最小年龄
	private String maxAge;//最大年龄
	private String minBirthday;//最小出生日期
	private String maxBirthday;//最大出生日期

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
	public void setCsdProvince(String csdProvince){
		this.csdProvince = csdProvince;
	}
	public String getCsdProvince(){
		return this.csdProvince;
	}
	public void setCsdCity(String csdCity){
		this.csdCity = csdCity;
	}
	public String getCsdCity(){
		return this.csdCity;
	}
	public void setCsdArea(String csdArea){
		this.csdArea = csdArea;
	}
	public String getCsdArea(){
		return this.csdArea;
	}
	public void setCsdAddress(String csdAddress){
		this.csdAddress = csdAddress;
	}
	public String getCsdAddress(){
		return this.csdAddress;
	}
	public void setDeptId(String deptId){
		this.deptId = deptId;
	}
	public String getDeptId(){
		return this.deptId;
	}
	public void setDeptName(String deptName){
		this.deptName = deptName;
	}
	public String getDeptName(){
		return this.deptName;
	}
	public void setHobby(String hobby){
		this.hobby = hobby;
	}
	public String getHobby(){
		return this.hobby;
	}
	public void setValid(String valid){
		this.valid = valid;
	}
	public String getValid(){
		return this.valid;
	}
	public void setCreatedId(String createdId){
		this.createdId = createdId;
	}
	public String getCreatedId(){
		return this.createdId;
	}
	public void setCreatedName(String createdName){
		this.createdName = createdName;
	}
	public String getCreatedName(){
		return this.createdName;
	}
	public void setCreatedDeptId(String createdDeptId){
		this.createdDeptId = createdDeptId;
	}
	public String getCreatedDeptId(){
		return this.createdDeptId;
	}
	public void setCreatedDeptName(String createdDeptName){
		this.createdDeptName = createdDeptName;
	}
	public String getCreatedDeptName(){
		return this.createdDeptName;
	}
	public void setScly(String scly){
		this.scly = scly;
	}
	public String getScly(){
		return this.scly;
	}
	public String getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}
	public String getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public String getMinAge() {
		return minAge;
	}
	public void setMinAge(String minAge) {
		this.minAge = minAge;
	}
	public String getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(String maxAge) {
		this.maxAge = maxAge;
	}
	public String getMinBirthday() {
		return minBirthday;
	}
	public void setMinBirthday(String minBirthday) {
		this.minBirthday = minBirthday;
	}
	public String getMaxBirthday() {
		return maxBirthday;
	}
	public void setMaxBirthday(String maxBirthday) {
		this.maxBirthday = maxBirthday;
	}

	@Override
	public String getModuleName() {
		return "com.hyjx.business.liulmnew";
	}


}