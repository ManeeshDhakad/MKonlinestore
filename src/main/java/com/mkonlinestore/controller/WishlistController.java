package com.mkonlinestore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mkonlinestore.common.*;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;
import com.mkonlinestore.model.Wishlist;
import com.mkonlinestore.service.ProductService;
import com.mkonlinestore.service.WishlistService;
import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.impl.WishlistDaoImpl;

@Controller  
public class WishlistController {
	private Logger logger = Logger.getLogger(WishlistController.class);
	
	@Autowired  
	private WishlistService wishlistService;
	
	@Autowired
	private ProductService productService;
	
	SessionManager ssn = new SessionManager();
	ParseDataTypes parser = new ParseDataTypes();
	int category;
	
	@RequestMapping(value = "/add-to-wishlist", method = RequestMethod.POST)
	public @ResponseBody
    String addToWishlist(HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String productCode) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);

			if(user != null) {
				productCode = productCode.replace("\"", "");
				Wishlist wishlist = new Wishlist();
				
				wishlist.setProductCode(productCode);
				wishlist.setUserId(user.getUserId());
				
				if(wishlistService.addProductToWishlist(wishlist)) {	
					result = Constants.PRODUCT_ADDED_TO_WISHLIST_SUCCESS;
				}
				else
					result = Constants.PRODUCT_ADDED_TO_WISHLIST_ERROR;
			}
			else
				result = Constants.LOGIN_REQUIRED;
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		return result;
	}
	
	@RequestMapping(value = "/delete-from-wishlist", method = RequestMethod.POST)
	public @ResponseBody
    String deleteFromWishlist(HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String productCode) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);

			if(user != null) {
				productCode = productCode.replace("\"", "");
				Wishlist wishlist = new Wishlist();
				
				wishlist.setProductCode(productCode);
				wishlist.setUserId(user.getUserId());
				
				if(wishlistService.deleteProductFromWishlist(wishlist)) {	
					result = Constants.PRODUCT_DELETED_FROM_WISHLIST_SUCCESS;
				}
				else
					result = Constants.PRODUCT_DELETED_FROM_WISHLIST_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	public List<Product> getWishlistProducts(HttpServletRequest request) {
		List<Product> wishlistProductList = new ArrayList<Product>();
		User user = ssn.checkUserSession(request);
		if(user != null) {
			List<Wishlist> wishlist = wishlistService.getUserWishlist(user.getUserId());
			if(wishlist != null && wishlist.size() > 0) {
				for(Wishlist w: wishlist) {
					Product product = new Product();
					product = productService.getProductDetails(w.getProductCode());
					wishlistProductList.add(product);
				}
			}
				
		}
		return wishlistProductList;
	}

}
