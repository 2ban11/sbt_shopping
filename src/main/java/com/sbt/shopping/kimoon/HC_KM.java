package com.sbt.shopping.kimoon;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbt.shopping.cart.Cart;
import com.sbt.shopping.kimoon.board.BoardDAO;

@Controller
public class HC_KM {


	@Autowired
	private MainPageDAO mpDAO;
	

	@Autowired
	private BoardDAO bDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String mainPage(HttpServletRequest request) {
		mpDAO.getMainPageProducts(request);
		request.setAttribute("contentPage", "kimoon/kimoonMainPage.jsp");

		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/do.insert.cart", method = RequestMethod.GET)
	public int insertMainPageCart(HttpServletRequest request, Cart cart) {
		return mpDAO.insertMainPageCart(cart);
	}


}
