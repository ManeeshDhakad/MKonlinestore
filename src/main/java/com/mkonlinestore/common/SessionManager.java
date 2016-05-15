package com.mkonlinestore.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mkonlinestore.model.Address;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;

public class SessionManager {
	
	ParseDataTypes parseDataType = new ParseDataTypes();
	// Set session and cookies for user
	public boolean addUserSession(HttpSession session, HttpServletRequest request, HttpServletResponse response, User user) {
		removeUserSession(session, request, response);
		
		String userId = "" + user.getUserId();
		Cookie chUserId = new Cookie("userId", userId);
		Cookie chUserName = new Cookie("userName", user.getUserName());
		Cookie chUserEmail = new Cookie("userEmail", user.getUserEmail());
		Cookie chUserPassword = new Cookie("userPassword", user.getUserPassword());
		
		chUserId.setMaxAge(3600);
		chUserName.setMaxAge(3600);
		chUserEmail.setMaxAge(3600);
		chUserPassword.setMaxAge(3600);
		
		response.addCookie(chUserId);
		response.addCookie(chUserName);
		response.addCookie(chUserEmail);
		response.addCookie(chUserPassword);
		
		return true;
	}
	
	// Set session and cookies for user
	public boolean addToCartSession(HttpSession session, HttpServletRequest request, HttpServletResponse response, Product product) {
		
		Cookie[] cookies = request.getCookies();
		String productCode = "", productName = "", productPrice = "", productQuantity = "";
		boolean cartEmpty = true;
		for(Cookie ck : cookies) {
			
			if(ck.getName().equalsIgnoreCase("cartProductCode")) {
				productCode = ck.getValue() + Constants.DELEMETER + product.getProductCode();
				
				ck.setMaxAge(0);
				response.addCookie(ck); 
		
				Cookie chCartProductCode = new Cookie("cartProductCode", productCode);
				chCartProductCode.setMaxAge(3600);
				response.addCookie(chCartProductCode);
						
				cartEmpty = false;		
			}
			
			
			if(ck.getName().equalsIgnoreCase("cartProductName")) {
				productName = ck.getValue() + Constants.DELEMETER + product.getProductName();
		
				ck.setMaxAge(0);
				response.addCookie(ck); 
	
				Cookie chCartProductName = new Cookie("cartProductName", productName);
				chCartProductName.setMaxAge(3600);
				response.addCookie(chCartProductName);				
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductPrice")) {
				productPrice = ck.getValue() + Constants.DELEMETER + product.getProductPrice();
			
				ck.setMaxAge(0);
				response.addCookie(ck); 
				
				Cookie chCartProductPrice = new Cookie("cartProductPrice", productPrice);
				chCartProductPrice.setMaxAge(3600);
				response.addCookie(chCartProductPrice);
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductQuantity")) {
				productQuantity = ck.getValue() + Constants.DELEMETER + "1";
			
				ck.setMaxAge(0);
				response.addCookie(ck); 
				
				Cookie chCartProductQuantity = new Cookie("cartProductQuantity", productQuantity);
				chCartProductQuantity.setMaxAge(3600);
				response.addCookie(chCartProductQuantity);
			}
			
		}
		
		if(cartEmpty) {
			productCode = product.getProductCode();
			Cookie chCartProductCode = new Cookie("cartProductCode", productCode);
			chCartProductCode.setMaxAge(3600);
			response.addCookie(chCartProductCode);
		
			productName = product.getProductName();
			Cookie chCartProductName = new Cookie("cartProductName", productName);
			chCartProductName.setMaxAge(3600);
			response.addCookie(chCartProductName);
		
		
			productPrice = "" + product.getProductPrice();
			Cookie chCartProductPrice = new Cookie("cartProductPrice", productPrice);
			chCartProductPrice.setMaxAge(3600);
			response.addCookie(chCartProductPrice);
			
			productQuantity = "1";
			Cookie chCartProductQuanity = new Cookie("cartProductQuantity", productQuantity);
			chCartProductQuanity.setMaxAge(3600);
			response.addCookie(chCartProductQuanity);
		
		}
		
		
		return true;
	}
	
