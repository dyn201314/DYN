package com.oracle.intelagr.entity;

import java.util.Date;



public class Contract
{
	private Integer id;
	//承包方代码
	private String contractorCode;
	//图幅编码
	private String graphCode;
	//地块编码
	private String landCode;
	//地块名称
	private String landName;
	//合同面积(亩)
	private float contractArea;
	//测量面积(亩)
	private float measurementMu;
	//东至
	private String eastTo;
	//西至
	private String westTo;
	//南至
	private String southTo;
	//北至
	private String northTo;
	//等级
	private String landLevel;
	//土地类型 
	private String landType;
	//是否基本农田
	private String isBaseLand;
	//所有制性质
	private String ownership;
	//土地类别
	private String landClass;
	//争议原因
	private String disputeReason;
	//承包土地用途
	private String landPurpose;
	//承包开始日期
	private Date contractStartDate;
	//承包期限
	private Integer contractYear;
	//承包终止日期
	private Date contractEndDate;
		
	//土地类型
	private String landTypeName;
	//土地类别
	private String landClassName;
	//总面积
	private Float zmj;
	//实亩
	private Float actualMu;
	
	/** default constructor */
	public Contract() {
	}
	public Integer getId()
	{
		return this.id;
	}
	  
	public void setId(Integer id) {
		this.id = id;
	}

	public String getContractorCode() {
		return contractorCode;
	}

	public void setContractorCode(String contractorCode) {
		this.contractorCode = contractorCode;
	}

	public String getGraphCode() {
		return graphCode;
	}

	public void setGraphCode(String graphCode) {
		this.graphCode = graphCode;
	}

	public String getLandCode() {
		return landCode;
	}

	public void setLandCode(String landCode) {
		this.landCode = landCode;
	}

	public String getLandName() {
		return landName;
	}

	public void setLandName(String landName) {
		this.landName = landName;
	}

	public float getContractArea() {
		return contractArea;
	}

	public void setContractArea(float contractArea) {
		this.contractArea = contractArea;
	}

	public float getMeasurementMu() {
		return measurementMu;
	}

	public void setMeasurementMu(float measurementMu) {
		this.measurementMu = measurementMu;
	}

	public String getEastTo() {
		return eastTo;
	}

	public void setEastTo(String eastTo) {
		this.eastTo = eastTo;
	}

	public String getWestTo() {
		return westTo;
	}

	public void setWestTo(String westTo) {
		this.westTo = westTo;
	}

	public String getSouthTo() {
		return southTo;
	}

	public void setSouthTo(String southTo) {
		this.southTo = southTo;
	}

	public String getNorthTo() {
		return northTo;
	}

	public void setNorthTo(String northTo) {
		this.northTo = northTo;
	}

	public String getLandLevel() {
		return landLevel;
	}

	public void setLandLevel(String landLevel) {
		this.landLevel = landLevel;
	}

	public String getLandType() {
		return landType;
	}

	public void setLandType(String landType) {
		this.landType = landType;
	}

	public String getIsBaseLand() {
		return isBaseLand;
	}

	public void setIsBaseLand(String isBaseLand) {
		this.isBaseLand = isBaseLand;
	}

	public String getOwnership() {
		return ownership;
	}

	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}

	public String getLandClass() {
		return landClass;
	}

	public void setLandClass(String landClass) {
		this.landClass = landClass;
	}

	public String getDisputeReason() {
		return disputeReason;
	}

	public void setDisputeReason(String disputeReason) {
		this.disputeReason = disputeReason;
	}

	public String getLandPurpose() {
		return landPurpose;
	}

	public void setLandPurpose(String landPurpose) {
		this.landPurpose = landPurpose;
	}

	public Date getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public Integer getContractYear() {
		return contractYear;
	}

	public void setContractYear(Integer contractYear) {
		this.contractYear = contractYear;
	}

	public Date getContractEndDate() {
		return contractEndDate;
	}

	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
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

	public Float getZmj() {
		return zmj;
	}

	public void setZmj(Float zmj) {
		this.zmj = zmj;
	}

	public Float getActualMu() {
		return actualMu;
	}

	public void setActualMu(Float actualMu) {
		this.actualMu = actualMu;
	}
	
}
