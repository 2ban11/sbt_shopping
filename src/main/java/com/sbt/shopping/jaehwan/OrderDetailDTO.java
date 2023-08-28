package com.sbt.shopping.jaehwan;

import java.util.Arrays;
import java.util.Date;

import org.springframework.ui.Model;

public class OrderDetailDTO {
	private int od_no;
	private String od_id;
	private int od_product;
	private int od_price;
	private int od_cnt;
	private Date od_date;
	private String od_state;
	
	private int p_sale;
	private int p_cost;
	private String p_name;
	private int[] od_arr;
	
	private String date;
	private int totalCost;
	private int totalSales;
	private int totalMargin;
	private double totalMarginByPercent;
public OrderDetailDTO() {
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "OrderDetailDTO [od_no=" + od_no + ", od_id=" + od_id + ", od_product=" + od_product + ", od_price="
			+ od_price + ", od_cnt=" + od_cnt + ", od_date=" + od_date + ", od_state=" + od_state + ", p_sale=" + p_sale
			+ ", p_cost=" + p_cost + ", p_name=" + p_name + ", od_arr=" + Arrays.toString(od_arr) + ", date=" + date
			+ ", totalCost=" + totalCost + ", totalSales=" + totalSales + ", totalMargin=" + totalMargin
			+ ", totalMarginByPercent=" + totalMarginByPercent + "]";
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
public int getP_sale() {
	return p_sale;
}
public void setP_sale(int p_sale) {
	this.p_sale = p_sale;
}
public int getP_cost() {
	return p_cost;
}
public void setP_cost(int p_cost) {
	this.p_cost = p_cost;
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
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public int getTotalCost() {
	return totalCost;
}
public void setTotalCost(int totalCost) {
	this.totalCost = totalCost;
}
public int getTotalSales() {
	return totalSales;
}
public void setTotalSales(int totalSales) {
	this.totalSales = totalSales;
}
public int getTotalMargin() {
	return totalMargin;
}
public void setTotalMargin(int totalMargin) {
	this.totalMargin = totalMargin;
}
public double getTotalMarginByPercent() {
	return totalMarginByPercent;
}
public void setTotalMarginByPercent(double totalMarginByPercent) {
	this.totalMarginByPercent = totalMarginByPercent;
}
public OrderDetailDTO(int od_no, String od_id, int od_product, int od_price, int od_cnt, Date od_date, String od_state,
		int p_sale, int p_cost, String p_name, int[] od_arr, String date, int totalCost, int totalSales,
		int totalMargin, double totalMarginByPercent) {
	super();
	this.od_no = od_no;
	this.od_id = od_id;
	this.od_product = od_product;
	this.od_price = od_price;
	this.od_cnt = od_cnt;
	this.od_date = od_date;
	this.od_state = od_state;
	this.p_sale = p_sale;
	this.p_cost = p_cost;
	this.p_name = p_name;
	this.od_arr = od_arr;
	this.date = date;
	this.totalCost = totalCost;
	this.totalSales = totalSales;
	this.totalMargin = totalMargin;
	this.totalMarginByPercent = totalMarginByPercent;
}
}