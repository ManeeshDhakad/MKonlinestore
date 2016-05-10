package com.mkonlinestore.dao.impl;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mkonlinestore.dao.UserDao;
import com.mkonlinestore.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	private Logger logger = Logger.getLogger(UserDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;
	
	public UserDaoImpl() {}

	public User loginUser(User user) {
		User usr = null;
		
		try {
			String hql = "from User as u where u.userEmail = :userEmail and u.userPassword = :userPassword";
			usr = (User) sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userEmail", user.getUserEmail()).
										 setParameter("userPassword", user.getUserPassword()).uniqueResult();	
		}
		catch(HibernateException ex) {
			logger.error(ex);
			throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return usr;
	}

	public boolean signupUser(User user) {
		boolean result = false;
		
		try {
			if(getUserDetailByEmail(user) == null) {	
				int userId = (Integer) sessionFactory.getCurrentSession().save(user);	
				
				if(userId >= 0)
					result = true;
			}
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

	public User getUserDetailByEmail(User user) {
		User usr = null;
		
		try {
			String hql = "from User as u where u.userEmail = :userEmail";
			usr = (User) sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userEmail", user.getUserEmail()).uniqueResult();	
		}
		catch(HibernateException ex) {
			logger.error(ex);
			//throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return usr;
	}

	public boolean saveUserInfo(User user) {
		boolean result = false;
		
		try {
			String hql = "update User as u set u.userName = :userName , " +
						 "u.userEmail = :userEmail , u.userMobile = :userMobile " +
						 "where u.userId = :userId";
			int rowUpdated = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("userName", user.getUserName()).
										 setParameter("userEmail", user.getUserEmail()).
										 setParameter("userMobile", user.getUserMobile()).
										 setParameter("userId", user.getUserId()).executeUpdate();
			if(rowUpdated > 0)
				result = true;
			
		}
		catch(HibernateException ex) {
			logger.error(ex);
			throw ex;
		}
		finally {
			sessionFactory.getCurrentSession().clear();
		}
		
		return result;
	}

	public boolean updateUserPassword(String oldPassword, User user) {
		boolean result = false;
		
		try {
			String hql = "update User as u set u.userPassword = :newPassword  " +
					 "where u.userId = :userId and u.userPassword = :oldPassword";
			int rowUpdated = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("newPassword", user.getUserPassword()).
										 setParameter("userId", user.getUserId()).
										 setParameter("oldPassword", oldPassword).executeUpdate();
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

	public boolean saveForgotPassword(User user) {
		boolean result = false;
		
		try {
			String hql = "update User as u set u.userPassword = :newPassword  " +
					 "where u.userEmail = :userEmail";
			int rowUpdated = sessionFactory.getCurrentSession().createQuery(hql).
										 setParameter("newPassword", user.getUserPassword()).
										 setParameter("userEmail", user.getUserEmail()).executeUpdate();
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
