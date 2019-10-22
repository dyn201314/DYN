package com.oracle.intelagr.service;

import java.util.List;

import com.oracle.intelagr.entity.Company;

public interface ICompanyService {
	public Company getCompany(String companyCode);
	public List<Company> getCompanyListByCompanyType(String companyType);
}
