package com.oracle.intelagr.entity;

import java.util.Date;


public class LandRegChangeDetail extends BaseEntity {
	//土地备案变更申请明细表主键
	private Integer id;
	//土地备案变更表主键
	private Integer hid;
	//土地备案主表主键
	private Float LandRegHID;
	//土地备案子表主键
	private String LandRegSID;
	//土地面积
	private String ArchiveAcreage;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	public Float getLandRegHID() {
		return LandRegHID;
	}
	public void setLandRegHID(Float landRegHID) {
		LandRegHID = landRegHID;
	}
	public String getLandRegSID() {
		return LandRegSID;
	}
	public void setLandRegSID(String landRegSID) {
		LandRegSID = landRegSID;
	}
	public String getArchiveAcreage() {
		return ArchiveAcreage;
	}
	public void setArchiveAcreage(String archiveAcreage) {
		ArchiveAcreage = archiveAcreage;
	}
	
}
