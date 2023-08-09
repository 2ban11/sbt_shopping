package com.sbt.shopping.kimoon;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class MainPageDAO {

	@Autowired
	private SqlSession ss;
	
	public void get48Products(HttpServletRequest request) {
		request.setAttribute("mainProducts", ss.getMapper(MainPageProductMapper.class).get48Products(request));
	}
}
