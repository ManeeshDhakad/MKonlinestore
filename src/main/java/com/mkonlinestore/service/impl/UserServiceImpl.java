package com.mkonlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.UserDao;
import com.mkonlinestore.dao.impl.UserDaoImpl;
import com.mkonlinestore.model.Address;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired  
	private UserDao userDao; 
		
	@Transactional
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	@Transactional
	public boolean signupUser(User user) {
		return userDao.signupUser(user);
	}

	@Transactional
	public User getUserDetailByEmail(User user) {
		return userDao.getUserDetailByEmail(user);
	}

	@Transactional
	public boolean saveUserInfo(User user) {
		return userDao.saveUserInfo(user);
	}

	@Transactional
	public boolean updateUserPassword(String oldPassword, User user) {
		return userDao.updateUserPassword(oldPassword, user);
	}

	@Transactional
	public boolean saveForgotPassword(User user) {
		return userDao.saveForgotPassword(user);
	}

}
