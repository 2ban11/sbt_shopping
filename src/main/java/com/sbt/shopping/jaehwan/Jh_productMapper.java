package com.sbt.shopping.jaehwan;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

public interface Jh_productMapper {
    
	List<ProductDTO> getAllProduct(ProductDTO pDTO);
	List<ProductDTO> getSearchProduct(ProductDTO pDTO);
	List<ProductDTO> getAdminProduct(ProductDTO pDTO);
	List<ProductDTO> getSearchProductForAdmin(ProductDTO pDTO);
	int deleteProduct(ProductDTO pDTO);
	int regProduct(ProductDTO pDTO);
	List<OrderDetailDTO> getOrderDetail(OrderDetailDTO odDTO);
	List<OrderDetailDTO> getAllOrder(ProductDTO pDTO);
	List<OrderDetailDTO> getChartData();
	List<OrderDetailDTO> getMargin(OrderDetailDTO odDTO);
	int updateProduct(ProductDTO pDTO);
}
