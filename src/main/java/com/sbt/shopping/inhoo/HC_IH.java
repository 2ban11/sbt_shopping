package com.sbt.shopping.inhoo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class HC_IH {
	
	@Autowired
	private DetailDAO dDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		request.setAttribute("contentPage", "inhoo/detail.jsp");
		return "index";
	}
	
	
	
	
	@RequestMapping(value = "/regReviewDo", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, DetailDTO dDTO) {
		req.setAttribute("contentPage", "inhoo/detail.jsp");
		System.out.println("뭐가 들었나" + dDTO);
		dDAO.regReviewDo(dDTO);
		return "index";
	}
	
	
	
	
	
	//리뷰 불러오기
	@RequestMapping(value = "/detail.reviews.json", method = RequestMethod.GET,
			produces="application/json; charset=utf-8")
	public @ResponseBody Reviews getReview() {
		
		return dDAO.getAllReview();
	}
	
	@RequestMapping(value = "/review.search", method = RequestMethod.GET,
			produces="application/json; charset=utf-8")
	public @ResponseBody Reviews searchReviewJSON(ReviewSelector rs) {
		
		return dDAO.searchReview(rs);
	}
	
	
	
	
	
}
