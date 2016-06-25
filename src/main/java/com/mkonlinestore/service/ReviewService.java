package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Review;

public interface ReviewService {
	public boolean addReview(Review review);
	
	public List<Review> getReviewList(String productCode);
}
