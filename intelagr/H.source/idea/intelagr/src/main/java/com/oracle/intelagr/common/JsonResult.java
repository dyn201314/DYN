package com.oracle.intelagr.common;

public class JsonResult {
	private int status;
	private String msg;
	private Object data;

	public JsonResult() {
	}

	public JsonResult(boolean success) {
		if (!success) {
			return;
		}
		this.status = 200;
	}

	public JsonResult(boolean success, String msg) {
		this(success);
		this.msg = msg;
	}

	public int getStatus() {
		return this.status;
	}

	public String getMsg() {
		return this.msg;
	}

	public Object getData() {
		return this.data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
