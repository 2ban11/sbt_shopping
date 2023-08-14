package com.sbt.shopping.jaehwan;

import java.util.List;

public interface Jh_productMapper {
    List<ProductDTO> getAllProduct(ProductDTO pDTO);
	List<ProductDTO> getSearchProduct(ProductDTO pDTO);
}
