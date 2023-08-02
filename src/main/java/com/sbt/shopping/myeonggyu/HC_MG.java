package com.sbt.shopping.myeonggyu;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HC_MG {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String goIndex(HttpServletRequest req ) {
		
		return "myeonggyu/login";
	}
	
	@RequestMapping(value = "/naver_login.go", method = RequestMethod.GET)
	public String goNaver(HttpServletRequest req ) {
		
		return "myeonggyu/naver_login";
	}
	
	@RequestMapping(value = "/naver_login_callback", method = RequestMethod.GET)
	public String goNaverCallBack(HttpServletRequest req ) {
		
		return "redirect:/loginSuccess.go";	
		}
	
	@RequestMapping(value = "/kakao_login.go", method = RequestMethod.GET)
	public String goKakao(HttpServletRequest req ) {
		return "myeonggyu/kakao_login";
	}
	
	@RequestMapping(value = "/loginSuccess.go", method = RequestMethod.GET)
	public String goLoginSuccess(HttpServletRequest req ) {
		return "myeonggyu/loginSuccess";
	}
	
}
