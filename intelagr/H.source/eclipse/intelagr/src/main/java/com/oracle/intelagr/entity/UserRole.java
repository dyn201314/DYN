package com.oracle.intelagr.entity;
public class UserRole extends BaseEntity
{
	private Integer id;
	//用户名
	private String userID;
	//角色编号
	private String roleCode;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	
}
