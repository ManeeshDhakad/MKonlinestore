package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Review;

public interface ReviewDao {
	public boolean addReview(Review review);
	
	public List<Review> getReviewList(String productCode);

}
