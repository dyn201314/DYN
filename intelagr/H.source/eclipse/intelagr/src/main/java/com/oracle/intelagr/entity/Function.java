package com.oracle.intelagr.entity;


public class Function extends BaseEntity
{
	private Integer id;
	//模块编号
	private String moduleCode;
	//模块名称
	private String moduleName;
	//模块显示顺序
	private Integer moduleDispSeq;
	//功能编号
	private String functionCode;
	//功能名称
	private String functionName;
	//功能显示顺序
	private Integer functionDispSeq;
	//功能链接
	private String functionURL;
	//功能图标
	private String functionIcon;
		
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public Integer getModuleDispSeq() {
		return moduleDispSeq;
	}

	public void setModuleDispSeq(Integer moduleDispSeq) {
		this.moduleDispSeq = moduleDispSeq;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public Integer getFunctionDispSeq() {
		return functionDispSeq;
	}

	public void setFunctionDispSeq(Integer functionDispSeq) {
		this.functionDispSeq = functionDispSeq;
	}

	public String getFunctionURL() {
		return functionURL;
	}

	public void setFunctionURL(String functionURL) {
		this.functionURL = functionURL;
	}

	public String getFunctionIcon() {
		return functionIcon;
	}

	public void setFunctionIcon(String functionIcon) {
		this.functionIcon = functionIcon;
	}
}
