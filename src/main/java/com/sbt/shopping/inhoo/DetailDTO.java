package com.sbt.shopping.inhoo;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DetailDTO {
	private int r_no;
	private int p_no;
	private int r_product;
	private String r_id;
	private String r_title;
	private String r_content;
	private int r_rate;
	private String r_img;
	private MultipartFile file;
	private Date r_date;
	private String a_nickname;
	
	public DetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getR_product() {
		return r_product;
	}

	public void setR_product(int r_product) {
		this.r_product = r_product;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content.replaceAll("\r\n","<br>");
	}

	public int getR_rate() {
		return r_rate;
	}

	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}

	public String getR_img() {
		return r_img;
	}

	public void setR_img(String r_img) {
		this.r_img = r_img;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getA_nickname() {
		return a_nickname;
	}

	public void setA_nickname(String a_nickname) {
		this.a_nickname = a_nickname;
	}

	public DetailDTO(int r_no, int p_no, int r_product, String r_id, String r_title, String r_content, int r_rate,
			String r_img, MultipartFile file, Date r_date, String a_nickname) {
		super();
		this.r_no = r_no;
		this.p_no = p_no;
		this.r_product = r_product;
		this.r_id = r_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_rate = r_rate;
		this.r_img = r_img;
		this.file = file;
		this.r_date = r_date;
		this.a_nickname = a_nickname;
	}

	@Override
	public String toString() {
		return "DetailDTO [r_no=" + r_no + ", p_no=" + p_no + ", r_product=" + r_product + ", r_id=" + r_id
				+ ", r_title=" + r_title + ", r_content=" + r_content + ", r_rate=" + r_rate + ", r_img=" + r_img
				+ ", file=" + file + ", r_date=" + r_date + ", a_nickname=" + a_nickname + "]";
	}

	
	
	
	
	
}
