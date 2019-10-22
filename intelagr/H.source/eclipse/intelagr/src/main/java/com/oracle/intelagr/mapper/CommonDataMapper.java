package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.CommonData;

public interface CommonDataMapper {
	public List<CommonData> select(Map<String,Object> map);
}
