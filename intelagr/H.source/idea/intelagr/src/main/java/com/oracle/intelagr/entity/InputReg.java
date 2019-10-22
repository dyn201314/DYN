package com.oracle.intelagr.entity;

import java.util.Date;


public class InputReg extends BaseEntity  {
	private Integer id;
	//年度
	private String year;
	//企业ID
	private String companyCode;
	//企业名称
	private String companyName;
	//申请批次号
	private String applyBatchNo;
	//投入品名称
	private String inputGoodsName;
	//投入品经销商
	private String inputGoodsSupplier;
	//采购量
	private Float purchaseQuantity;
	//投入品单位
	private String inputGoodsUnit;
	//采购人
	private String purchasePerson;
	//采购日期
	private Date purchaseDate;
	//备注
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
	public Float getPurchaseQuantity() {
		return purchaseQuantity;
	}
	public void setPurchaseQuantity(Float purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getInputGoodsName() {
		return inputGoodsName;
	}
	public void setInputGoodsName(String inputGoodsName) {
		this.inputGoodsName = inputGoodsName;
	}
	public String getInputGoodsSupplier() {
		return inputGoodsSupplier;
	}
	public void setInputGoodsSupplier(String inputGoodsSupplier) {
		this.inputGoodsSupplier = inputGoodsSupplier;
	}
	public String getInputGoodsUnit() {
		return inputGoodsUnit;
	}
	public void setInputGoodsUnit(String inputGoodsUnit) {
		this.inputGoodsUnit = inputGoodsUnit;
	}
	public String getPurchasePerson() {
		return purchasePerson;
	}
	public void setPurchasePerson(String purchasePerson) {
		this.purchasePerson = purchasePerson;
	}
}
