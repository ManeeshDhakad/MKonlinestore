package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.dao.OrderDao;
import com.mkonlinestore.dao.ReviewDao;
import com.mkonlinestore.model.Review;
import com.mkonlinestore.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao; 
	
	@Transactional
	@Override
	public boolean addReview(Review review) {
		return reviewDao.addReview(review);
	}

	@Transactional
	@Override
	public List<Review> getReviewList(String productCode) {
		return reviewDao.getReviewList(productCode);
	}

}
