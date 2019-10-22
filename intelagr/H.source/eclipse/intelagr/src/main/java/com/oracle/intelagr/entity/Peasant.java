package com.oracle.intelagr.entity;

import java.util.Date;

public class Peasant
{
	private Integer id;
	//承包方代码
	private String contractorCode;
	//承包方姓名
	private String contractorName;
	//承包方证件号码
	private String contractorID;
	//承包方证件类型
	private String contractorIDType;
	//年龄
	private Integer contractorAge;
	//性别
	private String contractorSex;
	//生日
	private String contractorBirth;
	//联系电话
	private String contractorTel;
	//所在市编码
	private String cityCode;
	//所在乡编码
	private String townCode;
	//所在村编码
	private String countryCode;
	//所在村编码
	private String groupName;
	//邮政编码
	private String contractorZipcode;
	//户口性质
	private String contractorhouseholdType;
	//承包方类型
	private String contractorType;
	//承包合同编号
	private String contractId;
	//民族
	private String contractorNation;
	//经营权证编号
	private String rightId;
	//经营权证编号
	private String attestor;
	//鉴证机关
	private String attestMechanism;
	//鉴证日期
	private String attestDate;
	//鉴证编号
	private String attestNo;
	//承包土地用途
	private String landPurpose;
	//经营权取得方式
	private String rightGetWay;
	//承包开始日期
	private Date contractStartDate;
	//承包期限
	private Integer contractYear;
	//承包结束日期
	private Date contractEndDate;
	//98年分地成员总数
	private Integer getLandPersonCount;
	//家庭人口数
	private Integer familyPersonCount;
	//调查日期
	private Date surveyDate;
	//调查记事
	private String surveyMemo;
		
	/** default constructor */
	public Peasant() {
	}
  
	public Integer getId()
	{
		return this.id;
	}
	  
	public void setId(Integer id) {
		this.id = id;
	}

	public String getContractorCode() {
		return contractorCode;
	}

	public void setContractorCode(String contractorCode) {
		this.contractorCode = contractorCode;
	}

	public String getContractorName() {
		return contractorName;
	}

	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}

	public String getContractorID() {
		return contractorID;
	}

	public void setContractorID(String contractorID) {
		this.contractorID = contractorID;
	}

	public String getContractorIDType() {
		return contractorIDType;
	}

	public void setContractorIDType(String contractorIDType) {
		this.contractorIDType = contractorIDType;
	}

	public Integer getContractorAge() {
		return contractorAge;
	}

	public void setContractorAge(Integer contractorAge) {
		this.contractorAge = contractorAge;
	}

	public String getContractorSex() {
		return contractorSex;
	}

	public void setContractorSex(String contractorSex) {
		this.contractorSex = contractorSex;
	}

	public String getContractorBirth() {
		return contractorBirth;
	}

	public void setContractorBirth(String contractorBirth) {
		this.contractorBirth = contractorBirth;
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getContractorZipcode() {
		return contractorZipcode;
	}

	public void setContractorZipcode(String contractorZipcode) {
		this.contractorZipcode = contractorZipcode;
	}

	public String getContractorhouseholdType() {
		return contractorhouseholdType;
	}

	public void setContractorhouseholdType(String contractorhouseholdType) {
		this.contractorhouseholdType = contractorhouseholdType;
	}

	public String getContractorType() {
		return contractorType;
	}

	public void setContractorType(String contractorType) {
		this.contractorType = contractorType;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public String getContractorNation() {
		return contractorNation;
	}

	public void setContractorNation(String contractorNation) {
		this.contractorNation = contractorNation;
	}

	public String getRightId() {
		return rightId;
	}

	public void setRightId(String rightId) {
		this.rightId = rightId;
	}

	public String getAttestor() {
		return attestor;
	}

	public void setAttestor(String attestor) {
		this.attestor = attestor;
	}

	public String getAttestMechanism() {
		return attestMechanism;
	}

	public void setAttestMechanism(String attestMechanism) {
		this.attestMechanism = attestMechanism;
	}

	public String getAttestDate() {
		return attestDate;
	}

	public void setAttestDate(String attestDate) {
		this.attestDate = attestDate;
	}

	public String getAttestNo() {
		return attestNo;
	}

	public void setAttestNo(String attestNo) {
		this.attestNo = attestNo;
	}

	public String getLandPurpose() {
		return landPurpose;
	}

	public void setLandPurpose(String landPurpose) {
		this.landPurpose = landPurpose;
	}

	public String getRightGetWay() {
		return rightGetWay;
	}

	public void setRightGetWay(String rightGetWay) {
		this.rightGetWay = rightGetWay;
	}

	public Date getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public Integer getContractYear() {
		return contractYear;
	}

	public void setContractYear(Integer contractYear) {
		this.contractYear = contractYear;
	}

	public Date getContractEndDate() {
		return contractEndDate;
	}

	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
	}

	public Integer getGetLandPersonCount() {
		return getLandPersonCount;
	}

	public void setGetLandPersonCount(Integer getLandPersonCount) {
		this.getLandPersonCount = getLandPersonCount;
	}

	public Integer getFamilyPersonCount() {
		return familyPersonCount;
	}

	public void setFamilyPersonCount(Integer familyPersonCount) {
		this.familyPersonCount = familyPersonCount;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	public String getSurveyMemo() {
		return surveyMemo;
	}

	public void setSurveyMemo(String surveyMemo) {
		this.surveyMemo = surveyMemo;
	}
}
