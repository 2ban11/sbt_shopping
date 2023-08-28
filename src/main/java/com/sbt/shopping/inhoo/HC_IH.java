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

import com.sbt.shopping.jaehwan.ProductDTO;

@Controller
public class HC_IH {
	
	@Autowired
	private DetailDAO dDAO;
	
	
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
	public String detailProduct(
	    HttpServletRequest request, 
	    @RequestParam("p_no") int pNo,  // 여기서 p_no 값을 받아옵니다.
	    Model model) {

	    ProductDTO pDTO = new ProductDTO();
	    pDTO.setP_no(pNo); // 받아온 p_no 값을 ProductDTO에 설정합니다.

	    int reviewPage = 1;
	    String reviewPageStr = request.getParameter("reviewPage");
	    if(reviewPageStr != null && !reviewPageStr.isEmpty()) {
	        try {
	            reviewPage = Integer.parseInt(reviewPageStr);
	        } catch (NumberFormatException e) {
	            // 로깅 또는 적절한 예외 처리
	            e.printStackTrace();
	        }
	    }

	    int qnaPage = 1;
	    String qnaPageStr = request.getParameter("qnaPage");
	    if(qnaPageStr != null && !qnaPageStr.isEmpty()) {
	        try {
	            qnaPage = Integer.parseInt(qnaPageStr);
	        } catch (NumberFormatException e) {
	            // 로깅 또는 적절한 예외 처리
	            e.printStackTrace();
	        }
	    }

	    dDAO.getProduct(reviewPage, model, pDTO);
	    dDAO.getQnAPage(qnaPage, model, pDTO);
	    request.setAttribute("contentPage", "inhoo/detail.jsp");
	    model.addAttribute("qnaCurPage", qnaPage);
	    return "index";
	}


	
	
	
	

	@RequestMapping(value = "/regReviewDo", method = RequestMethod.POST)
	public String regReview(HttpServletRequest req, DetailDTO dDTO, Model model, ProductDTO pDTO) {
	    req.setAttribute("contentPage", "inhoo/detail.jsp");
	    dDAO.regReviewDo(dDTO, model, pDTO, req);
	    return "redirect:/detail.product?p_no=" + dDTO.getR_product(); // 홈 페이지로 리다이렉트
	}

	
	
	

	
	@RequestMapping(value = "/regQnaDo", method = RequestMethod.POST)
	public String regQna(HttpServletRequest req, QnaDTO qDTO, Model model, ProductDTO pDTO) {
		req.setAttribute("contentPage", "inhoo/detail.jsp");
		dDAO.regQnaDo(qDTO, model, pDTO, req);
		return "redirect:/detail.product?p_no=" + pDTO.getP_no();
	}

	
	
}
