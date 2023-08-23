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
	private MypageDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, OrderDTO oDTO) {
		req.setAttribute("contentPage", "jaepil/mypage_order.jsp");
		mDAO.getOrder(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.order", method = RequestMethod.GET)
	public String order(HttpServletRequest req, OrderDTO oDTO) {
		req.setAttribute("contentPage", "jaepil/mypage_order.jsp");
		mDAO.getOrder(req);
		return "index";
	}
	
	@RequestMapping(value = "mypage.orderdate", method = RequestMethod.GET)
	public String getOrderByDate(HttpServletRequest req, OrderDTO oDTO) {
		req.setAttribute("contentPage", "jaepil/mypage_order.jsp");
		mDAO.getOrderByDate(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.qna", method = RequestMethod.GET)
	public String qna(HttpServletRequest req, OrderDTO oDTO) {
		req.setAttribute("contentPage", "jaepil/mypage_qna.jsp");
		mDAO.getQna(req);
		return "index";
	}

	@RequestMapping(value = "/mypage.cart", method = RequestMethod.GET)
	public String cart(HttpServletRequest req, CartDTO cDTO) {
		mDAO.getCart(req, cDTO);
		req.setAttribute("contentPage", "jaepil/mypage_cart.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/deletecart", method = RequestMethod.GET)
	public String deleteCart(HttpServletRequest req, CartDTO cDTO) {
		mDAO.deleteCart(cDTO,req);
		return "redirect:/mypage.cart";
	}

	@RequestMapping(value = "/updatecart", method = RequestMethod.GET)
	public String updateCart(HttpServletRequest req, CartDTO cDTO) {
		mDAO.updateCart(req, cDTO);
		return "redirect:/mypage.cart";
	}
	
	@RequestMapping(value = "/mypage.editaccount", method = RequestMethod.GET)
	public String editaccountGo(HttpServletRequest req, AccountDTO aDTO) {
		mDAO.getAccount(req, aDTO);
		req.setAttribute("contentPage", "jaepil/mypage_edit_account.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/accountedit", method = RequestMethod.POST)
	public String editaccountDo(HttpServletRequest req, AccountDTO aDTO) {
		mDAO.editAccount(req, aDTO);
		
		return "redirect:/mypage.editaccount";
	}
	
	@RequestMapping(value = "/mypage.signout", method = RequestMethod.GET)
	public String signOutGo(HttpServletRequest req, AccountDTO aDTO) {
		mDAO.getAccount(req, aDTO);
		req.setAttribute("contentPage", "jaepil/mypage_signout.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signOutDo(HttpServletRequest req, AccountDTO aDTO) {
		mDAO.signOut(req, aDTO);
		req.setAttribute("contentPage", "jaepil/mypage_signout.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String cartOrder(HttpServletRequest req, AccountDTO aDTO) {
		mDAO.signOut(req, aDTO);
		req.setAttribute("contentPage", "jaepil/mypage_signout.jsp");
		return "index";
	}
	
	
	
	
}
