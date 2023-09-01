package com.sbt.shopping.jaepil;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbt.shopping.myeonggyu.AccountDTO;
import com.sbt.shopping.myeonggyu.AccountMapper;

@Service
public class MypageDAO {

	@Autowired
	private SqlSession ss;

	public void getOrder(HttpServletRequest req, AccountDTO aDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");

		if (account != null) {
			aDTO.setA_id(account.getA_id());
			req.setAttribute("orders", ss.getMapper(OrderMapper.class).getOrder(aDTO));
		}

	}

	public void getOrderByDate(HttpServletRequest req, AccountDTO aDTO) {
		Map<String, String> vals = new HashMap<String, String>();
		vals.put("startdate", req.getParameter("startdate"));
		vals.put("enddate", req.getParameter("enddate"));
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");

		aDTO.setA_id(account.getA_id());
		vals.put("a_id", account.getA_id());

		System.out.println(vals.put("startdate", req.getParameter("startdate")));
		System.out.println(vals.put("enddate", req.getParameter("enddate")));
		req.setAttribute("orders", ss.getMapper(OrderMapper.class).getOrderByDate(vals));
	}

	public void getCart(HttpServletRequest req, CartDTO cDTO, AccountDTO aDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
		if (account != null) {
			aDTO.setA_id(account.getA_id());
			req.setAttribute("carts", ss.getMapper(CartMapper.class).getCart(aDTO));
		}
	}

	public void deleteCart(CartDTO cDTO, HttpServletRequest req) {
		String chk[] = req.getParameterValues("c_no");
		for (String s : chk) {
			if (ss.getMapper(CartMapper.class).deleteCart(s) == 1) {
				System.out.println("삭제성공!");
			}
		}

	}

	public void updateCart(HttpServletRequest req, CartDTO cDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
		cDTO.setC_id(account.getA_id());

		if (ss.getMapper(CartMapper.class).updateCart(cDTO) == 1) {
			System.out.println("수정성공!");
			System.out.println(cDTO.getC_cnt());
		}
	}

	public void getQna(HttpServletRequest req, AccountDTO aDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
		if (account != null) {
			aDTO.setA_id(account.getA_id());
			req.setAttribute("qnas", ss.getMapper(QnaMapper.class).getQna(aDTO));
		}
	}

	public void getAccount(HttpServletRequest req, AccountDTO aDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
		if (account != null) {
			aDTO.setA_id(account.getA_id());
			req.setAttribute("account", ss.getMapper(AccountMapper.class).getAccountByID(aDTO));
		}
	}

	public void editAccount(HttpServletRequest req, AccountDTO aDTO) {
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
		aDTO.setA_id(account.getA_id());
		if (ss.getMapper(AccountMapper.class).editAccount(aDTO) == 1) {
			System.out.println("수정성공!");
		}

	}

	public void signOut(HttpServletRequest req, AccountDTO aDTO) {
		if (ss.getMapper(AccountMapper.class).bye(aDTO) == 1) {
			System.out.println("삭제성공!");
		}

	}

	public void refund(HttpServletRequest req, OrderDTO oDTO) {
		if (ss.getMapper(OrderMapper.class).refund(oDTO) == 1) {
		}
	}

	public void refundCancel(HttpServletRequest req, OrderDTO oDTO) {
		if (ss.getMapper(OrderMapper.class).refundCancel(oDTO) == 1) {
		}
	}

}
