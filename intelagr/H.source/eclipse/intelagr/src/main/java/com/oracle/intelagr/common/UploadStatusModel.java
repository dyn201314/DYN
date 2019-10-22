package com.oracle.intelagr.common;

public class UploadStatusModel {
	/**
	 * 已上传数据的百分比
	 */
	private double percent;
	/**
	 * 正在上传第几个文件
	 */
	private int items;
	
	public double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	public int getItems() {
		return items;
	}
	public void setItems(int items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "UploadStatus [percent=" + percent + ", items=" + items + "]";
	}
	
	
}
