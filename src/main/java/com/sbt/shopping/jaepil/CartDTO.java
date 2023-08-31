package com.sbt.shopping.jaepil;

public class CartDTO {
	private int c_no;
	private String c_id;
	private int c_product;
	private int c_cnt;
	private int p_no;
	private String p_big_category;
	private String p_name;
	private String p_img1;
	private String p_sale;

	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int c_no, String c_id, int c_product, int c_cnt, int p_no, String p_big_category, String p_name,
			String p_img1, String p_sale) {
		super();
		this.c_no = c_no;
		this.c_id = c_id;
		this.c_product = c_product;
		this.c_cnt = c_cnt;
		this.p_no = p_no;
		this.p_big_category = p_big_category;
		this.p_name = p_name;
		this.p_img1 = p_img1;
		this.p_sale = p_sale;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public int getC_product() {
		return c_product;
	}

	public void setC_product(int c_product) {
		this.c_product = c_product;
	}

	public int getC_cnt() {
		return c_cnt;
	}

	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
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

	public String getP_sale() {
		return p_sale;
	}

	public void setP_sale(String p_sale) {
		this.p_sale = p_sale;
	}

	
}
