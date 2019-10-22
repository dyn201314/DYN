package com.oracle.intelagr.entity;


import java.util.Date;


public class LandLog extends BaseEntity {

	// 自增长主键
	private Integer id;
	// 日志类型 GENE=普通	SPEC=特殊
	private String landLogType;
	// 批次号普通PT开头,特殊TX开头
	private String batchNo;
	// 操作说明
	private String actionInfo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLandLogType() {
		return landLogType;
	}

	public void setLandLogType(String landLogType) {
		this.landLogType = landLogType;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public String getActionInfo() {
		return actionInfo;
	}

	public void setActionInfo(String actionInfo) {
		this.actionInfo = actionInfo;
	}

}
