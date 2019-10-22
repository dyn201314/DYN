package com.oracle.intelagr.entity;

import java.util.Date;


public class LandRegChange extends BaseEntity {
	//土地备案变更申请明细表主键
	private Integer id;
	//年度
	private String year;
	//企业编号
	private String companyCode;
	//企业名称
	private String companyName;
	//申请批次号
	private String applyBatchNo;
	//证件类型
	private String idType;
	//证件号码
	private String contractorID;
	//承包方
	private String contractorName;
	//承包方电话
	private String contractorTel;
	//所在市编码
	private String cityCode;
	//所在乡镇编码
	private String townCode;
	//所在村编码
	private String countryCode;
	//住址
	private String address;
	//申请备案特殊类别
	private String geneRegistType;
	//申请备案普通类别
	private String specRegistType;
	//申请人
	private String applicant;
	//申请时间
	private Date applicantDate;
	//申请人电话
	private String applicantTel;
	//变更原因
	private String changeReason;
	//土地变更状态
	private String changeRegistStatus;
	//处理人
	private String auditor;
	//处理时间
	private Date auditDate;
	//处理状态
	private String status;
	//驳回原因
	private String rejectReason;
	
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
	public String getApplyBatchNo() {
		return applyBatchNo;
	}
	public void setApplyBatchNo(String applyBatchNo) {
		this.applyBatchNo = applyBatchNo;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getContractorID() {
		return contractorID;
	}
	public void setContractorID(String contractorID) {
		this.contractorID = contractorID;
	}
	public String getContractorName() {
		return contractorName;
	}
	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}
	public String getContractorTel() {
		return contractorTel;
	}
	public void setContractorTel(String contractorTel) {
		this.contractorTel = contractorTel;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGeneRegistType() {
		return geneRegistType;
	}
	public void setGeneRegistType(String geneRegistType) {
		this.geneRegistType = geneRegistType;
	}
	public String getSpecRegistType() {
		return specRegistType;
	}
	public void setSpecRegistType(String specRegistType) {
		this.specRegistType = specRegistType;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public Date getApplicantDate() {
		return applicantDate;
	}
	public void setApplicantDate(Date applicantDate) {
		this.applicantDate = applicantDate;
	}
	public String getApplicantTel() {
		return applicantTel;
	}
	public void setApplicantTel(String applicantTel) {
		this.applicantTel = applicantTel;
	}
	public String getChangeReason() {
		return changeReason;
	}
	public void setChangeReason(String changeReason) {
		this.changeReason = changeReason;
	}
	public String getChangeRegistStatus() {
		return changeRegistStatus;
	}
	public void setChangeRegistStatus(String changeRegistStatus) {
		this.changeRegistStatus = changeRegistStatus;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public Date getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	



}
