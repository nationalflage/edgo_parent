package com.hyjx.business.bounddata;
import com.hyjx.framework.orm.IBaseModel;

/**
	实体类
*/
public class BoundDataModel implements IBaseModel{
	private String id;//主键
	private String mainid;//城市id
	private String pid;//区域父id
	private String name;//名称
	private String boundary;//百度边界数据
	private String datetime;//时间戳
	private String type;//区分边界级别
	private String innerBoundary;//经信委边界数据
	private String centerLng;//中心
	private String centerLat;//中心
	private String airgeion;//行政区编码
	private String airmc;//行政区名称
	private String town;//街乡镇编码
	private String townmc;//街乡镇名称
	private String lng;//
	private String lat;//
	private String business;//
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	public void setMainid(String mainid){
		this.mainid = mainid;
	}
	public String getMainid(){
		return this.mainid;
	}
	public void setPid(String pid){
		this.pid = pid;
	}
	public String getPid(){
		return this.pid;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setBoundary(String boundary){
		this.boundary = boundary;
	}
	public String getBoundary(){
		return this.boundary;
	}
	public void setDatetime(String datetime){
		this.datetime = datetime;
	}
	public String getDatetime(){
		return this.datetime;
	}
	public void setType(String type){
		this.type = type;
	}
	public String getType(){
		return this.type;
	}
	public void setInnerBoundary(String innerBoundary){
		this.innerBoundary = innerBoundary;
	}
	public String getInnerBoundary(){
		return this.innerBoundary;
	}
	public void setCenterLng(String centerLng){
		this.centerLng = centerLng;
	}
	public String getCenterLng(){
		return this.centerLng;
	}
	public void setCenterLat(String centerLat){
		this.centerLat = centerLat;
	}
	public String getCenterLat(){
		return this.centerLat;
	}
	public void setAirgeion(String airgeion){
		this.airgeion = airgeion;
	}
	public String getAirgeion(){
		return this.airgeion;
	}
	public void setAirmc(String airmc){
		this.airmc = airmc;
	}
	public String getAirmc(){
		return this.airmc;
	}
	public void setTown(String town){
		this.town = town;
	}
	public String getTown(){
		return this.town;
	}
	public void setTownmc(String townmc){
		this.townmc = townmc;
	}
	public String getTownmc(){
		return this.townmc;
	}
	public void setLng(String lng){
		this.lng = lng;
	}
	public String getLng(){
		return this.lng;
	}
	public void setLat(String lat){
		this.lat = lat;
	}
	public String getLat(){
		return this.lat;
	}
	public void setBusiness(String business){
		this.business = business;
	}
	public String getBusiness(){
		return this.business;
	}
	
	@Override
	public String getModuleName() {
		return "com.hyjx.business.bounddata";
	}
}