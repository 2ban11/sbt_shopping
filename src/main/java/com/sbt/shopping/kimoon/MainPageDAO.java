package com.sbt.shopping.kimoon;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sbt.shopping.cart.Cart;


@Service
public class MainPageDAO {

	@Autowired
	private SqlSession ss;
	
	private Cart cart;
	
	public void getMainPageProducts(HttpServletRequest request) {
		request.setAttribute("mainProducts", ss.getMapper(MainPageProductMapper.class).getMainPageProducts(request));
	}

	public int insertMainPageCart(Cart cart) {

		if(ss.getMapper(MainPageProductMapper.class).checkDupliCart(cart) == 0) {
			// 없을 때 장바구니 insert
			return ss.getMapper(MainPageProductMapper.class).insertMainPageCart(cart);
		} else {
			// 있을 때 장바구니 카운트 update +1
			return ss.getMapper(MainPageProductMapper.class).updateMainCart(cart);
		}
		
		
	}
}
