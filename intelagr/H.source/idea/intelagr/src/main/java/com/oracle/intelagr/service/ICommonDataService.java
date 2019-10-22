package com.oracle.intelagr.service;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.CommonData;

public interface ICommonDataService {
	public CommonData getCommonData(String codeKey, String codeCode);
	public List<CommonData> getCommonDataListByCodeKey(String codeKey);
}
