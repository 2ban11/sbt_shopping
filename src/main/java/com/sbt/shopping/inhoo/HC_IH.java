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
import org.springframework.web.multipart.MultipartFile;
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
	
//	강사님 페이징
//	@RequestMapping(value = "/detail.product", method = RequestMethod.GET)
//	public String detailProduct(HttpServletRequest request, ProductDTO pDTO, Model model) {
//		int p = 1;
//		if( request.getParameter("p") != null) {
//			p = Integer.parseInt(request.getParameter("p")); 
//		}
//		dDAO.getProduct(p, model, pDTO);
//		request.setAttribute("contentPage", "inhoo/detail.jsp");
//		return "index";
//	}
	
	
	
//	도전중
	@RequestMapping(value = "/detail.product", method = RequestMethod.GET)
	public String detailProduct(HttpServletRequest request, ProductDTO pDTO, Model model) {
		int reviewPage = 1;
		if(request.getParameter("reviewPage") != null) {
		    reviewPage = Integer.parseInt(request.getParameter("reviewPage"));
		}

		int qnaPage = 1;
		if(request.getParameter("qnaPage") != null) {
		    qnaPage = Integer.parseInt(request.getParameter("qnaPage"));
		}

		dDAO.getProduct(reviewPage, model, pDTO);
		dDAO.getQnAPage(qnaPage, model, pDTO); //추가된 메소드
		System.out.println("여긴 컨트롤러 = " + request);
		request.setAttribute("contentPage", "inhoo/detail.jsp");
		return "index";
	}
	
	
	
	

	
	
	
	@RequestMapping(value = "/regReviewDo", method = RequestMethod.POST)
	public String regReview( HttpServletRequest req, DetailDTO dDTO, Model model) {
		req.setAttribute("contentPage", "inhoo/detail.jsp");
		dDAO.regReviewDo(dDTO, model);
		return "redirect:/"; // 홈 페이지로 리다이렉트
	}
	
	
	@RequestMapping(value = "/regQnaDo", method = RequestMethod.GET)
	public String regQna(HttpServletRequest req, QnaDTO qDTO, Model model) {
		req.setAttribute("contentPage", "inhoo/detail.jsp");
		dDAO.regQnaDo(qDTO, model);
		return "redirect:/"; // 홈 페이지로 리다이렉트
	}
	
}