	// Set session and cookies for user
	public boolean updateProductQuantitySession(HttpSession session, HttpServletRequest request, HttpServletResponse response, Product product) {
			
		Cookie[] cookies = request.getCookies();
		String productQuantity = "";
		boolean productExists = false;
		int productExistsIndex = 0;
			
		String[] productCodeList = null;
		String[] productQuantityList = null;
			
		for(Cookie ck : cookies) {
				
			if(ck.getName().equalsIgnoreCase("cartProductCode")) {
				productExists = false;
				// Check product exists
				productCodeList = ck.getValue().split(Constants.DELEMETER, -1); 
				if(productCodeList != null && productCodeList.length > 0) {
					for(int i = 0 ; i < productCodeList.length; i++) {
						if(productCodeList[i].equalsIgnoreCase(product.getProductCode())) {
							productExistsIndex = i;
							productExists = true;
							break;
						}
					}
				}
			}
				
			if(ck.getName().equalsIgnoreCase("cartProductQuantity")) {
				if(productExists) {
					productQuantityList = ck.getValue().split(Constants.DELEMETER, -1); 
					parseDataType.parseInt(productQuantityList[productExistsIndex].toString());
					productQuantityList[productExistsIndex] = "" + product.getProductQuantity() + "";
					productQuantity = String.join(Constants.DELEMETER, productQuantityList);
				
					ck.setMaxAge(0);
					response.addCookie(ck); 
				
					Cookie chCartProductQuantity = new Cookie("cartProductQuantity", productQuantity);
					chCartProductQuantity.setMaxAge(3600);
					response.addCookie(chCartProductQuantity);
				}
			}
			
		}
		
		return true;
	}
	
