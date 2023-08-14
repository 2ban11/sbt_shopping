package com.sbt.shopping.kimoon;

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
public class HC_KM {
	
@Autowired
private MainPageDAO mpDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(HttpServletRequest request) {
		// mpDAO.get48Products(request);
		request.setAttribute("contentPage", "kimoon/kimoonMainPage.jsp");
		return "index";
	}
	
}
