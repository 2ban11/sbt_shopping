package com.sbt.shopping.inhoo;

import java.util.Date;

public class QnaDTO {
	private int q_no;
	private int p_no;
	private String q_id;
	private int q_product;
	private String q_title;
	private String q_content;
	private Date q_date;
	
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}


	public QnaDTO(int q_no, int p_no, String q_id, int q_product, String q_title, String q_content, Date q_date) {
		super();
		this.q_no = q_no;
		this.p_no = p_no;
		this.q_id = q_id;
		this.q_product = q_product;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
	}


	public int getQ_no() {
		return q_no;
	}


	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public String getQ_id() {
		return q_id;
	}


	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}


	public int getQ_product() {
		return q_product;
	}


	public void setQ_product(int q_product) {
		this.q_product = q_product;
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


	@Override
	public String toString() {
		return "QnaDTO [q_no=" + q_no + ", p_no=" + p_no + ", q_id=" + q_id + ", q_product=" + q_product + ", q_title="
				+ q_title + ", q_content=" + q_content + ", q_date=" + q_date + "]";
	}
	
	
	
	
	
	
	
}
