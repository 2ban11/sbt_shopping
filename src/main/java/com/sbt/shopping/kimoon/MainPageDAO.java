package com.sbt.shopping.kimoon;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sbt.shopping.cart.Cart;
import com.sbt.shopping.myeonggyu.AccountDTO;


@Service
public class MainPageDAO {

	@Autowired
	private SqlSession ss;
	
	// 상품 전체 가져오기(전체 48개)
	public void getMainPageProducts(HttpServletRequest request) {
		request.setAttribute("mainProducts", ss.getMapper(MainPageProductMapper.class).getMainPageProducts(request));
	}
	
	// 장바구니 추가
	public int insertMainPageCart(Cart cart) {
		if(ss.getMapper(MainPageProductMapper.class).checkDupliCart(cart) == 0) {
			// 없을 때 장바구니 insert
			System.out.println("장바구니 insert");
			return ss.getMapper(MainPageProductMapper.class).insertMainPageCart(cart);
		} else {
			// 있을 때 장바구니 카운트 update +1
			System.out.println("장바구니 update");
			return ss.getMapper(MainPageProductMapper.class).updateMainCart(cart);
		}
	}

	public void getSearchProducts(HttpServletRequest request, String search) {
		
		request.setAttribute("searchProducts", ss.getMapper(MainPageProductMapper.class).searchProducts(search));
		
	}
	
}
