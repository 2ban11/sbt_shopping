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
import org.springframework.web.bind.annotation.RequestParam;

import com.sbt.shopping.kimoon.board.BoardDAO;
import com.sbt.shopping.kimoon.board.BoardPaging;

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

//	@RequestMapping(value = "go.notice", method = RequestMethod.GET)
//	public String goNotice(HttpServletRequest request, @RequestParam int p) {
//		NoticePaging.clearSearch(request);
//        nDAO.getNotice(p, request);
//        request.setAttribute("contentPage", "kimoon/notice.jsp");
//        return "index";
//	}

}
