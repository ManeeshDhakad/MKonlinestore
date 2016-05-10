package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mkonlinestore.dao.ProductDao;
import com.mkonlinestore.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	private Logger logger = Logger.getLogger(ProductDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;
	
	public ProductDaoImpl() {}

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(int category) {
		List<Product> productList = null;
		
		try {
			String hql = "from Product as p where p.productCategory = :productCategory";
			productList = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("productCategory", category).list();
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return productList;
	}

	public Product getProductDetails(String productCode) {
		Product product = null;
		
		try {
			String hql = "from Product as p where p.productCode = :productCode";
			product = (Product) sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("productCode", productCode).uniqueResult();
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return product;
	}

	
}
