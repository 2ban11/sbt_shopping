package com.sbt.shopping.jaehwan;

public class ProductDTO {

	private int pl_no;
	private String pl_productImg;
	private String pl_companyLogo;
	private String pl_type;
	private String pl_category;
	private String pl_companyName;
	private String pl_color;
	private String pl_name;
	private int pl_price;
	private String[] colors;
	private String sortOrder;
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDTO(int pl_no, String pl_productImg, String pl_companyLogo, String pl_type, String pl_category,
			String pl_companyName, String pl_color, String pl_name, int pl_price, String[] colors, String sortOrder) {
		super();
		this.pl_no = pl_no;
		this.pl_productImg = pl_productImg;
		this.pl_companyLogo = pl_companyLogo;
		this.pl_type = pl_type;
		this.pl_category = pl_category;
		this.pl_companyName = pl_companyName;
		this.pl_color = pl_color;
		this.pl_name = pl_name;
		this.pl_price = pl_price;
		this.colors = colors;
		this.sortOrder = sortOrder;
	}
	public int getPl_no() {
		return pl_no;
	}
	public void setPl_no(int pl_no) {
		this.pl_no = pl_no;
	}
	public String getPl_productImg() {
		return pl_productImg;
	}
	public void setPl_productImg(String pl_productImg) {
		this.pl_productImg = pl_productImg;
	}
	public String getPl_companyLogo() {
		return pl_companyLogo;
	}
	public void setPl_companyLogo(String pl_companyLogo) {
		this.pl_companyLogo = pl_companyLogo;
	}
	public String getPl_type() {
		return pl_type;
	}
	public void setPl_type(String pl_type) {
		this.pl_type = pl_type;
	}
	public String getPl_category() {
		return pl_category;
	}
	public void setPl_category(String pl_category) {
		this.pl_category = pl_category;
	}
	public String getPl_companyName() {
		return pl_companyName;
	}
	public void setPl_companyName(String pl_companyName) {
		this.pl_companyName = pl_companyName;
	}
	public String getPl_color() {
		return pl_color;
	}
	public void setPl_color(String pl_color) {
		this.pl_color = pl_color;
	}
	public String getPl_name() {
		return pl_name;
	}
	public void setPl_name(String pl_name) {
		this.pl_name = pl_name;
	}
	public int getPl_price() {
		return pl_price;
	}
	public void setPl_price(int pl_price) {
		this.pl_price = pl_price;
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
	
}
