package com.sbt.shopping.jaepil;

import java.util.Date;

public class OrderDTO {
	private int o_no;
	private Date o_date;
	private int o_price;
	private int p_sale;
	private String p_name;
	private String od_cnt;
	
public OrderDTO() {
	// TODO Auto-generated constructor stub
}

public OrderDTO(int o_no, Date o_date, int o_price, int p_sale, String p_name, String od_cnt) {
	super();
	this.o_no = o_no;
	this.o_date = o_date;
	this.o_price = o_price;
	this.p_sale = p_sale;
	this.p_name = p_name;
	this.od_cnt = od_cnt;
}

public int getO_no() {
	return o_no;
}

public void setO_no(int o_no) {
	this.o_no = o_no;
}

public Date getO_date() {
	return o_date;
}

public void setO_date(Date o_date) {
	this.o_date = o_date;
}

public int getO_price() {
	return o_price;
}

public void setO_price(int o_price) {
	this.o_price = o_price;
}

public int getP_sale() {
	return p_sale;
}

public void setP_sale(int p_sale) {
	this.p_sale = p_sale;
}

public String getP_name() {
	return p_name;
}

public void setP_name(String p_name) {
	this.p_name = p_name;
}

public String getOd_cnt() {
	return od_cnt;
}

public void setOd_cnt(String od_cnt) {
	this.od_cnt = od_cnt;
}


}
