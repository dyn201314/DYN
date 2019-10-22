package com.oracle.intelagr.entity;




public class AreaDevision extends BaseEntity{
	private Integer id;
	//市编码
	private String cityCode;
	//市名称
	private String cityName;
	//乡镇编码
	private String townCode;
	//乡镇名称
	private String townName;
	//村屯编码
	private String countryCode;
	//村屯名称
	private String countryName;
		
	/** default constructor */
	public AreaDevision() {
	}
  
	
	public Integer getId()
	{
		return this.id;
	}
	  
	public void setId(Integer id) {
		this.id = id;
	}


	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}


	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}


	public String getTownCode() {
		return townCode;
	}

	public void setTownCode(String townCode) {
		this.townCode = townCode;
	}


	public String getTownName() {
		return townName;
	}

	public void setTownName(String townName) {
		this.townName = townName;
	}


	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}


	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
}
