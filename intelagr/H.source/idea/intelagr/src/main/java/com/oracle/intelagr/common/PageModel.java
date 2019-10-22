package com.oracle.intelagr.common;

import java.util.List;

public class PageModel {
	private static int DEFAULT_PAGE_SIZE = 10;
	public static final String ASC = "asc";
	public static final String DESC = "desc";
	protected List<?> result;
	protected int page = 1;
	protected int pageSize = DEFAULT_PAGE_SIZE;
	protected String orderBy;
	protected String order;
	protected int totalCount;
	protected Object data;

	public PageModel() {
	}

	public PageModel(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}

	public List<?> getResult() {
		return this.result;
	}

	public void setResult(List<?> result) {
		this.result = result;
	}

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return (totalCount+pageSize-1)/pageSize;
	}

	public int getTotalCount() {
		return this.totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getOrderBy() {
		return this.orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrder() {
		return this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
