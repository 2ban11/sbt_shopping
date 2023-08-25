package com.sbt.shopping.jaehwan;

import java.util.List;

public interface Jh_productMapper {
    List<ProductDTO> getAllProduct(ProductDTO pDTO);
	List<ProductDTO> getSearchProduct(ProductDTO pDTO);
	List<ProductDTO> getAdminProduct(ProductDTO pDTO);
	List<ProductDTO> getSearchProductForAdmin(ProductDTO pDTO);
	int deleteProduct(ProductDTO pDTO);
	int regProduct(ProductDTO pDTO);
	List<OrderDetailDTO> getOrderDetail(OrderDetailDTO odDTO);
	List<OrderDetailDTO> getAllodDTO();
}
