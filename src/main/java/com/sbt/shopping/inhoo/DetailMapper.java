package com.sbt.shopping.inhoo;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

public interface DetailMapper {

	int regReview(DetailDTO dDTO);

	List<DetailDTO> getAllReview();

	List<DetailDTO> searchReview();

	ProductDTO getProduct(ProductDTO pDTO);

	//int getMsgCount(SNSSelector search);

	//List<DetailDTO> getMsg(SNSSelector search);

	//List<DetailDTO> getReviewsInRange(@Param("startIndex") int startIndex, @Param("endIndex") int endIndex);

	List<DetailDTO> getReviews(ReviewSelector rs);

	int getReviewCount(ProductDTO pDTO);

	

	

}
