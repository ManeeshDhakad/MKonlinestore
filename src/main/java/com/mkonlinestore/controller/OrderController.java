package com.mkonlinestore.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

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

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.common.ParseDataTypes;
import com.mkonlinestore.common.SessionManager;
import com.mkonlinestore.model.Address;
import com.mkonlinestore.model.Cart;
import com.mkonlinestore.model.Order;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.AddressService;
import com.mkonlinestore.service.CartService;
import com.mkonlinestore.service.OrderService;
import com.mkonlinestore.service.ProductService;

@Controller  
public class OrderController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	CartController cartCotroller;
	
	@Autowired
	private CartService cartService;
	
	private Logger logger = Logger.getLogger(OrderController.class);
	SessionManager ssn = new SessionManager();
	int category;
	ParseDataTypes parser = new ParseDataTypes();
			
				
	@RequestMapping("/checkout")
	public ModelAndView checkoutPage(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("checkout");
		try {
						
			// Get cart products count
			User user = ssn.checkUserSession(request);
			if(user != null) {
				view.addObject("user", user);
				
				String productCode = request.getParameter("productCode"); 
				List<Product> productList = new ArrayList<Product>();
				
				List<Product> cartProductList =  new ArrayList<Product>(); 
							
				// Place order from cart
				if(productCode.equalsIgnoreCase("cart")) {
					cartProductList = cartCotroller.getCartProductList(session, request, response, user);
					if(cartProductList != null && cartProductList.size() > 0) 
							productList.addAll(cartProductList);
				}
				else {
					// Place order from product detail page
					Product product = new Product(); 
					product = productService.getProductDetails(productCode);
					product.setProductQuantity(1);
					
					ssn.addCheckoutProductSession(session, request, product);
					if(product != null)
						productList.add(product);
				}
					
				if(productList != null && productList.size() > 0)
					view.addObject("productList", productList);
				
				
				
				List<Address> addressList = addressService.getAddreesList(user.getUserId());
				if(addressList != null && addressList.size() > 0) {
					view.addObject("addressList", addressList);
				}
			}
			else {
				view.setViewName("redirect:/home");
				view.addObject("messageStatus", Constants.MESSAGE_ERROR);
				view.addObject("message", Constants.SESSION_EXPIRED);
			}			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return view;
	}
	
	
	@RequestMapping(value = "/checkout-update-product-qty", method = RequestMethod.POST)  
	public @ResponseBody
    String checkoutUpdateProductQunatity(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String cartProduct) {    
		String result = Constants.COMMON_ERROR;;
		try {
			Product product = new Product();
			Cart cart = new Cart();
			ParseDataTypes parseDataType = new ParseDataTypes();
			boolean productExistsInDB = false;
			
			cartProduct = cartProduct.replace("\"", "");
			String[] productInfo = cartProduct.split(Constants.DELEMETER, -1); 
			String type = productInfo[0];
			String productCode = productInfo[1];
			int qty = parseDataType.parseInt(productInfo[2]);
			
			if(productInfo != null && productInfo.length > 0) {
				
				// Place order from cart
				if(type.equalsIgnoreCase("cart")) {
					// Check if user is logged in
					User user = ssn.checkUserSession(request);
					
					if(user != null) {
						// Update cart product qty in database
						cart.setUserId(user.getUserId());
						cart.setProductCode(productCode);
						cart.setProductQuantity(qty);
						
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
						product.setProductCode(productCode);
						product.setProductQuantity(qty);
				
						if(ssn.updateProductQuantitySession(session, request, response, product))
							result = Constants.UPDATET_PRODUCT_QTY_TO_CART_SUCCESS;
						else
							result = Constants.UPDATET_PRODUCT_QTY_TO_CART_ERROR;
					}
						
				}
				else
				{
					// Place order from product detail page
					// Update product on checkout page
					product = productService.getProductDetails(productCode);
					if(product != null) {
						product.setProductQuantity(qty);
						ssn.addCheckoutProductSession(session, request, product);
						return Constants.UPDATET_PRODUCT_QTY_TO_CART_SUCCESS;
					}
					
				}
					
			}
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
        return result;
	}
	
	@RequestMapping(value = "/checkout-remove-product", method = RequestMethod.POST)
    public @ResponseBody
    String checkoutRemoveProductFromCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String cartProduct) {
 
		String result = Constants.COMMON_ERROR;
		try {
			Product product = new Product();
			Cart cart = new Cart();
			boolean productExistsInDB = false;
			
			cartProduct = cartProduct.replace("\"", "");
			String[] productInfo = cartProduct.split(Constants.DELEMETER, -1); 
			String type = productInfo[0];
			String productCode = productInfo[1];
			
			if(cartProduct != null && cartProduct.length() > 0) {

				// Place order from cart
				if(type.equalsIgnoreCase("cart")) {
					// Check if user is logged in
					User user = ssn.checkUserSession(request);
					
					if(user != null) {
					
						// Remove product from cart in database
						cart.setUserId(user.getUserId());
						cart.setProductCode(productCode);
												
						// Check product exists in cart database
						if(cartService.getCartProductDetails(cart) != null) {
							if(cartService.removeProductFromCart(cart))
								result = Constants.ITEM_REMOVED_FROM_CART_SUCCESS;
							else
								result = Constants.ITEM_REMOVED_FROM_CART_ERROR;
							productExistsInDB = true;
						}
						
					}
					
					if(!productExistsInDB) {
						//Remove product from cart in cookies
						product.setProductCode(productCode);
						if(ssn.removeCartProductSession(session, request, response, product))
							result = Constants.ITEM_REMOVED_FROM_CART_SUCCESS;
						else
							result = Constants.ITEM_REMOVED_FROM_CART_ERROR;
					}
					
					
				}
				else {
					// Remove product at checkout time stored in session for buy now option 
					product = ssn.checkCheckoutProductSession(session, request, response);
					if(product != null) {
						ssn.removeCheckoutSession(session, request);
						return Constants.ITEM_REMOVED_FROM_CART_SUCCESS;
					}
				}
			}
			
			
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
        return result;
    }
	
	
	@RequestMapping(value = "/order")
	public ModelAndView orderCompletion(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("order-completion");
		try {
						
			// Get cart products count
			User user = ssn.checkUserSession(request);
			if(user != null) {
				view.addObject("user", user);
				
				List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
				
				List<Product> orderProductList = new ArrayList<Product>();
				List<Order> orderList = new ArrayList<Order>();
								
				String addressId = ssn.checkCheckoutAddressSession(session, request, response);
				
				// Generate unique id
				String uniqueID = UUID.randomUUID().toString();
				String orderCode = "MK-" + uniqueID;
				String orderStatus = "In Process";
				
				String productCode = request.getParameter("productCode"); 
				if(productCode.equalsIgnoreCase("cart")) {
					// Order from cart
					for(Product product : cartProductList) {
						Order order = new Order();			
						order.setUserId(user.getUserId());
						order.setAddressId(parser.parseInt(addressId));
						order.setProductCode(product.getProductCode());
						order.setProductName(product.getProductName());
						order.setProductPrice(product.getProductPrice());
						order.setProductQuantity(product.getProductQuantity());
						order.setOrderCode(orderCode);
						order.setOrderCode(orderCode);
						order.setOrderStatus(orderStatus);						
						orderList.add(order);
					}
					
					if(orderService.saveOrder(orderList)) {
						
					}
					view.addObject("message", Constants.ORDER_SUCCESS);
					view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
				}
				else {
					// Order from product detail page by clicking buy now
					Product productSSN = ssn.checkCheckoutProductSession(session, request, response);
					if(productSSN != null) {
						Order order = new Order();
						order.setUserId(user.getUserId());
						order.setAddressId(parser.parseInt(addressId));
						order.setProductCode(productSSN.getProductCode());
						order.setProductName(productSSN.getProductName());
						order.setProductPrice(productSSN.getProductPrice());
						order.setProductQuantity(productSSN.getProductQuantity());
						order.setOrderCode(orderCode);
						order.setOrderCode(orderCode);
						order.setOrderStatus(orderStatus);						
						orderList.add(order);
					}
				}
				
				if(orderService.saveOrder(orderList)) {
					if(productCode.equalsIgnoreCase("cart"))
						ssn.removeCartSession(session, request, response);
					else
						ssn.removeCheckoutSession(session, request);
					
					view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
					view.addObject("message", Constants.ORDER_SUCCESS);
				}
				else {
					view.addObject("messageStatus", Constants.MESSAGE_ERROR);
					view.addObject("message", Constants.ORDER_ERROR);
				}
				
				
				cartProductList = cartCotroller.getCartProductList(session, request, response, user);
				if(cartProductList != null) {
					view.addObject("cartProductCount", cartProductList.size());
				}
					
								
				if(orderList != null && orderList.size() > 0) {
					view.addObject("orderList", orderList);
				}
				
			}
			else {
				view.setViewName("redirect:/home");
				view.addObject("messageStatus", Constants.MESSAGE_ERROR);
				view.addObject("message", Constants.SESSION_EXPIRED);
			}			
		}
		catch(Exception ex) {
			logger.error(ex);
			view.addObject("messageStatus", Constants.MESSAGE_ERROR);
			view.addObject("message", Constants.COMMON_ERROR);
		}
		
		return view;
	}
	
}
