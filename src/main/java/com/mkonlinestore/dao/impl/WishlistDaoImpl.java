package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mkonlinestore.dao.WishlistDao;
import com.mkonlinestore.model.Wishlist;

@Repository
public class WishlistDaoImpl implements WishlistDao {
	private Logger logger = Logger.getLogger(WishlistDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	public WishlistDaoImpl() {}

	public boolean addProductToWishlist(Wishlist wishlist) {
		boolean result = false;
		
		try {
			int wishlistId = (Integer) sessionFactory.getCurrentSession().save(wishlist);	
			
			if(wishlistId >= 0)
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

	@SuppressWarnings("unchecked")
	public List<Wishlist> getUserWishlist(int userId) {
		List<Wishlist> wishlist = null;
		
		try {
			String hql = "from Wishlist as w where w.userId = :userId";
			wishlist = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", userId).list();	
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return wishlist;
	}

	public boolean deleteProductFromWishlist(Wishlist wishlist) {
		boolean result = false;
		
		try {
			String hql = "delete from Wishlist as w where w.userId = :userId and w.productCode = :productCode";
			int rowDeleted = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", wishlist.getUserId()).
										 setParameter("productCode", wishlist.getProductCode()).executeUpdate();
			if(rowDeleted > 0)
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

}
