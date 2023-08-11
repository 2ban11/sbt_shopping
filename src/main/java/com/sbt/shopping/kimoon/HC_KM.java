package com.sbt.shopping.kimoon;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sbt.shopping.jaehwan.ProductDAO;


@Controller
public class HC_KM {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(Locale locale, Model model, HttpServletRequest req) {
		req.setAttribute("contentPage", "kimoon/kimoonMainPage.jsp");
		return "index";
	}
	
}
