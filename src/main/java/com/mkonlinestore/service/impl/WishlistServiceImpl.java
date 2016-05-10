package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.WishlistDao;
import com.mkonlinestore.dao.impl.UserDaoImpl;
import com.mkonlinestore.dao.impl.WishlistDaoImpl;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.Wishlist;
import com.mkonlinestore.service.WishlistService;

@Service
public class WishlistServiceImpl implements WishlistService{
	@Autowired
	private WishlistDao wishlistDao;
	
	@Transactional
	public boolean addProductToWishlist(Wishlist wishlist) {
		return wishlistDao.addProductToWishlist(wishlist);
	}

	@Transactional
	public List<Wishlist> getUserWishlist(int userId) {
		return wishlistDao.getUserWishlist(userId);
	}

	@Transactional
	public boolean deleteProductFromWishlist(Wishlist wishlist) {
		return wishlistDao.deleteProductFromWishlist(wishlist);
	}

}
