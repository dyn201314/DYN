package com.oracle.intelagr.entity;


public class GraiRegDetail extends BaseEntity {
	private Integer id;
	private Integer hid;
	//农户姓名
	private String farmerName;
	//身份证号
	private String idNumber;
	//土地类型
	private String landType;
	//实(亩)
	private Float actualMu;
	//测量(亩)
	private Float measurementMu;
	//土地类别
	private String landClass;
	//位置
	private String location;
	//预估总产量
	private Float estimateTotalYield;
	//购种重量合计
	private Float seedPurchaseTotal;
	//已卖出
	private Float soldYield;
	//sheng余产量剩余产量
	private Float surplusYield;
	//已备案面积合计
	private Float registeredTotalYield;
	//可收粮面积合计GrainTotalYield
	private Float grainTotalYield;

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
	public String getLandClass() {
		return landClass;
	}
	public void setLandClass(String landClass) {
		this.landClass = landClass;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Float getMeasurementMu() {
		return measurementMu;
	}
	public void setMeasurementMu(Float measurementMu) {
		this.measurementMu = measurementMu;
	}
	public Float getEstimateTotalYield() {
		return estimateTotalYield;
	}
	public void setEstimateTotalYield(Float estimateTotalYield) {
		this.estimateTotalYield = estimateTotalYield;
	}
	public Float getSeedPurchaseTotal() {
		return seedPurchaseTotal;
	}
	public void setSeedPurchaseTotal(Float seedPurchaseTotal) {
		this.seedPurchaseTotal = seedPurchaseTotal;
	}
	public Float getSoldYield() {
		return soldYield;
	}
	public void setSoldYield(Float soldYield) {
		this.soldYield = soldYield;
	}
	public String getFarmerName() {
		return farmerName;
	}
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public Float getSurplusYield() {
		return surplusYield;
	}
	public void setSurplusYield(Float surplusYield) {
		this.surplusYield = surplusYield;
	}
	public Float getRegisteredTotalYield() {
		return registeredTotalYield;
	}
	public void setRegisteredTotalYield(Float registeredTotalYield) {
		this.registeredTotalYield = registeredTotalYield;
	}
	public Float getGrainTotalYield() {
		return grainTotalYield;
	}
	public void setGrainTotalYield(Float grainTotalYield) {
		this.grainTotalYield = grainTotalYield;
	}
}
