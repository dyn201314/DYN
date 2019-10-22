package com.oracle.intelagr.entity;

import java.util.Date;


public class GraiReg extends BaseEntity {
	private Integer id;
	private String year;
	//企业ID
	private String companyCode;
	//企业名称
	private String companyName; 
	//农户姓名
	private String farmerName;
	//身份证号
	private String idNumber;
	//申请批次号
	private String cityCode;
	//所在乡镇
	private String townCode;
	//所在村
	private String countryCode;
	//所在屯
	private String groupName;
	//本次卖出重量
	private Float thisWeight;
	
	//经办人
	private String operatorName;
	//经办日期
	private Date operatorDate;
	//业务流水
	private String bizCodePlowland;
	private String bizCodeSeed;
	private String bizCodeYield;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public Date getOperatorDate() {
		return operatorDate;
	}
	public void setOperatorDate(Date operatorDate) {
		this.operatorDate = operatorDate;
	}
	public String getFarmerName() {
		return farmerName;
	}
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
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
	public Float getThisWeight() {
		return thisWeight;
	}
	public void setThisWeight(Float thisWeight) {
		this.thisWeight = thisWeight;
	}
	public String getBizCodePlowland() {
		return bizCodePlowland;
	}
	public void setBizCodePlowland(String bizCodePlowland) {
		this.bizCodePlowland = bizCodePlowland;
	}
	public String getBizCodeSeed() {
		return bizCodeSeed;
	}
	public void setBizCodeSeed(String bizCodeSeed) {
		this.bizCodeSeed = bizCodeSeed;
	}
	public String getBizCodeYield() {
		return bizCodeYield;
	}
	public void setBizCodeYield(String bizCodeYield) {
		this.bizCodeYield = bizCodeYield;
	}
	
	
}
