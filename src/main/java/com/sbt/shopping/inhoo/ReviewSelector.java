package com.sbt.shopping.inhoo;

import java.math.BigDecimal;

public class ReviewSelector {
	private int no;
	private BigDecimal start;
	private BigDecimal end;
	
	public ReviewSelector() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewSelector(int no, BigDecimal start, BigDecimal end) {
		super();
		this.no = no;
		this.start = start;
		this.end = end;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
		return "ReviewSelector [no=" + no + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
}
