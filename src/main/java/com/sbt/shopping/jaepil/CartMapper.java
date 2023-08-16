package com.sbt.shopping.jaepil;

import java.util.List;

public interface CartMapper {

	 List<CartDTO>getCart();

	 int deleteCart(CartDTO cDTO);
	

}
