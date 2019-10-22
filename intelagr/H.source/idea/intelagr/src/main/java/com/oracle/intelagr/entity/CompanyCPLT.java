package com.oracle.intelagr.entity;

import java.util.Date;


public class CompanyCPLT extends BaseEntity {
	private Integer id;
	//投诉日期
	private Date complaintDate;
	//投诉人
	private String complainant;
	//性别
	private String complainantSex;
	//投诉人电话
	private String complainantTel;
	//邮箱
	private String complainantMail;
	//内容
	private String complaintContent;
	//处理日期
	private Date settleDate;
	//处理状态
	private String settleStatus; 
	//处理人
	private String processor;
	private String settlePepole;
	//处理人电话
	private String processorsTel;
	//处理邮箱
	private String processorsMail;
	//处理企业编号
	private String companyCode;
	//处理企业名称
	private String companyName;
	//处理生产批次
	private String productionBatch;
	//处理产品编号
	private String productCode;
	//处理方式
	private String processMode;
	//处理人
	private String processorName;
	//处理结果概述
	private String processResult;
	//驳回原因
	private String rejectReason;
	
	//--------黑名单表
	//最近黑名单时长
	private String blackListTimeLimit;
	//黑名单截止日期
	private Date blackListEndDate;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getComplaintDate() {
		return complaintDate;
	}
	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}
	public String getComplainant() {
		return complainant;
	}
	public void setComplainant(String complainant) {
		this.complainant = complainant;
	}
	public String getComplainantTel() {
		return complainantTel;
	}
	public void setComplainantTel(String complainantTel) {
		this.complainantTel = complainantTel;
	}
	public String getComplainantMail() {
		return complainantMail;
	}
	public void setComplainantMail(String complainantMail) {
		this.complainantMail = complainantMail;
	}
	public String getComplaintContent() {
		return complaintContent;
	}
	public void setComplaintContent(String complaintContent) {
		this.complaintContent = complaintContent;
	}
	public Date getSettleDate() {
		return settleDate;
	}
	public void setSettleDate(Date settleDate) {
		this.settleDate = settleDate;
	}
	public String getSettlePepole() {
		return settlePepole;
	}
	public void setSettlePepole(String settlePepole) {
		this.settlePepole = settlePepole;
	}
	public String getProcessorsTel() {
		return processorsTel;
	}
	public void setProcessorsTel(String processorsTel) {
		this.processorsTel = processorsTel;
	}
	public String getProcessorsMail() {
		return processorsMail;
	}
	public void setProcessorsMail(String processorsMail) {
		this.processorsMail = processorsMail;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getProductionBatch() {
		return productionBatch;
	}
	public void setProductionBatch(String productionBatch) {
		this.productionBatch = productionBatch;
	}
	public String getProcessorName() {
		return processorName;
	}
	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}
	public String getProcessResult() {
		return processResult;
	}
	public void setProcessResult(String processResult) {
		this.processResult = processResult;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public String getComplainantSex() {
		return complainantSex;
	}
	public void setComplainantSex(String complainantSex) {
		this.complainantSex = complainantSex;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProcessMode() {
		return processMode;
	}
	public void setProcessMode(String processMode) {
		this.processMode = processMode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getSettleStatus() {
		return settleStatus;
	}
	public void setSettleStatus(String settleStatus) {
		this.settleStatus = settleStatus;
	}
	public String getProcessor() {
		return processor;
	}
	public void setProcessor(String processor) {
		this.processor = processor;
	}	
	public String getBlackListTimeLimit() {
		return blackListTimeLimit;
	}
	public void setBlackListTimeLimit(String blackListTimeLimit) {
		this.blackListTimeLimit = blackListTimeLimit;
	}
	public Date getBlackListEndDate() {
		return blackListEndDate;
	}
	public void setBlackListEndDate(Date blackListEndDate) {
		this.blackListEndDate = blackListEndDate;
	}
}
