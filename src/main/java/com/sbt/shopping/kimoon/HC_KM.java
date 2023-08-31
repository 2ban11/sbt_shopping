package com.sbt.shopping.kimoon;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbt.shopping.cart.Cart;
import com.sbt.shopping.kimoon.board.BoardDAO;

@Controller
public class HC_KM {


	@Autowired
	private MainPageDAO mpDAO;
	

	@Autowired
	private BoardDAO bDAO;

	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(HttpServletRequest request) {
		mpDAO.getMainPageProducts(request);
		request.setAttribute("contentPage", "kimoon/kimoonMainPage.jsp");

		return "index";
	}
	
	// 헤더에서 상품 검색
	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String searchDo(HttpServletRequest request, @RequestParam String search) {
		System.out.println(search);
		mpDAO.getSearchProducts(request, search);
		request.setAttribute("contentPage", "kimoon/headerSearch.jsp");
		
		return "index";
	}
	
	// 장바구니 넣기
	@ResponseBody
	@RequestMapping(value = "/do.insert.cart", method = RequestMethod.GET)
	public int insertMainPageCart(HttpServletRequest request, Cart cart) {
		return mpDAO.insertMainPageCart(cart);
	}


}
