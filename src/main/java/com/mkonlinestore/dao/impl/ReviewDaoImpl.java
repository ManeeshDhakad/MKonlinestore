package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkonlinestore.dao.ReviewDao;
import com.mkonlinestore.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	private Logger logger = Logger.getLogger(ReviewDaoImpl.class);

	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public boolean addReview(Review review) {
		boolean result = false;
		
		try {
			int reviewId = (Integer) sessionFactory.getCurrentSession().save(review);	
		
			if(reviewId >= 0)
				result = true;
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return result;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Review> getReviewList(String productCode) {
		List<Review> reviewList= null;
		
		try {
			
			String hql = "from Review as r where r.productCode = :productCode ORDER BY r.reviewId DESC";
			reviewList = (List<Review>)sessionFactory.getCurrentSession().createQuery(hql).
										 	 setParameter("productCode", productCode).list();	
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return reviewList;
	}

}
