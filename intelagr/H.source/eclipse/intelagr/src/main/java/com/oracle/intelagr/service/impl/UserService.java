package com.oracle.intelagr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.intelagr.common.MD5Util;
import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.entity.UserRole;
import com.oracle.intelagr.mapper.UserMapper;
import com.oracle.intelagr.mapper.UserRoleMapper;
import com.oracle.intelagr.service.IUserService;
@Service
public class UserService implements IUserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Override
	public List<User> login(User user) {
		Map<String,Object> map = new HashMap<String,Object>();
		// 将password MD5 转换
		map.put("userID", user.getUserID());
		map.put("password", MD5Util.getMD5Code(user.getPassword()));	
		return userMapper.select(map);
	}
	@Override
	public List<Map> getFunction(String userID) {
		List<Map> list = new ArrayList<Map>();
		User user = userMapper.selectById(userID);
		//存储key:ModeleCode  值  List中的 Map
		Map ModuleMap = new HashMap();
		 for(Role r:user.getRoles()) {
			 for(Function f:r.getFunctions()) {
				 if(f.getModuleCode()!=null) {
					 if(ModuleMap.get(f.getModuleCode())==null) {
						 Map map = new HashMap();
						 map.put("parent", f.getModuleName());
						 List<Function> funList = new ArrayList<Function>();
						 funList.add(f);
						 map.put("child", funList);
						 list.add(map);
						 ModuleMap.put(f.getModuleCode(), map);
					 }else {
						 Map map = (Map)ModuleMap.get(f.getModuleCode());
						 List<Function> funList = (List<Function>)map.get("child");
						 funList.add(f);
					 }
				 }
			 }
		 }
		 return list;
	}
	@Override
	public void queryForPage(PageModel pageModel) {
		User user = (User)pageModel.getData();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID", user.getUserID());
		map.put("userName", user.getUserName());
		map.put("userType", user.getUserType());
		map.put("index", (pageModel.getPage()-1)*pageModel.getPageSize());
		map.put("pageSize", pageModel.getPageSize());
		List<User> list = userMapper.select(map);
		pageModel.setTotalCount(userMapper.count(map));
		pageModel.setResult(list);
	}
	@Transactional
	public void save() {
		
	}
	@Override
	@Transactional
	public void save(User user) {
		user.setPassword(MD5Util.getMD5Code(user.getPassword()));
		userMapper.insert(user);
		for(Role role:user.getRoles()) {
			UserRole ur = new UserRole();
			ur.setUserID(user.getUserID());
			ur.setRoleCode(role.getRoleCode());
			ur.setCreateDate(user.getCreateDate());
			ur.setCreateUserId(user.getCreateUserId());
			ur.setUpdateDate(user.getUpdateDate());
			ur.setUpdateUserId(user.getUpdateUserId());
			userRoleMapper.insert(ur);
		}
	}
	@Override
	public User selectById(String userID) {
		return userMapper.selectById(userID);
	}
	@Override
	public void update(User user) {
		//user.setPassword(MD5Util.getMD5Code(user.getPassword()));
		userMapper.update(user);
		/*//删除这个用户已有的角色
		userRoleMapper.delete(user.getUserID());
		//添加传来的角色
		for(Role role:user.getRoles()) {
			UserRole ur = new UserRole();
			ur.setUserID(user.getUserID());
			ur.setRoleCode(role.getRoleCode());
			ur.setCreateDate(user.getCreateDate());
			ur.setCreateUserId(user.getCreateUserId());
			ur.setUpdateDate(user.getUpdateDate());
			ur.setUpdateUserId(user.getUpdateUserId());
			userRoleMapper.insert(ur);
		}*/
	}
	@Override
	public void delete(String userID) {
		User user = new User();
		user.setUserID(userID);
		user.setDeleteFlag("Y");
		userMapper.update(user);
	}
	@Override
	public void resetPwd(String userID,String password) {
		User user = new User();
		user.setUserID(userID);
		user.setPassword(MD5Util.getMD5Code(password));
		userMapper.update(user);
	}
	@Override
	public void startUse(String userID) {
		User user = new User();
		user.setUserID(userID);
		user.setLoginStatus("01");
		userMapper.update(user);
	}
	@Override
	public void endUse(String userID) {
		User user = new User();
		user.setUserID(userID);
		user.setLoginStatus("02");
		userMapper.update(user);
	}
}
