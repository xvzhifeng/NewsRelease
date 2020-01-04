package com.situ.utils;

public class SearchInfo {

	private Integer pageno=1;

	public Integer getPageno() {
		return pageno;
	}
	public Integer getPrino() {
		return pageno>1?pageno-1:1;
	}
	public Integer getNextno() {
		return pageno+1;
	}

	public void setPageno(Integer pageno) {
		if (pageno < 1)
			pageno = 1;
		this.pageno = pageno;
		int pos = (pageno - 1) * max;
		limit = " limit " + pos + "," + max;
	}

	public static int max = 11;
	private String where;
	private String limit = " limit 0," + max;
	private String sort;

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

}
