package com.oracle.intelagr.service;

import java.util.List;

import com.oracle.intelagr.entity.SeedVariety;

public interface ISeedVarietyService {
	public SeedVariety getSeedVariety(String seedCode);
	public List<SeedVariety> getSeedVarietyList() ;
}
