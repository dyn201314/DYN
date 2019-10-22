package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.YearCode;

public interface YearCodeMapper {
	public List<YearCode> select(Map<String,Object> map);
}
