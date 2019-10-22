package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.entity.SeedVariety;

public interface SeedVarietyMapper {
	public List<SeedVariety> select(Map<String, Object> map);
}
