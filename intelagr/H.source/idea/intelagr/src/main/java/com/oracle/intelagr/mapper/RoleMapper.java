package com.oracle.intelagr.mapper;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.entity.Role;

public interface RoleMapper {
	public List<Role> selectAll();
	public List<Role> select(Map<String, Object> map);
	public int count(Map<String, Object> map);
	public Role selectById(int id);
	public void insert(Role role);
	public void update(Role role);
}
