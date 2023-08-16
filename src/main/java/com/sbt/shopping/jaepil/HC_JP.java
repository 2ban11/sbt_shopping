package com.sbt.shopping.jaepil;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HC_JP {
	
	@Autowired
	private CartDAO cDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, CartDTO cDTO) {
	cDAO.getCart(req, cDTO);
	req.setAttribute("contentPage", "jaepil/mypage_cart.jsp");
	return "index";
	}
	
	@RequestMapping(value = "/deletecart", method = RequestMethod.GET)
	public String deleteCart(HttpServletRequest req, CartDTO cDTO) {
	cDAO.deleteCart(cDTO);
	cDAO.getCart(req, cDTO);
	req.setAttribute("contentPage", "jaepil/mypage_cart.jsp");
	return "index";
	}
}
