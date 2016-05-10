package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.Wishlist;

public interface WishlistService {
	public boolean addProductToWishlist(Wishlist wishlist);
	
	public List<Wishlist> getUserWishlist(int userId);
	
	public boolean deleteProductFromWishlist(Wishlist wishlist);
}
