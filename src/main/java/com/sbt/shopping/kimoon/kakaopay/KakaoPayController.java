package com.sbt.shopping.kimoon.kakaopay;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbt.shopping.jaepil.CartDTO;
import com.sbt.shopping.jaepil.OrderDTO;
import com.sbt.shopping.myeonggyu.AccountDTO;

@Controller
public class KakaoPayController {
    
    private KakaoPayDAO kpDAO;
    
	@Autowired
    public void setKakaoPay(KakaoPayDAO kpDAO) {
        this.kpDAO = kpDAO;
    }
    
    @RequestMapping(value = "/kakaoPay", method = RequestMethod.GET)
    public void kakaoPayGet() {
        
    }
    
    @RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
    public String kakaoPay(HttpServletRequest request, CartDTO cart, AccountDTO aDTO) {
        return "redirect:" + kpDAO.kakaoPayReady(request, cart, aDTO);
    }
    
    @RequestMapping(value = "/kakaoPaySuccess", method = RequestMethod.GET)
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, HttpServletRequest request) {
    	request.setAttribute("info", kpDAO.kakaoPayInfo(request, pg_token));
    	request.setAttribute("contentPage", "kimoon/kakaoPaySuccess.jsp");
    	return "index";
    }
    
}
