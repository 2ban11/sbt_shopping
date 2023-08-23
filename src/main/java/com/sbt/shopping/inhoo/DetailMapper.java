package com.sbt.shopping.inhoo;

import java.util.List;

import com.sbt.shopping.jaehwan.ProductDTO;

public interface DetailMapper {

	int regReview(DetailDTO dDTO);

	ProductDTO getProduct(ProductDTO pDTO);

	List<DetailDTO> getReviews(ReviewSelector rs);

	int getReviewCount(ProductDTO pDTO);

	int regQna(QnaDTO qDTO);

	int getQnACount(ProductDTO pDTO);

	List<QnaDTO> getQnAs(QnASelector qnaSelector);
	
	

	

	

}
