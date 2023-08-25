package com.sbt.shopping.jaepil;

import java.util.List;

import com.sbt.shopping.myeonggyu.AccountDTO;

public interface CartMapper {

	List<CartDTO>getCart(AccountDTO aDTO);

	int deleteCart(String no);

	int updateCart(CartDTO cDTO);

	List<CartDTO> getOrderCart(CartDTO cDTO);
	

}
