package com.oracle.intelagr.service;

import java.util.List;
import java.util.Map;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.User;

public interface IUserService {
	public List<User> login(User user);
	public List<Map> getFunction(String userID);
	public void queryForPage(PageModel pageModel);
	public void save(User user);
	public User selectById(String userID);
	public void update(User user);
	public void delete(String userID);
	public void delete(String[] userIDs);
	public void resetPwd(String userID, String password);
	public void startUse(String userID);
	public void endUse(String userID);
}
