package com.sbt.shopping.jaepil;

import java.util.List;
import java.util.Map;

import com.sbt.shopping.myeonggyu.AccountDTO;

public interface OrderMapper {

	List<OrderDTO> getOrder(AccountDTO aDTO);

	List<OrderDTO> getOrderByDate(Map<String, String> vals);

	int refund(OrderDTO oDTO);

	int refundCancel(OrderDTO oDTO);
	


}
