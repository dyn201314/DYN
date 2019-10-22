package com.oracle.intelagr.service;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.RoleFunction;

public interface IRoleFunctionService {
	public List<RoleFunction> query(Map<String,Object> map);
}
