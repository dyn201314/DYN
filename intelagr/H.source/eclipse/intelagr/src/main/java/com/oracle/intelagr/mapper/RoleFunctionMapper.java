package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.RoleFunction;

public interface RoleFunctionMapper {
	public List<RoleFunction> select(Map<String,Object> map);
	public void insert(RoleFunction rf);
	public void deleteRoleCode(String roleCode);
}
