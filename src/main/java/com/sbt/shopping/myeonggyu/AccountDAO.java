package com.sbt.shopping.myeonggyu;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;

	public void login(AccountDTO a, HttpServletRequest req) {
		
		AccountDTO dbAccount =	ss.getMapper(AccountMapper.class).getAccountByID(a);
		
	      if (dbAccount != null) {
	            if (a.getA_password().equals(dbAccount.getA_password())){
	                req.getSession().setAttribute("loginMember", dbAccount);
	                req.getSession().setMaxInactiveInterval(60 * 10);
	            } else {
	                req.setAttribute("result", "password error!");
	            }
	        } else {
	            req.setAttribute("result", "can't find user");
	        }
	    }

	public boolean loginCheck(HttpServletRequest req) {
		return true;
		
	}

	public void logout(HttpServletRequest req) {
		
	}

	public void splitAddr(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	public void bye(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	public void join(AccountDTO a, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	public void update(AccountDTO a, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	public int checkId(AccountDTO a, HttpServletRequest req) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
}
