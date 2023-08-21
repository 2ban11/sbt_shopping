package com.sbt.shopping.myeonggyu;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AccountController {
	
	@Autowired
	private AccountDAO aDAO;
	
	 @Autowired
	    private AccountEmailAuth AEA ; // EmailAuthService 주입
	
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String loginMember(AccountDTO a, HttpServletRequest req) {
	    if (aDAO.login(a, req)) {
	        return "redirect:/"; 
	    } else {
	        aDAO.loginCheck(req);
	        req.setAttribute("contentPage", "myeonggyu/login.jsp"); // 로그인 실패 시 그대로 머무르기
	        return "index";
	    }
	}
	 
	@RequestMapping(value = "/account.logout", method = RequestMethod.GET)
	    public String logoutMember(HttpServletRequest req) {
	        aDAO.logout(req);
	        aDAO.loginCheck(req);
	        req.setAttribute("contentPage", "myeonggyu/login.jsp");
	        return "index";
	    }
	@RequestMapping(value = "/social.logout", method = RequestMethod.GET)
	public String socialLogOut(HttpServletRequest req) {
		aDAO.socialLogOut(req);
		return "redirect:/";
	}

    @RequestMapping(value = "/account.info", method = RequestMethod.GET)
    public String infoMember(AccountDTO a, HttpServletRequest req) {


        if(aDAO.loginCheck(req)) {
            req.setAttribute("contentPage", "account/info.jsp");
        } else {
            req.setAttribute("contentPage", "index.jsp");
        }
        return "index";
    }
    @RequestMapping(value = "/account.bye", method = RequestMethod.GET)
    public String byeMember(AccountDTO a, HttpServletRequest req) {
        if(aDAO.loginCheck(req)) {
            aDAO.bye(req);
        }
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }


    @RequestMapping(value = "/account.join.go", method = RequestMethod.GET)
    public String joinMemberGo(AccountDTO a, HttpServletRequest req) {
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "myeonggyu/join.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.join", method = RequestMethod.POST)
    public String joinMember(AccountDTO a, HttpServletRequest req) {
        System.out.println(a.toString());
        aDAO.join(a, req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "myeonggyu/login.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.update", method = RequestMethod.POST)
    public String updateMember(AccountDTO a, HttpServletRequest req) {
        aDAO.update(a, req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }

  
    
    @RequestMapping(value = "/naver_login.go", method = RequestMethod.GET)
    public String goNaver(HttpServletRequest req) {
        aDAO.naverLogIn(req);
        return "myeonggyu/naver_login";
    }

    @RequestMapping(value = "/naver_login_callback", method = RequestMethod.GET)
    public String goNaverCallBack(HttpServletRequest req) {
        aDAO.naverLoginCallBack(req);
        return "redirect:/";
        }
	
    @RequestMapping(value = "/kakao_login.go", method = RequestMethod.GET)
    public String goKakao(HttpServletRequest req) {
        return "myeonggyu/kakao_login";
    }

    @RequestMapping(value = "/kakao_login_callback", method = RequestMethod.POST)
    public String goKakaoCallBack(HttpServletRequest req,
                                  @RequestParam String userEmail,
                                  @RequestParam String kakaoUserId
                                 ) {
    	System.out.println("로그인 콜백");
        aDAO.saveKakaoUserInfo(req, userEmail, kakaoUserId);
        return "redirect:/loginSuccess.go?type=kakao";
    }

    
	
	@RequestMapping(value = "/loginSuccess.go", method = RequestMethod.GET)
	public String goLoginSuccess(HttpServletRequest req ) {
		return "myeonggyu/loginSuccess";
	}
	
	 @ResponseBody
	    @RequestMapping(value = "/account.get", method = RequestMethod.GET)
	    public int checkId(AccountDTO a, HttpServletRequest req) {

	        return aDAO.checkId(a, req);
	    }
    
	 @ResponseBody
	    @RequestMapping(value = "/accountNickname.get", method = RequestMethod.GET)
	    public int checkNickName(AccountDTO a, HttpServletRequest req) {

	        return aDAO.checkNickName(a, req);
	    }
	
	
	 @RequestMapping(value = "/account.sendEmailCodePage", method = RequestMethod.GET)
	    public String sendEmailCodePage(HttpServletRequest req) {
		 req.setAttribute("contentPage", "myeonggyu/emailCode.jsp");
	        return "index"; 
	    }
	 
	 @RequestMapping(value = "/account.sendEmailCode", method = RequestMethod.POST)
	 public @ResponseBody Map<String, String> sendVerificationCode(@RequestParam("email") String email, HttpServletRequest req, Model model) {
	     // 이메일 인증 코드 전송
	     String verificationCode = AEA.generateVerificationCode(); // 인증 코드 생성
	     req.getSession().setAttribute("EmailCode", verificationCode); // 세션에 인증번호 저장
	     model.addAttribute("email", email);
	     return AEA.sendVerificationEmail(email); // 이메일 전송
	 }
	 
	 @RequestMapping(value = "/account.email.auth", method = RequestMethod.GET)
	    public String email_Auth(HttpServletRequest req) {
		 req.setAttribute("contentPage", "myeonggyu/email_find_pw.jsp");
	        return "index"; 
	    }

	 @RequestMapping(value = "/shopping/checkEmailExistence", method = RequestMethod.POST)
	 @ResponseBody
	 public String checkEmailExistence(@RequestParam("email") HttpServletRequest req) {
	     // 이메일 존재 여부 확인 로직 수행
	     if (aDAO.emailExistsInDatabase(req)) {
	         return "exist";
	     } else {
	         return "not_exist";
	     }
	 }
}

