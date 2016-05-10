package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.Wishlist;

public interface WishlistDao {
	public boolean addProductToWishlist(Wishlist wishlist);
	
	public List<Wishlist> getUserWishlist(int userId);
	
	public boolean deleteProductFromWishlist(Wishlist wishlist);
	
}
