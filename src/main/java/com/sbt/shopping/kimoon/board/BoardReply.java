package com.sbt.shopping.kimoon.board;

import java.util.Date;

public class BoardReply {
	private int nr_no;
	private int nr_notice;
	private String nr_text;
	private String nr_id;
	private Date nr_date;
	
	public BoardReply() {
		// TODO Auto-generated constructor stub
	}

	public BoardReply(int nr_no, int nr_notice, String nr_text, String nr_id, Date nr_date) {
		super();
		this.nr_no = nr_no;
		this.nr_notice = nr_notice;
		this.nr_text = nr_text;
		this.nr_id = nr_id;
		this.nr_date = nr_date;
	}

	public int getNr_no() {
		return nr_no;
	}

	public void setNr_no(int nr_no) {
		this.nr_no = nr_no;
	}

	public int getNr_notice() {
		return nr_notice;
	}

	public void setNr_notice(int nr_notice) {
		this.nr_notice = nr_notice;
	}

	public String getNr_text() {
		return nr_text;
	}

	public void setNr_text(String nr_text) {
		this.nr_text = nr_text;
	}

	public String getNr_id() {
		return nr_id;
	}

	public void setNr_id(String nr_id) {
		this.nr_id = nr_id;
	}

	public Date getNr_date() {
		return nr_date;
	}

	public void setNr_date(Date nr_date) {
		this.nr_date = nr_date;
	}
	
	
}
