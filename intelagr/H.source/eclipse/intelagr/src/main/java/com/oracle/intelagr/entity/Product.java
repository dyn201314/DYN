package com.oracle.intelagr.entity;


public class Product extends BaseEntity {
	private Integer id;
	//企业编号
	private String companyCode;
	//产品编码
	private String productCode;
	//产品名称
	private String productName;
	//包装单位
	private String unit;
	//产品净重
	private float weight;
		
	/** default constructor */
	public Product() {
	}
  
	public Integer getId()
	{
		return this.id;
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

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public float getWeight() {
		return this.weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}
}
