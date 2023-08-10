package com.sbt.shopping.inhoo;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DetailDAO {
	
	@Autowired 
	private ServletContext servlet;
	
	@Autowired
	private SqlSession ss;

	
	
	public void regReviewDo(DetailDTO dDTO) {
		if(ss.getMapper(DetailMapper.class).regReview(dDTO)==1) {
			System.out.println("등록 성공!");
		}
	}



	public Reviews getAllReview() {
	return new Reviews( ss.getMapper(DetailMapper.class).getAllReview());
		
	}



	public Reviews searchReview(ReviewSelector rs) {
		
		return new Reviews( ss.getMapper(DetailMapper.class).searchReview(rs));
		
	}

}
