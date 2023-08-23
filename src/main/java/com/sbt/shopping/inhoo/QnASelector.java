package com.sbt.shopping.inhoo;

import java.math.BigDecimal;

public class QnASelector {
	private int no;
	private BigDecimal start;
	private BigDecimal end;
	
	
	public QnASelector() {
		// TODO Auto-generated constructor stub
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
	public QnASelector(int no, BigDecimal start, BigDecimal end) {
		super();
		this.no = no;
		this.start = start;
		this.end = end;
	}
	@Override
	public String toString() {
		return "QnASelector [no=" + no + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
