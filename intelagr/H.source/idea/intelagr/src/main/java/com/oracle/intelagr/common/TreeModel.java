package com.oracle.intelagr.common;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

public class TreeModel {
	private String id ; 
    private String pid ; 
    private String text ; 
    private String iconCls ;
    private String state ; 
    private String checked ; 
    private JSONObject attributes = new JSONObject() ; 
    private List<TreeModel> children = new ArrayList<TreeModel>() ;
    
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPid() {
		return pid;
	}
	
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public String getIconCls() {
		return iconCls;
	}
	
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getChecked() {
		return checked;
	}
	
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public JSONObject getAttributes() {
		return attributes;
	}
	
	public void setAttributes(JSONObject attributes) {
		this.attributes = attributes;
	}
	
	public List<TreeModel> getChildren() {
		return children;
	}
	
	public void setChildren(List<TreeModel> children) {
		this.children = children;
	}
}
