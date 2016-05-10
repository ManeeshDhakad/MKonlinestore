package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Product;

public interface ProductService {
	public List<Product> getProductList(int category);
	
	public Product getProductDetails(String productCode);
	
}
