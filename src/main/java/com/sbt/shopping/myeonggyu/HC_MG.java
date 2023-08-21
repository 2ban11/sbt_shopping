package com.sbt.shopping.myeonggyu;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HC_MG {
	
	
	
	@RequestMapping(value = "/fff", method = RequestMethod.GET)
	public String home(HttpServletRequest req ) {
		req.setAttribute("contentPage", "myeonggyu/login.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String goIndex(HttpServletRequest req ) {
		req.setAttribute("contentPage", "myeonggyu/login.jsp");
		return "index";
	}
	
	
}
