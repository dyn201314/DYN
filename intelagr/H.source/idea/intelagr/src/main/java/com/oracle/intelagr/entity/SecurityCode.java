package com.oracle.intelagr.entity;

public class SecurityCode extends BaseEntity
{
	private Integer id;
	//企业编码
	private String companyCode;
	//年度
	private String year;
	//申请总数量
	private Integer applyTotalNum;
	//激活数量
	private Integer activationTotalNum;
	
	
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getApplyTotalNum() {
		return applyTotalNum;
	}

	public void setApplyTotalNum(Integer applyTotalNum) {
		this.applyTotalNum = applyTotalNum;
	}

	public Integer getActivationTotalNum() {
		return activationTotalNum;
	}

	public void setActivationTotalNum(Integer activationTotalNum) {
		this.activationTotalNum = activationTotalNum;
	}
}
