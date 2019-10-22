package com.oracle.intelagr.entity;

import java.util.Date;

public class Company extends BaseEntity{
	// 自增长主键
	private Integer id;
	// 企业编码
	private String companyCode;
	// 企业名称
	private String companyName;
	// 企业法人
	private String legalPerson;
	// 企业法人身份证
	private String legalPersonID;
	//企业地址
	private String address;
	//注册日期
	private Date registerDate;
	//联系人
	private String connectName;
	//联系电话
	private String connectPhone;
	//企业类型 01-育种，02-非育种
	private String companyType;

	/** default constructor */
	public Company(){
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConnectPhone() {
		return connectPhone;
	}

	public void setConnectPhone(String connectPhone) {
		this.connectPhone = connectPhone;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getLegalPersonID() {
		return legalPersonID;
	}

	public void setLegalPersonID(String legalPersonID) {
		this.legalPersonID = legalPersonID;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getConnectName() {
		return connectName;
	}

	public void setConnectName(String connectName) {
		this.connectName = connectName;
	}
}
