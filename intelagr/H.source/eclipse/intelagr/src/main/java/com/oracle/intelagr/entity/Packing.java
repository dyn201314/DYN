package com.oracle.intelagr.entity;


public class Packing
{
	private Integer id;
	//企业编号
	private String companyCode;
	//类型编号
	private String typeCode;
	//类型名称
	private String typeName;
	//品类编号
	private String classCode;
	//品类名称
	private float className;
	//规格编号
	private float specCode;
	//规格名称
	private String specName;
	//规格重量
	private float specWeight;
		
	/** default constructor */
	public Packing() {
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

	
	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	
	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	
	public float getClassName() {
		return className;
	}

	public void setClassName(float className) {
		this.className = className;
	}

	
	public float getSpecCode() {
		return specCode;
	}

	public void setSpecCode(float specCode) {
		this.specCode = specCode;
	}
	
	
	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

	
	public float getSpecWeight() {
		return specWeight;
	}

	public void setSpecWeight(float specWeight) {
		this.specWeight = specWeight;
	}
}
