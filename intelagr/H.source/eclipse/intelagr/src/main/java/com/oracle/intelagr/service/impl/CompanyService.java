package com.oracle.intelagr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.mapper.CompanyMapper;
import com.oracle.intelagr.service.ICompanyService;
@Service
public class CompanyService implements ICompanyService {
	@Autowired
	private CompanyMapper companyMapper;
	@Override
	public Company getCompany(String companyCode) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("companyCode", companyCode);
		List<Company> list = companyMapper.select(params);
		if(list.size()>0) {
			return list.get(0);
		}
		return new Company();
	}
	@Override
	public List<Company> getCompanyListByCompanyType(String companyType) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("companyType", companyType);
		return companyMapper.select(params);
	}

}
