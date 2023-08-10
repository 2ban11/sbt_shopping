package com.sbt.shopping.inhoo;

import java.util.List;

public interface DetailMapper {

	int regReview(DetailDTO dDTO);

	List<DetailDTO> getAllReview();

	List<DetailDTO> searchReview(ReviewSelector rs);

	
}
