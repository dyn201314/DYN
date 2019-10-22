package com.oracle.intelagr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.YearCode;
import com.oracle.intelagr.mapper.YearCodeMapper;
import com.oracle.intelagr.service.IYearCodeService;
@Service
public class YearCodeService implements IYearCodeService{
	@Autowired
	private YearCodeMapper yearCodeMapper;
	@Override
	public YearCode getYearCode(String yearCode) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("yearCode", yearCode);
		List<YearCode> list = yearCodeMapper.select(params);
		if(list.size()>0) {
			return list.get(0);
		}
		return new YearCode();
	}
	@Override
	public List<YearCode> getYearCodeList() {
		Map<String,Object> params = new HashMap<String,Object>();
		return yearCodeMapper.select(params);
	}

}
