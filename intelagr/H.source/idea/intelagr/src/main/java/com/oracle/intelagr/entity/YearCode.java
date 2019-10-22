package com.oracle.intelagr.entity;


/**
 * 数据字典Entity
 * 
 * @author 创新中软
 * @date 2015-08-18
 */
public class YearCode extends BaseEntity{
	// 自增长主键
	private Integer id;
	// 企业名称
	private String yearCode;
	// 企业名称
	private String yearName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYearCode() {
		return yearCode;
	}
	public void setYearCode(String yearCode) {
		this.yearCode = yearCode;
	}
	public String getYearName() {
		return yearName;
	}
	public void setYearName(String yearName) {
		this.yearName = yearName;
	}
}
