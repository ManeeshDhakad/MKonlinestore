package com.mkonlinestore.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mkonlinestore.dao.AddressDao;
import com.mkonlinestore.model.Address;

@Repository
public class AddressDaoImpl implements AddressDao {
	
	private Logger logger = Logger.getLogger(AddressDaoImpl.class);

	@Autowired
    private SessionFactory sessionFactory;
	
	public AddressDaoImpl() {}
		
	public int addUserAddress(Address address) {
		int addressId = -1;
	
		try {
			addressId = (Integer) sessionFactory.getCurrentSession().save(address);			
		}
		catch(HibernateException ex) {
			logger.error(ex);
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return addressId;
	}

	
	@SuppressWarnings("unchecked")
	public List<Address> getAddreesList(int userId) {
		List<Address> addressList = null;
		
		try {
			String hql = "from Address as a where a.userId = :userId";
			addressList = sessionFactory.getCurrentSession().createQuery(hql).setParameter("userId", userId).list();
		}
		catch(HibernateException ex) {
			logger.error(ex);
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		return  addressList;
	}

	public boolean deleteUserAddress(int addressId) {
		boolean result = false;
		
		try {
			Address address = (Address) sessionFactory.getCurrentSession().load(Address.class, addressId);
	        if(null != address){
	        	sessionFactory.getCurrentSession().delete(address);
	            result = true;
	        }
	  	}
		catch(HibernateException ex) {
			logger.error(ex);
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		return result;
	}

}
