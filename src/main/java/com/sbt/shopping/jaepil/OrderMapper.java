package com.sbt.shopping.jaepil;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

	List<OrderDTO> getOrder();

	List<OrderDTO> getOrderByDate(Map<String, String> vals);

}
