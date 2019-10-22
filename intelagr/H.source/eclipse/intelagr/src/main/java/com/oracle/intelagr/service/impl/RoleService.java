package com.oracle.intelagr.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.mapper.RoleFunctionMapper;
import com.oracle.intelagr.mapper.RoleMapper;
import com.oracle.intelagr.service.IRoleService;
@Service
public class RoleService implements IRoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleFunctionMapper roleFunctionMapper;
	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}
	@Override
	public void queryForPage(PageModel pageModel) {
		Role role = (Role)pageModel.getData();
		Map map =new HashMap();
		map.put("roleCode", role.getRoleCode());
		map.put("roleName", role.getRoleName());
		map.put("index", (pageModel.getPage()-1)*pageModel.getPageSize());
		map.put("pageSize",pageModel.getPageSize());
		List<Role> list = roleMapper.select(map);
		pageModel.setResult(list);
		pageModel.setTotalCount(roleMapper.count(map));
	}
	@Override
	public Role queryById(int id) {
		return roleMapper.selectById(id);
	}
	@Override
	public void delete(int[] ids) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void update(Role role) {
		roleMapper.update(role);
	}
	@Override
	public void save(Role role) {
		roleMapper.insert(role);
	}
	@Override
	@Transactional
	public void saveRoleAuth(String roleCode,String [] funIds,User user) {
		//删除 roleCode的所有rolefunctionmap数据
		roleFunctionMapper.deleteRoleCode(roleCode);
		//添加rolefunctionmap
		for(String funId:funIds) {
			RoleFunction rf = new RoleFunction();
			rf.setRoleCode(roleCode);
			rf.setFunctionCode(funId);
			rf.setCreateUserId(user.getUserID());
			rf.setUpdateUserId(user.getUserID());
			rf.setCreateDate(new Date());
			rf.setUpdateDate(new Date());
			roleFunctionMapper.insert(rf);
		}
	}

}
