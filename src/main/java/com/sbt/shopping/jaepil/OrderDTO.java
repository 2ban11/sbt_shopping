package com.sbt.shopping.jaepil;

import java.util.Arrays;
import java.util.Date;

public class OrderDTO {
	private int od_no;
	private String od_id;
	private int od_product;
	private int od_price;
	private int od_cnt;
	private Date od_date;
	private String od_state;
	private String p_name;
	private int[] od_arr;
	
	

	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}



	public OrderDTO(int od_no, String od_id, int od_product, int od_price, int od_cnt, Date od_date, String od_state,
			String p_name, int[] od_arr) {
		super();
		this.od_no = od_no;
		this.od_id = od_id;
		this.od_product = od_product;
		this.od_price = od_price;
		this.od_cnt = od_cnt;
		this.od_date = od_date;
		this.od_state = od_state;
		this.p_name = p_name;
		this.od_arr = od_arr;
	}



	public int getOd_no() {
		return od_no;
	}



	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}



	public String getOd_id() {
		return od_id;
	}



	public void setOd_id(String od_id) {
		this.od_id = od_id;
	}



	public int getOd_product() {
		return od_product;
	}



	public void setOd_product(int od_product) {
		this.od_product = od_product;
	}



	public int getOd_price() {
		return od_price;
	}



	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}



	public int getOd_cnt() {
		return od_cnt;
	}



	public void setOd_cnt(int od_cnt) {
		this.od_cnt = od_cnt;
	}



	public Date getOd_date() {
		return od_date;
	}



	public void setOd_date(Date od_date) {
		this.od_date = od_date;
	}



	public String getOd_state() {
		return od_state;
	}



	public void setOd_state(String od_state) {
		this.od_state = od_state;
	}



	public String getP_name() {
		return p_name;
	}



	public void setP_name(String p_name) {
		this.p_name = p_name;
	}



	public int[] getOd_arr() {
		return od_arr;
	}



	public void setOd_arr(int[] od_arr) {
		this.od_arr = od_arr;
	}



	@Override
	public String toString() {
		return "OrderDTO [od_no=" + od_no + ", od_id=" + od_id + ", od_product=" + od_product + ", od_price=" + od_price
				+ ", od_cnt=" + od_cnt + ", od_date=" + od_date + ", od_state=" + od_state + ", p_name=" + p_name
				+ ", od_arr=" + Arrays.toString(od_arr) + "]";
	}
	
	

}
