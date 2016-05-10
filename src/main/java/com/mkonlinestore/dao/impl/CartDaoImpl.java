package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkonlinestore.dao.CartDao;
import com.mkonlinestore.model.Cart;

@Repository
public class CartDaoImpl implements CartDao {
	private Logger logger = Logger.getLogger(CartDaoImpl.class);

	@Autowired
    private SessionFactory sessionFactory;

	public CartDaoImpl() {}
		
	public Cart getCartProductDetails(Cart cart) {
		Cart cartProduct = null;
		
		try {
			String hql = "from Cart as c where c.userId = :userId and c.productCode = :productCode";
			cartProduct = (Cart)sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", cart.getUserId()).
										 setParameter("productCode", cart.getProductCode()).uniqueResult();
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		return cartProduct;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cart> getCartProductList(Cart cart) {
		List<Cart> cartProductList= null;
		
		try {
			
			String hql = "from Cart as c where c.userId = :userId";
			cartProductList = sessionFactory.getCurrentSession().createQuery(hql).
										 	 setParameter("userId", cart.getUserId()).list();	
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return cartProductList;
	}

	public boolean addProductToCart(Cart cart) {
		boolean result = false;
		
		try {
			int cartId = (Integer) sessionFactory.getCurrentSession().save(cart);	
		
			if(cartId >= 0)
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

	public boolean updateProductQunatityToCart(Cart cart) {
		boolean result = false;
		
		try {
			
			String hql = "update Cart as c set c.productQuantity = :productQuantity " +
						 "where c.userId = :userId and c.productCode = :productCode";
			int rowUpdated = sessionFactory.getCurrentSession().createQuery(hql).
											setParameter("productQuantity", cart.getProductQuantity()).
											setParameter("userId", cart.getUserId()).
											setParameter("productCode", cart.getProductCode()).executeUpdate();
			if(rowUpdated > 0)
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

	public boolean removeProductFromCart(Cart cart) {
		boolean result = false;
		
		try {
			
			String hql = "delete from Cart as c " +
						 "where c.userId = :userId and c.productCode = :productCode";
			int rowDeleted = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", cart.getUserId()).
										 setParameter("productCode", cart.getProductCode()).executeUpdate();
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

	public boolean removeAllProductFromCart(Cart cart) {
		boolean result = false;
		try {
			String hql = "delete from Cart as c where c.userId = :userId";
			int rowDeleted = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", cart.getUserId()).executeUpdate();
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
