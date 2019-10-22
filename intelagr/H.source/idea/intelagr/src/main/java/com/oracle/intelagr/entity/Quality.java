package com.oracle.intelagr.entity;

import java.util.Date;


public class Quality extends BaseEntity
{
	private Integer id;
	//年度
	private String year;
	//企业编码
	private String companyCode;
	//质检编号
	private String checkCode;
	//送检日期
	private Date deliveryDate;
	//质检日期
	private Date inspectDate;
	//企业送检人
	private String deliveryPerson;
	//质检中心交接人
	private String handoverPerson;
	//质检中心交接时间
	private Date handoverTime;
	//质检员
	private String inspectPerson;
	//质检结论
	private String inspectStatus;
	//质检报告
	private String path;
	
	/** default constructor */
	public Quality() {
	}
  
	public Integer getId()
	{
		return this.id;
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

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public Date getInspectDate() {
		return inspectDate;
	}

	public void setInspectDate(Date inspectDate) {
		this.inspectDate = inspectDate;
	}

	public String getDeliveryPerson() {
		return deliveryPerson;
	}

	public void setDeliveryPerson(String deliveryPerson) {
		this.deliveryPerson = deliveryPerson;
	}

	public String getHandoverPerson() {
		return handoverPerson;
	}

	public void setHandoverPerson(String handoverPerson) {
		this.handoverPerson = handoverPerson;
	}

	public Date getHandoverTime() {
		return handoverTime;
	}

	public void setHandoverTime(Date handoverTime) {
		this.handoverTime = handoverTime;
	}

	public String getInspectPerson() {
		return inspectPerson;
	}

	public void setInspectPerson(String inspectPerson) {
		this.inspectPerson = inspectPerson;
	}

	public String getInspectStatus() {
		return inspectStatus;
	}

	public void setInspectStatus(String inspectStatus) {
		this.inspectStatus = inspectStatus;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
