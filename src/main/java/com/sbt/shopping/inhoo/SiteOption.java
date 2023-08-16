package com.sbt.shopping.inhoo;

import javax.servlet.http.HttpServletRequest;

public class SiteOption {
	
	private int snsCountPerPage; // 한 페이지당 sns 개수 (변경할 수 있으니까)
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}

	public SiteOption(int snsCountPerPage) {
		super();
		this.snsCountPerPage = snsCountPerPage;
	}

	public int getSnsCountPerPage() {
		return snsCountPerPage;
	}

	public void setSnsCountPerPage(int snsCountPerPage) {
		this.snsCountPerPage = snsCountPerPage;
	}

	@Override
	public String toString() {
		return "SiteOption [snsCountPerPage=" + snsCountPerPage + "]";
	}
	
	
	

	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
		
	}
	
	
}
