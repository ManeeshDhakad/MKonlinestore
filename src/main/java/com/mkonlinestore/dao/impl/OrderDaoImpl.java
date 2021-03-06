package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkonlinestore.dao.OrderDao;
import com.mkonlinestore.model.Order;

@Repository
public class OrderDaoImpl implements OrderDao {

	private Logger logger = Logger.getLogger(OrderDaoImpl.class);

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public boolean saveOrder(List<Order> orderList) {
		boolean result = false;
		//Transaction tx = null;
		 
		try {
			
			//tx = sessionFactory.getCurrentSession().beginTransaction(); 
	        for(Order order : orderList) 
	        	sessionFactory.getCurrentSession().saveOrUpdate(order);	
	        
			result = true;
		}
		catch(HibernateException ex) {
			//if (tx != null) tx.rollback();
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
	public List<Order> getOrderList(int userId) {
		List<Order> orderList = null;
		
		try {
			String hql = "from Order as o where o.userId = :userId ORDER BY o.orderId DESC";
			orderList = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userId", userId).list();			
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return orderList;
	}

	@Override
	public boolean updateOrder(Order order) {
		boolean result = false;
		
		try {
			String hql = "update Order as o set o.orderStatus = :orderStatus " +
						 "where o.orderId = :orderId and o.productCode = :productCode";
			int rowUpdated = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("orderStatus", order.getOrderStatus()).
										 setParameter("orderId", order.getOrderId()).
										  setParameter("productCode", order.getProductCode()).executeUpdate();
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

}
