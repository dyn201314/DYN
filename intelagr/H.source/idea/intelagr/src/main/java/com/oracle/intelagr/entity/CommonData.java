package com.oracle.intelagr.entity;


public class CommonData {
	// 主键
	private Integer id;
	// 代码主档标识名称
	
	private String codeName;
	// 代码主档标识
	
	private String codeKey;
	// 代码
	private String codeCode;
	// 显示顺序
	
	private Integer codeSort;
	// 代码含义
	
	private String codeValue;
	// 备注
	
	private String remark;

	/** default constructor */
	public CommonData() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getCodeCode() {
		return codeCode;
	}

	public void setCodeCode(String codeCode) {
		this.codeCode = codeCode;
	}

	public Integer getCodeSort() {
		return codeSort;
	}

	public void setCodeSort(Integer codeSort) {
		this.codeSort = codeSort;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

}
