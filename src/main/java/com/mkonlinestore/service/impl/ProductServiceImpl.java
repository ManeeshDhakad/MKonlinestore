package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.ProductDao;
import com.mkonlinestore.dao.impl.ProductDaoImpl;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired  
	private ProductDao productDao; 
	
	@Transactional
	public List<Product> getProductList(int category) {
		return productDao.getProductList(category);
	}

	@Transactional
	public Product getProductDetails(String productCode) {
		return productDao.getProductDetails(productCode);
	}

}
