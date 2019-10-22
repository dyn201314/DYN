package com.oracle.intelagr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.CommonData;
import com.oracle.intelagr.mapper.CommonDataMapper;
import com.oracle.intelagr.service.ICommonDataService;
@Service
public class CommonDataService implements ICommonDataService {
	@Autowired
	private CommonDataMapper commonDataMapper;
	@Override
	public CommonData getCommonData(String codeKey,String codeCode) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("codeKey", codeKey);
		map.put("codeCode", codeCode);
		List<CommonData> list = commonDataMapper.select(map);
		if(list.size()>0) {
			return list.get(0);
		}
		return new CommonData();
	}
	@Override
	public List<CommonData> getCommonDataListByCodeKey(String codeKey) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("codeKey", codeKey);
		return commonDataMapper.select(params);
	}

}
