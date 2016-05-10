package com.mkonlinestore.service;

import com.mkonlinestore.model.User;

public interface UserService {
	public User loginUser(User user);
	
	public boolean signupUser(User user);
	
	public User getUserDetailByEmail(User user);
	
	public boolean saveUserInfo(User user);
	
	public boolean updateUserPassword(String oldPassword, User user);
	
	public boolean saveForgotPassword(User user);

}
