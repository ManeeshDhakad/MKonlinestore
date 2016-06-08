package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Cart;
import com.mkonlinestore.model.Product;

public interface CartDao {
	
	public Cart getCartProductDetails(Cart cart);
	
	public List<Cart> getCartProductList(int userId);
	
	public boolean addProductToCart(Cart cart);
	
	public boolean updateProductQunatityToCart(Cart cart);
	
	public boolean removeProductFromCart(Cart cart);
	
	public boolean removeAllProductFromCart(int userId);
	
}
