package com.sbt.shopping.myeonggyu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountController {
	
	@Autowired
	private AccountDAO aDAO;
	
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
    public String loginMember(AccountDTO a, HttpServletRequest req) {
        aDAO.login(a, req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.logout", method = RequestMethod.GET)
    public String logoutMember(AccountDTO a, HttpServletRequest req) {
        aDAO.logout(req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.info", method = RequestMethod.GET)
    public String infoMember(AccountDTO a, HttpServletRequest req) {


        if(aDAO.loginCheck(req)) {
            aDAO.splitAddr(req);
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
        req.setAttribute("contentPage", "account/join.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.join", method = RequestMethod.POST)
    public String joinMember(AccountDTO a, HttpServletRequest req) {
        System.out.println(a.toString());
        aDAO.join(a, req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }

    @RequestMapping(value = "/account.update", method = RequestMethod.POST)
    public String updateMember(AccountDTO a, HttpServletRequest req) {
        aDAO.update(a, req);
        aDAO.loginCheck(req);
        req.setAttribute("contentPage", "index.jsp");
        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "/account.get", method = RequestMethod.GET)
    public int checkId(AccountDTO a, HttpServletRequest req) {

        return aDAO.checkId(a, req);
    }
}

