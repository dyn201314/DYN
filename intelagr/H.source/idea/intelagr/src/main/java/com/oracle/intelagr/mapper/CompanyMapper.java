package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.Company;

public interface CompanyMapper {
	public List<Company> select(Map<String, Object> map);
}
