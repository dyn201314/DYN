package com.oracle.intelagr.entity;



public class GeneLandDetail extends BaseEntity {
	private Integer id;
	//普通-备案-子表主键
	private Integer hid;
	//土地类型
	private String landType;
	//实(亩)
	private Float actualMu;
	//测量(亩)
	private Float measurementMu;
	//土地类别
	private String landClass;
	//所在市编码 默认为五常市
	private String cityCode;
	//所在乡镇编码
	private String townCode;
	//所在村编码
	private String countryCode;
	//所在屯名称
	private String groupName;
	//土地名称
	private String landName;
	
	//土地类型
	private String landTypeName;
	//土地类别
	private String landClassName;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	public String getLandType() {
		return landType;
	}
	public void setLandType(String landType) {
		this.landType = landType;
	}
	public Float getActualMu() {
		return actualMu;
	}
	public void setActualMu(Float actualMu) {
		this.actualMu = actualMu;
	}
	public Float getMeasurementMu() {
		return measurementMu;
	}
	public void setMeasurementMu(Float measurementmMu) {
		this.measurementMu = measurementmMu;
	}
	public String getLandClass() {
		return landClass;
	}
	public void setLandClass(String landClass) {
		this.landClass = landClass;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getTownCode() {
		return townCode;
	}
	public void setTownCode(String townCode) {
		this.townCode = townCode;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getLandName() {
		return landName;
	}
	public void setLandName(String landName) {
		this.landName = landName;
	}
	public String getLandTypeName() {
		return landTypeName;
	}
	public void setLandTypeName(String landTypeName) {
		this.landTypeName = landTypeName;
	}
	public String getLandClassName() {
		return landClassName;
	}
	public void setLandClassName(String landClassName) {
		this.landClassName = landClassName;
	}
	
}
