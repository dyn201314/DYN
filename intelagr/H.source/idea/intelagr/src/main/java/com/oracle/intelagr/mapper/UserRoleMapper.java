package com.oracle.intelagr.mapper;

import com.oracle.intelagr.entity.UserRole;

public interface UserRoleMapper {
	public void insert(UserRole userRole);
	public void delete(String userID);
}
