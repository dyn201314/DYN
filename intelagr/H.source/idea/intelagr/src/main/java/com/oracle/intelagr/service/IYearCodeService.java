package com.oracle.intelagr.service;

import java.util.List;

import com.oracle.intelagr.entity.YearCode;

public interface IYearCodeService {
	public YearCode getYearCode(String yearCode) ;
	public List<YearCode> getYearCodeList();
}
