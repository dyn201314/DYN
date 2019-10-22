package com.oracle.intelagr.entity;

public class SeedVariety extends BaseEntity {
	// 自增长主键
	private Integer id;
	// 企业名称
	private String seedCode;
	// 企业法人
	private String seedName;

	public String getSeedCode() {
		return seedCode;
	}

	public void setSeedCode(String seedCode) {
		this.seedCode = seedCode;
	}

	public String getSeedName() {
		return seedName;
	}

	public void setSeedName(String seedName) {
		this.seedName = seedName;
	}

}