	// Set session and cookies for user
	public List<Product> getCartSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
		List<Product> cartProductList = new ArrayList<Product>();
		String[] productCodeList = null;
		String[] productNameList = null;
		String[] productPriceList = null;
		String[] productQuantityList = null;
		
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equalsIgnoreCase("cartProductCode")) {
				productCodeList = ck.getValue().split(Constants.DELEMETER, -1); 
			}
		
			if(ck.getName().equalsIgnoreCase("cartProductName")) {
				productNameList = ck.getValue().split(Constants.DELEMETER, -1); 
			}
		
			if(ck.getName().equalsIgnoreCase("cartProductPrice")) {
				productPriceList = ck.getValue().split(Constants.DELEMETER, -1); 
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductQuantity")) {
				productQuantityList = ck.getValue().split(Constants.DELEMETER, -1); 
			}
		}
		
		if(productCodeList != null && productCodeList.length > 0) {
			for(int i = 0; i < productCodeList.length ; i++) {
				if(productCodeList[i] != null && productCodeList[i].length() > 0) {
					Product cartProduct = new Product();
					cartProduct.setProductCode(productCodeList[i]);
					cartProduct.setProductName(productNameList[i]);
					cartProduct.setProductPrice(parseDataType.parseDouble(productPriceList[i]));
					cartProduct.setProductQuantity(parseDataType.parseInt(productQuantityList[i]));
					cartProductList.add(cartProduct);
				}
			}
		}
	
		return cartProductList;
	}
	
	// Remove all cart cookies
	public boolean removeCartProductSession(HttpSession session, HttpServletRequest request, HttpServletResponse response, Product product) {
				
		String[] productCodeList = null;
		String[] productNameList = null;
		String[] productPriceList = null;
		String[] productQuantityList = null;
		
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equalsIgnoreCase("cartProductCode")) {
				productCodeList = ck.getValue().split(Constants.DELEMETER, -1); 
				ck.setMaxAge(0);
				response.addCookie(ck); 
			}
		
			if(ck.getName().equalsIgnoreCase("cartProductName")) {
				productNameList = ck.getValue().split(Constants.DELEMETER, -1); 
				ck.setMaxAge(0);
				response.addCookie(ck); 
			}
		
			if(ck.getName().equalsIgnoreCase("cartProductPrice")) {
				productPriceList = ck.getValue().split(Constants.DELEMETER, -1); 
				ck.setMaxAge(0);
				response.addCookie(ck); 
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductQuantity")) {
				productQuantityList = ck.getValue().split(Constants.DELEMETER, -1); 
				ck.setMaxAge(0);
				response.addCookie(ck); 
			}
		}
		
		int index = 0;
		String productCode = "", productName = "" , productPrice = "", productQuantity = "";
		
		if(productCodeList != null && productCodeList.length > 0) {
			for(int i = 0; i < productCodeList.length; i++) {
				if(productCodeList[i].equals(product.getProductCode())) {
					index = i;
					break;
				}
			}
		}
		
	
		if(productCodeList != null && productCodeList.length > 0) {
			for(int i = 0; i < productCodeList.length; i++) {
				if(i != index) {
					if(productCodeList[i] != null && productCodeList[i].length() > 0) {
						productCode = productCode + Constants.DELEMETER + productCodeList[i];
						productName = productName + Constants.DELEMETER + productNameList[i];
						productPrice = productPrice + Constants.DELEMETER + productPriceList[i] ;
						productQuantity = productQuantity + Constants.DELEMETER + productQuantityList[i];
					}
				}
				
			}
		}
		
		if(!productCode.equalsIgnoreCase("")) {
			Cookie chCartProductCode = new Cookie("cartProductCode", productCode);
			chCartProductCode.setMaxAge(3600);
			response.addCookie(chCartProductCode);
		
			Cookie chCartProductName = new Cookie("cartProductName", productName);
			chCartProductName.setMaxAge(3600);
			response.addCookie(chCartProductName);
		
			Cookie chCartProductPrice = new Cookie("cartProductPrice", productPrice);
			chCartProductPrice.setMaxAge(3600);
			response.addCookie(chCartProductPrice);
			
			Cookie chCartProductQuanity = new Cookie("cartProductQuantity", productQuantity);
			chCartProductQuanity.setMaxAge(3600);
			response.addCookie(chCartProductQuanity);
		}
		
		return true;
				
	}
	
	// Remove all cart cookies
	public void removeCartSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
				
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equalsIgnoreCase("cartProductCode")) {
				ck.setMaxAge(0);
				response.addCookie(ck); 
			}
		
			if(ck.getName().equalsIgnoreCase("cartProductName")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductPrice")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			if(ck.getName().equalsIgnoreCase("cartProductQuantity")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}
			
	}
		
	
	// Check cookies for user informations
	public User checkUserSession(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		User user = null;
		String userId = "" ,userName = "", userEmail = "", userPassword = "";
		
		for(Cookie ck : cookies) {
			if(ck.getName().equalsIgnoreCase("userId"))
				userId = ck.getValue();
			if(ck.getName().equalsIgnoreCase("userName"))
				userName = ck.getValue();
			if(ck.getName().equalsIgnoreCase("userEmail"))
				userEmail = ck.getValue();
			if(ck.getName().equalsIgnoreCase("userPassword"))
				userPassword = ck.getValue();
		}
		
		if(userId.isEmpty()) {
			user = new User(parseDataType.parseInt(userId), userName, userEmail, userPassword);
		}
	
		return user;
	}
	
	// Remove all session and cookies
	public boolean removeUserSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
				
		for (Cookie ck : request.getCookies()) {
			if (ck.getName().equalsIgnoreCase("userId")) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			if (ck.getName().equalsIgnoreCase("userName")) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			if (ck.getName().equalsIgnoreCase("userEmail")) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			if (ck.getName().equalsIgnoreCase("userPassword")) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}
		return true;
	}
	
	public boolean addCheckoutProductSession(HttpSession session, HttpServletRequest request, Product product) {
		session = request.getSession(true);
		
		String qty = "" + product.getProductQuantity();
		String price = "" + product.getProductPrice();
		session.setAttribute("checkoutProductCode", product.getProductCode()); 
		session.setAttribute("checkoutProductName", product.getProductName());
		session.setAttribute("checkoutProductDescription", product.getProductDescription()); 
		session.setAttribute("checkoutProductPrice", price);
		session.setAttribute("checkoutProductQuantity", qty); 
		return true;
	}
	
	public boolean addCheckoutAddressSession(HttpSession session, HttpServletRequest request, int addressId) {
		session = request.getSession(true);
		
		String addrId = "" + addressId;
		session.setAttribute("checkoutAddressId", addrId); 
		return true;
	}
	
	public boolean removeCheckoutSession(HttpSession session, HttpServletRequest request) {
		session = request.getSession(false);
		if (session != null) {
		    session.invalidate();
		}
		return true;
	}
	
	public Product checkCheckoutProductSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession(true);
		Product product = null; 
		String productCode = "", productName = "", productDescription = "", productPrice = "", productQuantity = "";
		
		if (session.getAttribute("checkoutProductCode") != null) {
			productCode = (String)session.getAttribute("checkoutProductCode");
		}
		
		if(session.getAttribute("checkoutProductName") != null) {
			productName = (String)session.getAttribute("checkoutProductName");
		} 
		
		if(session.getAttribute("checkoutProductDescription") != null) {
			productDescription = (String)session.getAttribute("checkoutProductDescription");
		}
		
		if(session.getAttribute("checkoutProductPrice") != null) {
			productPrice = (String)session.getAttribute("checkoutProductPrice");
		}
		
		if(session.getAttribute("checkoutProductQuantity") != null) {
			productQuantity = (String)session.getAttribute("checkoutProductQuantity");
		}
		
		if(!productCode.isEmpty())
			product = new Product(productCode, productName, productDescription, parseDataType.parseDouble(productPrice), parseDataType.parseInt(productQuantity));
		return product;
	}
	
	public String checkCheckoutAddressSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession(true);
		
		String addressId = "";
		
		if (session.getAttribute("checkoutAddressId") != null) {
			addressId = (String)session.getAttribute("checkoutAddressId");
		} 
		
		return addressId;
	}

}
