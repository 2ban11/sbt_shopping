package com.sbt.shopping.kimoon.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

public class BoardPaging {
	private int boardCountPerPage; // 관리는 servlet-context.xml의 value에서
	
	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public void setBoardCountPerPage(int boardCountPerPage) {
		this.boardCountPerPage = boardCountPerPage;
	}

	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);		
	}
	
}
