package com.mkonlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
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
import org.springframework.web.servlet.ModelAndView;

import com.mkonlinestore.common.*;
import com.mkonlinestore.model.Cart;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.CartService;
import com.mkonlinestore.service.ProductService;
import com.mkonlinestore.common.Constants;

@Controller  
public class CartController {
	
	private Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired  
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	int category;
	String productCode = "";
	SessionManager ssn = new SessionManager();
	
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public @ResponseBody
    String addProductToCart(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String cartProductCode) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			Product product = new Product();
			Cart cart = new Cart();
			
			cartProductCode = cartProductCode.replace("\"", "");
			
			if(cartProductCode != null && cartProductCode.length() > 0) {
				product = productService.getProductDetails(cartProductCode);
			
				if(product != null) {
			
					// Check if user is logged in
					User user = ssn.checkUserSession(request);
				
					if(user != null) {
					
						// Save cart details in database
						cart.setUserId(user.getUserId());
						cart.setProductCode(product.getProductCode());
						cart.setProductQuantity(1);
					
						if(cartService.addProductToCart(cart))
							result =  Constants.ITEM_ADDED_TO_CART_SUCCESS;
						else
							result = Constants.ITEM_ADDED_TO_CART_ERROR;
					}
					else {
						// Save cart details in cookies
						if(ssn.addToCartSession(session, request, response, product))
							result =  Constants.ITEM_ADDED_TO_CART_SUCCESS;
						else
							result = Constants.ITEM_ADDED_TO_CART_ERROR;
					}
				}
				
			}
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	@RequestMapping(value = "/update-product-qty", method = RequestMethod.POST)
	public @ResponseBody
    String updateProductQunatity(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String cartProduct) {    
		String result = Constants.COMMON_ERROR;;
		try {
			Product product = new Product();
			Cart cart = new Cart();
			ParseDataTypes parseDataType = new ParseDataTypes();
			boolean productExistsInDB = false;
			
			cartProduct = cartProduct.replace("\"", "");
			String[] productInfo = cartProduct.split(Constants.DELEMETER, -1); 
			
			if(productInfo != null && productInfo.length > 0) {
				
				// Check if user is logged in
				User user = ssn.checkUserSession(request);
				
				if(user != null) {
					// Update cart product qty in database
					cart.setUserId(user.getUserId());
					cart.setProductCode(productInfo[0]);
					cart.setProductQuantity(parseDataType.parseInt(productInfo[1]));
					
					// Check product exists in cart database
					if(cartService.getCartProductDetails(cart) != null) {
						if(cartService.updateProductQunatityToCart(cart))
							result = Constants.UPDATET_PRODUCT_QTY_TO_CART_SUCCESS;
						else
							result = Constants.UPDATET_PRODUCT_QTY_TO_CART_ERROR;
						productExistsInDB = true;
					}
					
				}
			
				if(!productExistsInDB) {
					// Update cart product qty in cookies
					product.setProductCode(productInfo[0]);
					product.setProductQuantity(parseDataType.parseInt(productInfo[1]));
			
					if(ssn.updateProductQuantitySession(session, request, response, product))
						result = Constants.UPDATET_PRODUCT_QTY_TO_CART_SUCCESS;
					else
						result = Constants.UPDATET_PRODUCT_QTY_TO_CART_ERROR;
				}
			}
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
        return result;
	}
	
	@RequestMapping(value = "/view-cart", method = RequestMethod.GET)
	public ModelAndView viewCart(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		ModelAndView view = new ModelAndView("cart");
		try {
			User user = ssn.checkUserSession(request);
			List<Product> cartProductList = getCartProductList(session, request, response, user);
			
			if(cartProductList != null) {
				if(cartProductList.size() > 0)
					view.addObject("cartProductList", cartProductList);
				view.addObject("cartProductCount", cartProductList.size());
			}
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return view;
   		
	}
	
	@RequestMapping(value = "/remove-product", method = RequestMethod.POST)
    public @ResponseBody
    String removeProductFromCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String cartProductCode) {
 
		String result = Constants.COMMON_ERROR;
		try {
			Product product = new Product();
			Cart cart = new Cart();
			boolean productExistsInDB = false;
			
			cartProductCode = cartProductCode.replace("\"", "");
			
			if(cartProductCode != null && cartProductCode.length() > 0) {

				// Check if user is logged in
				User user = ssn.checkUserSession(request);
					
				if(user != null) {					
					// Remove product from cart in database
					cart.setUserId(user.getUserId());
					cart.setProductCode(cartProductCode);
											
					// Check product exists in cart database
					if(cartService.getCartProductDetails(cart) != null) {
						if(cartService.removeProductFromCart(cart))
							result = Constants.ITEM_REMOVED_FROM_CART_SUCCESS;
						else
							result = Constants.ITEM_REMOVED_FROM_CART_ERROR;
						productExistsInDB = true;
					}
				}
			}
			
			if(!productExistsInDB) {
				//Remove product from cart in cookies
				product.setProductCode(cartProductCode);
				if(ssn.removeCartProductSession(session, request, response, product))
					result = Constants.ITEM_REMOVED_FROM_CART_SUCCESS;
				else
					result = Constants.ITEM_REMOVED_FROM_CART_ERROR;
			}
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
        return result;
    }
	
	public List<Product> getCartProductList(HttpSession session, HttpServletRequest request, HttpServletResponse response, User user) {
		
		List<Cart> cartProductListDB = new ArrayList<Cart>(); 
		List<Product> cartProductListCK = new ArrayList<Product>(); 
		List<Product> cartProductList = new ArrayList<Product>(); 
		Cart cart = new Cart();
				
		// Check if user is logged in
		if(user != null) {
			cart.setUserId(user.getUserId());
			cartProductListDB = cartService.getCartProductList(cart);
		}
				
		cartProductListCK = ssn.getCartSession(session, request, response);
					
		// Get cart product from DB
		if(cartProductListDB != null && cartProductListDB.size() > 0) {
			for(Cart cartInfo : cartProductListDB) {
				Product roduct = new Product();
				roduct = productService.getProductDetails(cartInfo.getProductCode());
				roduct.setProductQuantity(cartInfo.getProductQuantity());
				cartProductList.add(roduct);
			}
		}
					
		// Get cart product from cookies
		if(cartProductListCK != null && cartProductListCK.size() > 0) {
			for(Product product : cartProductListCK) {
				if(!productExistsToCart(cartProductList, session, request, response, product)) // Avoid cookies product which are already in DB
						cartProductList.add(product);
			}
				
		}
	
		return cartProductList;
	}
	
	public boolean productExistsToCart(List<Product> productList, HttpSession session, HttpServletRequest request, HttpServletResponse response, Product product) {
		boolean result = false;
		
		for(Product cartProduct : productList) {
			if(cartProduct.getProductCode().equalsIgnoreCase(product.getProductCode())) {
				ssn.removeCartProductSession(session, request, response, cartProduct);
				result = true;
				break;
			}
		}
		return result;
	}	
}
