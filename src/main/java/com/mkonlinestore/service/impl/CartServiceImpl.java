package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.CartDao;
import com.mkonlinestore.dao.impl.CartDaoImpl;
import com.mkonlinestore.model.Cart;
import com.mkonlinestore.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	
	@Transactional
	public List<Cart> getCartProductList(int userId) {
		return cartDao.getCartProductList(userId);
	}

	@Transactional
	public boolean addProductToCart(Cart cart) {
		return cartDao.addProductToCart(cart);
	}

	@Transactional
	public boolean updateProductQunatityToCart(Cart cart) {
		return cartDao.updateProductQunatityToCart(cart);
	}

	@Transactional
	public boolean removeProductFromCart(Cart cart) {
		return cartDao.removeProductFromCart(cart);
	}

	@Transactional
	public Cart getCartProductDetails(Cart cart) {
		return cartDao.getCartProductDetails(cart);
	}

	@Transactional
	public boolean removeAllProductFromCart(int userId) {
		return cartDao.removeAllProductFromCart(userId);
	}

}
