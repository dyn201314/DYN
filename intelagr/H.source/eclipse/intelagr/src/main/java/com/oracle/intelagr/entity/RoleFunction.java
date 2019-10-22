package com.oracle.intelagr.entity;


public class RoleFunction extends BaseEntity
{
	private Integer id;
	//角色编号
	private String roleCode;
	//功能编号
	private String functionCode;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
}
