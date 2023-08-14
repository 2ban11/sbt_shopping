package com.sbt.shopping.jaehwan;

import java.util.Date;

public class ProductDTO {

	private int p_no;
	private String p_big_category;
	private String p_middle_category;
	private String p_small_category;
	private String p_maker;
	private String p_name;
	private String p_img1;
	private String p_img2;
	private String p_content;
	private String p_color;
	private int p_price;
	private int p_sale;
	private int p_cnt;
	private Date p_date;
	
	private String[] colors;
	private String sortOrder;
public ProductDTO() {
	// TODO Auto-generated constructor stub
}
public int getP_no() {
	return p_no;
}
public void setP_no(int p_no) {
	this.p_no = p_no;
}
public String getP_big_category() {
	return p_big_category;
}
public void setP_big_category(String p_big_category) {
	this.p_big_category = p_big_category;
}
public String getP_middle_category() {
	return p_middle_category;
}
public void setP_middle_category(String p_middle_category) {
	this.p_middle_category = p_middle_category;
}
public String getP_small_category() {
	return p_small_category;
}
public void setP_small_category(String p_small_category) {
	this.p_small_category = p_small_category;
}
public String getP_maker() {
	return p_maker;
}
public void setP_maker(String p_maker) {
	this.p_maker = p_maker;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getP_img1() {
	return p_img1;
}
public void setP_img1(String p_img1) {
	this.p_img1 = p_img1;
}
public String getP_img2() {
	return p_img2;
}
public void setP_img2(String p_img2) {
	this.p_img2 = p_img2;
}
public String getP_content() {
	return p_content;
}
public void setP_content(String p_content) {
	this.p_content = p_content;
}
public String getP_color() {
	return p_color;
}
public void setP_color(String p_color) {
	this.p_color = p_color;
}
public int getP_price() {
	return p_price;
}
public void setP_price(int p_price) {
	this.p_price = p_price;
}
public int getP_sale() {
	return p_sale;
}
public void setP_sale(int p_sale) {
	this.p_sale = p_sale;
}
public int getP_cnt() {
	return p_cnt;
}
public void setP_cnt(int p_cnt) {
	this.p_cnt = p_cnt;
}
public Date getP_date() {
	return p_date;
}
public void setP_date(Date p_date) {
	this.p_date = p_date;
}
public String[] getColors() {
	return colors;
}
public void setColors(String[] colors) {
	this.colors = colors;
}
public String getSortOrder() {
	return sortOrder;
}
public void setSortOrder(String sortOrder) {
	this.sortOrder = sortOrder;
}
public ProductDTO(int p_no, String p_big_category, String p_middle_category, String p_small_category, String p_maker,
		String p_name, String p_img1, String p_img2, String p_content, String p_color, int p_price, int p_sale,
		int p_cnt, Date p_date, String[] colors, String sortOrder) {
	super();
	this.p_no = p_no;
	this.p_big_category = p_big_category;
	this.p_middle_category = p_middle_category;
	this.p_small_category = p_small_category;
	this.p_maker = p_maker;
	this.p_name = p_name;
	this.p_img1 = p_img1;
	this.p_img2 = p_img2;
	this.p_content = p_content;
	this.p_color = p_color;
	this.p_price = p_price;
	this.p_sale = p_sale;
	this.p_cnt = p_cnt;
	this.p_date = p_date;
	this.colors = colors;
	this.sortOrder = sortOrder;
}
}