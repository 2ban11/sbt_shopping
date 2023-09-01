package com.sbt.shopping.inhoo;

import java.util.Date;

import oracle.security.o3logon.a;

public class AnswerDTO {
	private int a_no;
	private int a_q_no;
	private String a_id;
	private String a_ans;
	private Date a_date;
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getA_q_no() {
		return a_q_no;
	}
	public void setA_q_no(int a_q_no) {
		this.a_q_no = a_q_no;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_ans() {
		return a_ans;
	}
	public void setA_ans(String a_ans) {
		a_ans = a_ans.replace("\r\n", "<br>");
		this.a_ans = a_ans;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	
	

}
