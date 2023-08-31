package com.sbt.shopping.kimoon.kakaopay;

import com.sbt.shopping.jaepil.CartDTO;
import com.sbt.shopping.jaepil.OrderDTO;

public interface KakaoPayMapper {

	int addOrder(OrderDTO oDTO);

	int deleteCart(CartDTO cDTO);

	int downProductCnt(OrderDTO orderDTO);

}
