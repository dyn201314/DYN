package com.oracle.intelagr.entity;

import java.util.Date;


public class GraiFore extends BaseEntity{
	private Integer id;
	private String year;
	//企业ID
	private String companyCode;
	//企业名称
	private String companyName;
	//预报日期
	private Date forecastDate;
	//农户姓名
	private String farmerName;
	//身份证号
	private String idNumber;
	//实亩合计
	private Float ActualMu;
	//测量亩合计
	private Float measurementMu;
	//预估总产量--最小
	private Float minEstimateTotalYield;
	//预估总产量--最大
	private Float maxEstimateTotalYield;
	
	//是否争议地块
	private String zyLand;
	private String companyConnectName;
	private String companyConnectPhone;

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
	public Date getForecastDate() {
		return forecastDate;
	}
	public void setForecastDate(Date forecastDate) {
		this.forecastDate = forecastDate;
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
	public Float getActualMu() {
		return ActualMu;
	}
	public void setActualMu(Float actualMu) {
		ActualMu = actualMu;
	}
	public Float getMeasurementMu() {
		return measurementMu;
	}
	public void setMeasurementMu(Float measurementMu) {
		this.measurementMu = measurementMu;
	}
	public Float getMinEstimateTotalYield() {
		return minEstimateTotalYield;
	}
	public void setMinEstimateTotalYield(Float minEstimateTotalYield) {
		this.minEstimateTotalYield = minEstimateTotalYield;
	}
	public Float getMaxEstimateTotalYield() {
		return maxEstimateTotalYield;
	}
	public void setMaxEstimateTotalYield(Float maxEstimateTotalYield) {
		this.maxEstimateTotalYield = maxEstimateTotalYield;
	}

	public String getZyLand() {
		return zyLand;
	}
	public void setZyLand(String zyLand) {
		this.zyLand = zyLand;
	}

	public String getCompanyConnectName() {
		return companyConnectName;
	}
	public void setCompanyConnectName(String companyConnectName) {
		this.companyConnectName = companyConnectName;
	}

	public String getCompanyConnectPhone() {
		return companyConnectPhone;
	}
	public void setCompanyConnectPhone(String companyConnectPhone) {
		this.companyConnectPhone = companyConnectPhone;
	}
}
