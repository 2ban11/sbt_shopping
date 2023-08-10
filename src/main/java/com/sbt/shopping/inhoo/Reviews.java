package com.sbt.shopping.inhoo;

import java.util.List;

public class Reviews {
	private List<DetailDTO> reviews;
	
	public Reviews() {
		// TODO Auto-generated constructor stub
	}

	public Reviews(List<DetailDTO> reviews) {
		super();
		this.reviews = reviews;
	}

	public List<DetailDTO> getReviews() {
		return reviews;
	}

	public void setReviews(List<DetailDTO> reviews) {
		this.reviews = reviews;
	}
	
	
	
}
