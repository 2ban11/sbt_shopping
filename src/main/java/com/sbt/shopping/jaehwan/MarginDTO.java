package com.sbt.shopping.jaehwan;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MarginDTO {
	private int ma_totalCost;
	private int ma_totalSales;
	private int ma_totalMargin;
	private String date;
	private Date ma_date;
	public MarginDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MarginDTO [ma_totalCost=" + ma_totalCost + ", ma_totalSales=" + ma_totalSales + ", ma_totalMargin="
				+ ma_totalMargin + ", date=" + date + ", ma_date=" + ma_date + "]";
	}
	public int getMa_totalCost() {
		return ma_totalCost;
	}
	public void setMa_totalCost(int ma_totalCost) {
		this.ma_totalCost = ma_totalCost;
	}
	public int getMa_totalSales() {
		return ma_totalSales;
	}
	public void setMa_totalSales(int ma_totalSales) {
		this.ma_totalSales = ma_totalSales;
	}
	public int getMa_totalMargin() {
		return ma_totalMargin;
	}
	public void setMa_totalMargin(int ma_totalMargin) {
		this.ma_totalMargin = ma_totalMargin;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Date getMa_date() {
		return ma_date;
	}
	public void setMa_date(Date ma_date) {
		this.ma_date = ma_date;
	}
	public MarginDTO(int ma_totalCost, int ma_totalSales, int ma_totalMargin, String date, Date ma_date) {
		super();
		this.ma_totalCost = ma_totalCost;
		this.ma_totalSales = ma_totalSales;
		this.ma_totalMargin = ma_totalMargin;
		this.date = date;
		this.ma_date = ma_date;
	}
}