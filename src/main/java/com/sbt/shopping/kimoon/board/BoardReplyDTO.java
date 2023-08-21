package com.sbt.shopping.kimoon.board;

import java.util.Date;

public class BoardReplyDTO {
	
	private String a_nickname;
	private int n_no;
	private int f_no;
	private int l_no;
	private int j_no;
	public String getA_nickname() {
		return a_nickname;
	}
	public void setA_nickname(String a_nickname) {
		this.a_nickname = a_nickname;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	
	
	
	// 공지
	private int nr_no;
	private int nr_notice;
	private String nr_text;
	private String nr_id;
	private Date nr_date;
	
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
	
	
	
	// 자유
	private int fr_no;
	private int fr_free;
	private String fr_text;
	private String fr_id;
	private Date fr_date;
	
	public int getFr_no() {
		return fr_no;
	}
	public void setFr_no(int fr_no) {
		this.fr_no = fr_no;
	}
	public int getFr_free() {
		return fr_free;
	}
	public void setFr_free(int fr_free) {
		this.fr_free = fr_free;
	}
	public String getFr_text() {
		return fr_text;
	}
	public void setFr_text(String fr_text) {
		this.fr_text = fr_text;
	}
	public String getFr_id() {
		return fr_id;
	}
	public void setFr_id(String fr_id) {
		this.fr_id = fr_id;
	}
	public Date getFr_date() {
		return fr_date;
	}
	public void setFr_date(Date fr_date) {
		this.fr_date = fr_date;
	}



	// 레슨
	private int lr_no;
	private int lr_lesson;
	private String lr_text;
	private String lr_id;
	private Date lr_date;
	
	public int getLr_no() {
		return lr_no;
	}
	public void setLr_no(int lr_no) {
		this.lr_no = lr_no;
	}
	public int getLr_lesson() {
		return lr_lesson;
	}
	public void setLr_lesson(int lr_lesson) {
		this.lr_lesson = lr_lesson;
	}
	public String getLr_text() {
		return lr_text;
	}
	public void setLr_text(String lr_text) {
		this.lr_text = lr_text;
	}
	public String getLr_id() {
		return lr_id;
	}
	public void setLr_id(String lr_id) {
		this.lr_id = lr_id;
	}
	public Date getLr_date() {
		return lr_date;
	}
	public void setLr_date(Date lr_date) {
		this.lr_date = lr_date;
	}



	// 구인구직
	private int jr_no;
	private int jr_job;
	private String jr_text;
	private String jr_id;
	private Date jr_date;
	
	public int getJr_no() {
		return jr_no;
	}
	public void setJr_no(int jr_no) {
		this.jr_no = jr_no;
	}
	public int getJr_job() {
		return jr_job;
	}
	public void setJr_job(int jr_job) {
		this.jr_job = jr_job;
	}
	public String getJr_text() {
		return jr_text;
	}
	public void setJr_text(String jr_text) {
		this.jr_text = jr_text;
	}
	public String getJr_id() {
		return jr_id;
	}
	public void setJr_id(String jr_id) {
		this.jr_id = jr_id;
	}
	public Date getJr_date() {
		return jr_date;
	}
	public void setJr_date(Date jr_date) {
		this.jr_date = jr_date;
	}
	
	
	
	
}
