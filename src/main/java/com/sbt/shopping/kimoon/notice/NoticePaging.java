package com.sbt.shopping.kimoon.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

public class NoticePaging {
	private int noticeCountPerPage; // 관리는 servlet-context.xml의 value에서
	
	public NoticePaging() {
		// TODO Auto-generated constructor stub
	}

	public int getNoticeCountPerPage() {
		return noticeCountPerPage;
	}

	public void setNoticeCountPerPage(int noticeCountPerPage) {
		this.noticeCountPerPage = noticeCountPerPage;
	}

	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);		
	}
	
}
