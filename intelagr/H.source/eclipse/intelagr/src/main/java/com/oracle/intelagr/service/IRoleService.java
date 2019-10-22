package com.oracle.intelagr.service;

import java.util.List;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;

public interface IRoleService {
	public List<Role> selectAll();
	public void queryForPage(PageModel pageModel);
	public Role queryById(int id);
	public void delete(int [] ids);
	public void update(Role role);
	public void save(Role role);
	public void saveRoleAuth(String roleCode,String [] funIds,User user);
}
