package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Cart;

public interface CartService {
	public Cart getCartProductDetails(Cart cart);
	
	public List<Cart> getCartProductList(Cart cart);
	
	public boolean addProductToCart(Cart cart);
	
	public boolean updateProductQunatityToCart(Cart cart);
	
	public boolean removeProductFromCart(Cart cart);
	
	public boolean removeAllProductFromCart(Cart cart);
}
