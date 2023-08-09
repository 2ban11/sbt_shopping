package com.sbt.shopping.kimoon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sbt.shopping.product.Product;

public interface MainPageProductMapper {

	List<Product>get48Products(HttpServletRequest request);
}
