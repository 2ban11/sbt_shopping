package com.sbt.shopping.jaepil;

import java.util.Date;

public class QnaDTO {
	private int rn;
	private String q_title;
	private String q_content;
	private Date q_date;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaDTO(int rn, String q_title, String q_content, Date q_date) {
		super();
		this.rn = rn;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	
	
	
	
}
