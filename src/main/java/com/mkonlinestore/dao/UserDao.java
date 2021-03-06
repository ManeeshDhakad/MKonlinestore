package com.mkonlinestore.dao;

import com.mkonlinestore.model.Address;
import com.mkonlinestore.model.User;

public interface UserDao {
	
	public User loginUser(User user);
	
	public boolean signupUser(User user);
	
	public User getUserDetailByEmail(User user);
	
	public boolean saveUserInfo(User user);
	
	public boolean updateUserPassword(String oldPassword, User user);
	
	public boolean saveForgotPassword(User user);
	
}
