package com.sbt.shopping.kimoon.notice;

import java.math.BigDecimal;

public class NoticeSelector {
	private String search;
	private BigDecimal start;
	private BigDecimal end;
	
	public NoticeSelector() {
		// TODO Auto-generated constructor stub
	}

	public NoticeSelector(String search, BigDecimal start, BigDecimal end) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public BigDecimal getStart() {
		return start;
	}

	public void setStart(BigDecimal start) {
		this.start = start;
	}

	public BigDecimal getEnd() {
		return end;
	}

	public void setEnd(BigDecimal end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "NoticeSelector [search=" + search + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
