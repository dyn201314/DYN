package com.oracle.intelagr.entity;

import java.util.Date;

public class BlackList extends BaseEntity {
	private Integer id;
	//企业ID
	private String companyCode;
	//企业名称
	//private String companyName;
	//企业类型
	//private String companyType;
	//拉黑次数
	private Integer blackListCount;
	//拉黑截止日期
	private Date blackListEndDate;
	//最后一次拉黑原因
	private String blackListReason;
	//最近处理人
	private String processor;
	//最近处理日期
	private Date settleDate;
	//最近黑名单时长
	private String blackListTimeLimit;
	

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
	public Integer getBlackListCount() {
		return blackListCount;
	}
	public void setBlackListCount(Integer blackListCount) {
		this.blackListCount = blackListCount;
	}
	public Date getBlackListEndDate() {
		return blackListEndDate;
	}
	public void setBlackListEndDate(Date blackListEndDate) {
		this.blackListEndDate = blackListEndDate;
	}
	public String getBlackListReason() {
		return blackListReason;
	}
	public void setBlackListReason(String blackListReason) {
		this.blackListReason = blackListReason;
	}
	public String getProcessor() {
		return processor;
	}
	public void setProcessor(String processor) {
		this.processor = processor;
	}
	public Date getSettleDate() {
		return settleDate;
	}
	public void setSettleDate(Date settleDate) {
		this.settleDate = settleDate;
	}
	public String getBlackListTimeLimit() {
		return blackListTimeLimit;
	}
	public void setBlackListTimeLimit(String blackListTimeLimit) {
		this.blackListTimeLimit = blackListTimeLimit;
	}
}
