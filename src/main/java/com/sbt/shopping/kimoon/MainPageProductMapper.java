package com.sbt.shopping.kimoon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sbt.shopping.cart.Cart;
import com.sbt.shopping.product.Product;

public interface MainPageProductMapper {

	List<Product>getMainPageProducts(HttpServletRequest request);

	int insertMainPageCart(Cart cart);

	int checkDupliCart(Cart cart);

	int updateMainCart(Cart cart);
}
