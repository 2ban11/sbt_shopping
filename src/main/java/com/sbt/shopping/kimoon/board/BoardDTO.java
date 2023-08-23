package com.sbt.shopping.kimoon.board;

import java.util.Date;
import java.util.List;

public class BoardDTO {

// 공통
	private int rn; // 글 번호
	private String a_nickname; // 작성자
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getA_nickname() {
		return a_nickname;
	}
	public void setA_nickname(String a_nickname) {
		this.a_nickname = a_nickname;
	}
	
//	notice
	private int n_no;
	private String n_title;
	private String n_id;
	private Date n_date;
	private int n_view;
	private String n_txt;
	private int notice_reply_count;
	
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public int getN_view() {
		return n_view;
	}
	public void setN_view(int n_view) {
		this.n_view = n_view;
	}
	public String getN_txt() {
		return n_txt;
	}
	public void setN_txt(String n_txt) {
		this.n_txt = n_txt;
	}
	public int getNotice_reply_count() {
		return notice_reply_count;
	}
	public void setNotice_reply_count(int notice_reply_count) {
		this.notice_reply_count = notice_reply_count;
	}
	
	
// free
	private int f_no;
	private String f_title;
	private String f_id;
	private Date f_date;
	private int f_view;
	private String f_txt;
	private int free_reply_count;

	
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	public int getF_view() {
		return f_view;
	}
	public void setF_view(int f_view) {
		this.f_view = f_view;
	}
	public String getF_txt() {
		return f_txt;
	}
	public void setF_txt(String f_txt) {
		this.f_txt = f_txt;
	}
	public int getFree_reply_count() {
		return free_reply_count;
	}
	public void setFree_reply_count(int free_reply_count) {
		this.free_reply_count = free_reply_count;
	}
	
	
// lesson
	private int l_no;
	private String l_title;
	private String l_id;
	private Date l_date;
	private int l_view;
	private String l_txt;
	private String l_addr;
	private String l_pay;
	private String l_phone;
	private int lesson_reply_count;
	
	
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public String getL_title() {
		return l_title;
	}
	public void setL_title(String l_title) {
		this.l_title = l_title;
	}
	public String getL_id() {
		return l_id;
	}
	public void setL_id(String l_id) {
		this.l_id = l_id;
	}
	public Date getL_date() {
		return l_date;
	}
	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	public int getL_view() {
		return l_view;
	}
	public void setL_view(int l_view) {
		this.l_view = l_view;
	}
	public String getL_txt() {
		return l_txt;
	}
	public void setL_txt(String l_txt) {
		this.l_txt = l_txt;
	}
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public String getL_pay() {
		return l_pay;
	}
	public void setL_pay(String l_pay) {
		this.l_pay = l_pay;
	}
	public String getL_phone() {
		return l_phone;
	}
	public void setL_phone(String l_phone) {
		this.l_phone = l_phone;
	}
	public int getLesson_reply_count() {
		return lesson_reply_count;
	}
	public void setLesson_reply_count(int lesson_reply_count) {
		this.lesson_reply_count = lesson_reply_count;
	}
	
// job
	private int j_no;
	private String j_title;
	private String j_id;
	private Date j_date;
	private int j_view;
	private String j_txt;
	private String j_addr;
	private String j_phone;
	private String j_category;
	private int job_reply_count;
	
	
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public String getJ_title() {
		return j_title;
	}
	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}
	public String getJ_id() {
		return j_id;
	}
	public void setJ_id(String j_id) {
		this.j_id = j_id;
	}
	public Date getJ_date() {
		return j_date;
	}
	public void setJ_date(Date j_date) {
		this.j_date = j_date;
	}
	public int getJ_view() {
		return j_view;
	}
	public void setJ_view(int j_view) {
		this.j_view = j_view;
	}
	public String getJ_txt() {
		return j_txt;
	}
	public void setJ_txt(String j_txt) {
		this.j_txt = j_txt;
	}
	public String getJ_addr() {
		return j_addr;
	}
	public void setJ_addr(String j_addr) {
		this.j_addr = j_addr;
	}
	public String getJ_phone() {
		return j_phone;
	}
	public void setJ_phone(String j_phone) {
		this.j_phone = j_phone;
	}
	public String getJ_category() {
		return j_category;
	}
	public void setJ_category(String j_category) {
		this.j_category = j_category;
	}
	public int getJob_reply_count() {
		return job_reply_count;
	}
	public void setJob_reply_count(int job_reply_count) {
		this.job_reply_count = job_reply_count;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [rn=" + rn + ", a_nickname=" + a_nickname + ", n_no=" + n_no + ", n_title=" + n_title
				+ ", n_id=" + n_id + ", n_date=" + n_date + ", n_view=" + n_view + ", n_txt=" + n_txt + ", f_no=" + f_no
				+ ", f_title=" + f_title + ", f_id=" + f_id + ", f_date=" + f_date + ", f_view=" + f_view + ", f_txt="
				+ f_txt + ", l_no=" + l_no + ", l_title=" + l_title + ", l_id=" + l_id + ", l_date=" + l_date
				+ ", l_view=" + l_view + ", l_txt=" + l_txt + ", l_addr=" + l_addr + ", l_pay=" + l_pay + ", l_phone="
				+ l_phone + ", j_no=" + j_no + ", j_title=" + j_title + ", j_id=" + j_id + ", j_date=" + j_date
				+ ", j_view=" + j_view + ", j_txt=" + j_txt + ", j_addr=" + j_addr + ", j_phone=" + j_phone
				+ ", j_category=" + j_category + "]";
	}
	
	

	
	
	
	
}
