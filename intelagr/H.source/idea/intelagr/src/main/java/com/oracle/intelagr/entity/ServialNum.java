package com.oracle.intelagr.entity;

import java.util.Date;
public class ServialNum {
	
	private Integer id;
	//普通土地系列号
	private Integer pTNo;
	//特殊土地系列号
	private Integer tXNo;
	//收粮上报流水号
	private Integer sLNo;
	//投入品流水号
	private Integer tRNo;
	//土地变更流水号
	private Integer bgNo;
		
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getpTNo() {
		return pTNo;
	}

	public void setpTNo(Integer pTNo) {
		this.pTNo = pTNo;
	}

	public Integer gettXNo() {
		return tXNo;
	}

	public void settXNo(Integer tXNo) {
		this.tXNo = tXNo;
	}

	public Integer getsLNo() {
		return sLNo;
	}

	public void setsLNo(Integer sLNo) {
		this.sLNo = sLNo;
	}

	public Integer gettRNo() {
		return tRNo;
	}

	public void settRNo(Integer tRNo) {
		this.tRNo = tRNo;
	}

	public Integer getBgNo() {
		return bgNo;
	}

	public void setBgNo(Integer bgNo) {
		this.bgNo = bgNo;
	}
}
