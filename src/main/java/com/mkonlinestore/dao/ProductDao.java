package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Product;

public interface ProductDao {
	public List<Product> getProductList(int category);
	
	public Product getProductDetails(String productCode);
}
