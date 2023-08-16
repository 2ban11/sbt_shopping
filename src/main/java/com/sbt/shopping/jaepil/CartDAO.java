package com.sbt.shopping.jaepil;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getCart(HttpServletRequest req,CartDTO cDTO) {
		req.setAttribute("carts",ss.getMapper(CartMapper.class).getCart());
	}

	public void deleteCart(CartDTO cDTO) {
		if (ss.getMapper(CartMapper.class).deleteCart(cDTO) == 1) {
			System.out.println("삭제성공!");
		}
	}

}
