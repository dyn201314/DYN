package com.oracle.intelagr.entity;

import java.util.Date;
public class YYSyncLog {
	private Integer id;
	//业务类型
	private String bizType;
	//同步时间
	private Date syncDate;
	//同步状态
	private Integer syncStatus;
	//同步数量
	private Integer syncCount;
	//数据流向
	private Integer dataPath;
	//处理时间
	private Date createDate;
	
	/** default constructor */
	public YYSyncLog() {
	}
  
	public Integer getId()
	{
		return this.id;
	}
	  
	public void setId(Integer id) {
		this.id = id;
	}

	public String getBizType() {
		return bizType;
	}

	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	
	public Date getSyncDate() {
		return syncDate;
	}

	public void setSyncDate(Date syncDate) {
		this.syncDate = syncDate;
	}

	public Integer getSyncStatus() {
		return syncStatus;
	}

	public void setSyncStatus(Integer syncStatus) {
		this.syncStatus = syncStatus;
	}

	public Integer getSyncCount() {
		return syncCount;
	}

	public void setSyncCount(Integer syncCount) {
		this.syncCount = syncCount;
	}

	public Integer getDataPath() {
		return dataPath;
	}

	public void setDataPath(Integer dataPath) {
		this.dataPath = dataPath;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	
}
