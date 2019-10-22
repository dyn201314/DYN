package com.oracle.intelagr.entity;


import java.util.Date;

public class YieldPredict extends BaseEntity
{
	private Integer id;
	//企业编码
	private String companyCode;
	//企业名称
	private String companyName;
	//年度
	private String year;
	//预报日期
	private Date predictionDate;
	//本次预报产量
	private float yieldPredictionValue;
		
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Date getPredictionDate() {
		return predictionDate;
	}

	public void setPredictionDate(Date predictionDate) {
		this.predictionDate = predictionDate;
	}

	public float getYieldPredictionValue() {
		return yieldPredictionValue;
	}

	public void setYieldPredictionValue(float yieldPredictionValue) {
		this.yieldPredictionValue = yieldPredictionValue;
	}
}
