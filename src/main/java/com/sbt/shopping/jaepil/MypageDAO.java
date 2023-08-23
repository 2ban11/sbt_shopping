package com.sbt.shopping.jaepil;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getOrder(HttpServletRequest req) {
		req.setAttribute("orders",ss.getMapper(OrderMapper.class).getOrder());
	}
	
	public void getOrderByDate(HttpServletRequest req) {
		Map<String, String> vals = new HashMap<String, String>();
		vals.put("startdate", req.getParameter("startdate"));
		vals.put("enddate", req.getParameter("enddate"));
		
		System.out.println(vals.put("startdate", req.getParameter("startdate")));
		System.out.println(vals.put("enddate", req.getParameter("enddate")));
		req.setAttribute("orders",ss.getMapper(OrderMapper.class).getOrderByDate(vals));		
	}
	
	public void getCart(HttpServletRequest req,CartDTO cDTO) {
		req.setAttribute("carts",ss.getMapper(CartMapper.class).getCart());
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
		if (ss.getMapper(CartMapper.class).updateCart(cDTO) == 1) {
			System.out.println("수정성공!");
			System.out.println(cDTO.getC_cnt());
		}
	}

	public void getQna(HttpServletRequest req) {
		req.setAttribute("qnas", ss.getMapper(QnaMapper.class).getQna());
	}

	public void getAccount(HttpServletRequest req, AccountDTO aDTO) {
		req.setAttribute("account", ss.getMapper(AccountMapper.class).getAccount(aDTO));
	}

	public void editAccount(HttpServletRequest req, AccountDTO aDTO) {
		if (ss.getMapper(AccountMapper.class).editAccount(aDTO) == 1) {
			System.out.println("수정성공!");
		}
		
	}

	public void signOut(HttpServletRequest req, AccountDTO aDTO) {
		if (ss.getMapper(AccountMapper.class).signOut(aDTO) == 1) {
			System.out.println("삭제성공!");
		}
		
	}

	


	
}
