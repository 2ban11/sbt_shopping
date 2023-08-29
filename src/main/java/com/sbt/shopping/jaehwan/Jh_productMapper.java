package com.sbt.shopping.jaehwan;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
	List<OrderDetailDTO> getRefundOrder(ProductDTO pDTO);
	List<OrderDetailDTO> getMargin(OrderDetailDTO odDTO);
	int updateProduct(ProductDTO pDTO);
	int insertMargin(MarginDTO mDTO);
	int refundAccept(OrderDetailDTO oDTO);
	int refundCancel2(OrderDetailDTO oDTO);
	List<Integer> getChartData();
	int updateMargin(MarginDTO mDTO);
	List<MarginDTO> getMarginByDate(String date);
}
