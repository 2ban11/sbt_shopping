package com.sbt.shopping.inhoo;

import java.awt.print.Pageable;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class HC_IH {
	
	
	
	@Autowired
	private DetailDAO dDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
		//request.setAttribute("contentPage", "inhoo/detail.jsp");
		
		return "redirect:detail.product";
	}
	@RequestMapping(value = "/detail.product", method = RequestMethod.GET)
	public String detailProduct(HttpServletRequest request, ProductDTO pDTO, Model model) {
		int p = 1;
		if( request.getParameter("p") != null) {
			p = Integer.parseInt(request.getParameter("p")); 
		}
		dDAO.getProduct(p, model, pDTO);
		request.setAttribute("contentPage", "inhoo/detail.jsp");
		return "index";
	}
	
	
	
	
	@RequestMapping(value = "/regReviewDo", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, DetailDTO dDTO) {
		req.setAttribute("contentPage", "inhoo/detail.jsp");
		
		dDAO.regReviewDo(dDTO);
		return "redirect:/"; // 홈 페이지로 리다이렉트
	}
	
	
	
	
	
	
	
	
	
	/*
	 * //리뷰 불러오기
	 * 
	 * @RequestMapping(value = "/detail.reviews.json", method = RequestMethod.GET,
	 * produces="application/json; charset=utf-8") public @ResponseBody Reviews
	 * getReview() {
	 * 
	 * return dDAO.getAllReview(); }
	 */
	
	
	
	
	
	
	/*
	 * //리뷰 찾기 안 쓸거 같음
	 * 
	 * @RequestMapping(value = "/review.search", method = RequestMethod.GET,
	 * produces="application/json; charset=utf-8") public @ResponseBody Reviews
	 * searchReviewJSON() {
	 * 
	 * return dDAO.searchReview(); }
	 * 
	 * 
	 */
	
	
	
	// 페이징
	
	/*
	 * @RequestMapping("/getReviewsByPage") public @ResponseBody Reviews
	 * getReviewsByPage(@RequestParam("page") int page) { int itemsPerPage = 10; //
	 * 페이지당 아이템 수 int startIndex = (page - 1) * itemsPerPage + 1; int endIndex =
	 * startIndex + itemsPerPage - 1; System.out.println("컨트롤러의 page=" +page);
	 * System.out.println("컨트롤러의 itemsPerPage=" +itemsPerPage);
	 * System.out.println("컨트롤러의 startIndex=" +startIndex);
	 * System.out.println("컨트롤러의 endIndex=" +endIndex); return
	 * dDAO.pagingList(startIndex, endIndex); }
	 */


	








	
	
	
	
	
	
	
	
	
	
}
