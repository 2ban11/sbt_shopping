package com.sbt.shopping.inhoo;

public class ReviewPageInfo {
	private int currentPage;
	private int pageCount;
	
	
	public ReviewPageInfo() {
		// TODO Auto-generated constructor stub
	}


	public ReviewPageInfo(int currentPage, int pageCount) {
		super();
		this.currentPage = currentPage;
		this.pageCount = pageCount;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
}
