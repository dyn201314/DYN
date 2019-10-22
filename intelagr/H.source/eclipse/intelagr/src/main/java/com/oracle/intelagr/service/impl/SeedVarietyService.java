package com.oracle.intelagr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.entity.SeedVariety;
import com.oracle.intelagr.mapper.SeedVarietyMapper;
import com.oracle.intelagr.service.ISeedVarietyService;
@Service
public class SeedVarietyService implements ISeedVarietyService {
	@Autowired
	private SeedVarietyMapper seedVarietyMapper;
	@Override
	public SeedVariety getSeedVariety(String seedCode) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("seedCode", seedCode);
		List<SeedVariety> list = seedVarietyMapper.select(params);
		if(list.size()>0) {
			return list.get(0);
		}
		return new SeedVariety();
	}
	@Override
	public List<SeedVariety> getSeedVarietyList() {
		Map<String,Object> params = new HashMap<String,Object>();
		return seedVarietyMapper.select(params);
	}
}
