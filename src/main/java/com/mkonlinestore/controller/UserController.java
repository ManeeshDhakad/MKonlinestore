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
import org.springframework.web.servlet.ModelAndView;

import com.mkonlinestore.common.*;
import com.mkonlinestore.model.Address;
import com.mkonlinestore.model.Order;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.AddressService;
import com.mkonlinestore.service.OrderService;
import com.mkonlinestore.service.ProductService;
import com.mkonlinestore.service.UserService;
import com.mkonlinestore.common.Constants;

@Controller  
public class UserController {
	private Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired  
	private UserService userService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	HomeController homeController;
	
	@Autowired
	CartController cartCotroller;
	
	@Autowired
	WishlistController wishlistController;
	
	SessionManager ssn = new SessionManager();
	ParseDataTypes parser = new ParseDataTypes();
	int category;
	
	@RequestMapping(value = "/login-user", method = RequestMethod.POST)
	public @ResponseBody    
	String loginUser(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String userInfo) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			// Extract user information
			User user = new User();
			userInfo = userInfo.replace("\"", "");
			String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
			user.setUserEmail(userDetail[0].toLowerCase());
			user.setUserPassword(userDetail[1]);
				
			// Login user
			user = userService.loginUser(user);
			if(user != null) {
				if(ssn.addUserSession(session, request, response, user)) 
					result = Constants.LOGIN_SUCCESS;
				else
					result = Constants.LOGIN_FAIL_CK;
			}
			else
				result = Constants.LOGIN_FAIL;
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
	}
	
	@RequestMapping(value = "/signup-user", method = RequestMethod.POST)
	public @ResponseBody    
	String signupUser(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String userInfo) {
		String result = Constants.COMMON_ERROR;
		
		try {
			// Extract user information
			userInfo = userInfo.replace("\"", "");
			String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
			User user = new User();
			user.setUserName(userDetail[0]);
			user.setUserEmail(userDetail[1].toLowerCase());
			user.setUserPassword(userDetail[2]);
				
			System.out.println("\n\n sign up \n\n");
			// Signup user
			if(userService.signupUser(user)) 
				result = Constants.SIGNUP_SUCCESS;
			else
				result = Constants.USER_EXISTS;			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("logout");
		try {
			
			if(ssn.removeUserSession(session, request, response)) {
				view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
				view.addObject("message", Constants.LOGOUT_SUCCESS);
				view.addObject("loginUserSesson", "logout");
			}
			else {
				view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
				view.addObject("message", Constants.LOGOUT_FAIL);
			}
			
			//Get home page details
			view = homeController.getHomePageCommonDetails(session, request, response, view);
			
			// Get cart products count
			User user = ssn.checkUserSession(request);
			List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
			int cartProductCount = 0;
			if(cartProductList != null)
				cartProductCount = cartProductList.size();
							
			view.addObject("cartProductCount", cartProductCount);
			
		}
		catch(Exception ex) {
			logger.error(ex);
		}
		
		return view;		
	}
	
	@RequestMapping(value = "/user-profile", method = RequestMethod.GET)
	public ModelAndView userProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("user-profile");
		try {
			
						
			User user = ssn.checkUserSession(request);
			if(user != null) {
				user = userService.getUserDetailByEmail(user);
				view.addObject("user", user);
				
				String profileType = request.getParameter("type"); 
				view.addObject("profileType", parser.parseInt(profileType));
				
				// Get cart products count
				List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
				int cartProductCount = 0;
				if(cartProductList != null) {
					cartProductCount = cartProductList.size();
					if(cartProductList.size() > 0)
						view.addObject("cartProductList", cartProductList);
				}
									
				view.addObject("cartProductCount", cartProductCount);
				
				List<Address> addressList = addressService.getAddreesList(user.getUserId());
				if(addressList != null && addressList.size() > 0) {
					view.addObject("addressList", addressList);
				}
				
				// Get wishlist
				List<Product> wishlistProductList = wishlistController.getWishlistProducts(request);
				if(wishlistProductList != null && wishlistProductList.size() > 0) {
					view.addObject("wishlistProductList", wishlistProductList);
				}
		
				// Get order history
				List<Order> orderList = orderService.getOrderList(user.getUserId());
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
			
		}
		
		return view;
	}
	
	@RequestMapping(value = "/save-personal-info", method = RequestMethod.POST)
	public @ResponseBody
    String saveUsersPersonalInfo(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String userInfo) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);
			if(user != null) {
				userInfo = userInfo.replace("\"", "");
				String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
				user.setUserName(userDetail[0]);
				user.setUserEmail(userDetail[1]);
				user.setUserMobile(userDetail[2]);
				
				if(userService.saveUserInfo(user)) {
					ssn.addUserSession(session, request, response, user);	
					result = Constants.USER_PERSIONAL_INFO_UPDATE_SUCCESS;
				}
				else
					result = Constants.USER_PERSIONAL_INFO_UPDATE_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	@RequestMapping(value = "/update-user-password", method = RequestMethod.POST)
	public @ResponseBody
    String updateUserPassword(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String password) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);
			if(user != null) {
				password = password.replace("\"", "");
				String[] userDetail = password.split(Constants.DELEMETER, -1);
				
				String oldPassword = userDetail[0]; 
				user.setUserPassword(userDetail[1]);
				
				if(userService.updateUserPassword(oldPassword, user)) {	
					result = Constants.USER_PASSWORD_UPDATE_SUCCESS;
				}
				else
					result = Constants.USER_PASSWORD_UPDATE_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	@RequestMapping(value = "/add-user-address", method = RequestMethod.POST)
	public @ResponseBody
    String addUserAddress(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String addressInfo) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);
			Address address = new Address();
			if(user != null) {
				addressInfo = addressInfo.replace("\"", "");
				String[] userDetail = addressInfo.split(Constants.DELEMETER, -1);
				
				address.setUserId(user.getUserId());
				address.setAddressName(userDetail[0]);
				address.setAddressStreet(userDetail[1]);
				address.setAddressLandmark(userDetail[2]);
				address.setAddressCity(userDetail[3]);
				address.setAddressState(userDetail[4]);
				address.setAddressCountry(userDetail[5]);
				address.setAddressMobile(userDetail[6]);

				String checkoutAddress = userDetail[7];
				
				int addressId = addressService.addUserAddress(address);
				if(addressId != -1) {	
					if(checkoutAddress.equalsIgnoreCase("profile"))
						result = Constants.USER_ADDRESS_ADDED_SUCCESS;
					else {
						ssn.addCheckoutAddressSession(session, request, addressId);
						result = Constants.CHECKOUT_ADDRESS_ADDED_SUCCESS;
					}
				}
				else
					result = Constants.USER_ADDRESS_ADDED_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	@RequestMapping(value = "/delete-user-address", method = RequestMethod.POST)
	public @ResponseBody
    String deleteUserAddress(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String addressId) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);

			if(user != null) {
				addressId = addressId.replace("\"", "");
				
				if(addressService.deleteUserAddress(parser.parseInt(addressId))) {	
					result = Constants.USER_ADDRESS_DELETED_SUCCESS;
				}
				else
					result = Constants.USER_ADDRESS_DELETED_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}
	
	@RequestMapping(value = "/check-user-login", method = RequestMethod.POST)
	public @ResponseBody
    String checkUserLogin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);

			if(user != null) 
				result = Constants.LOGIN_LOGEDIN;
			else 
				result = Constants.LOGIN_REQUIRED;
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
	}
	
	@RequestMapping(value = "/make-delivery-address", method = RequestMethod.POST)
	public @ResponseBody
    String makeDeliveryAddress(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String addressId) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = ssn.checkUserSession(request);

			if(user != null) {
				addressId = addressId.replace("\"", "");
				if(ssn.addCheckoutAddressSession(session, request, parser.parseInt(addressId)))
					result = Constants.CHECKOUT_MAKE_DELIVERY_ADDRESS_SUCCESS;
				else
					result = Constants.CHECKOUT_MAKE_DELIVERY_ADDRESS_ERROR;
			}
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}	
	
	@RequestMapping("/forgot-password")
	public ModelAndView forgotPassword(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("forgot-password");
		try {
						
			// Get cart products count
			User user = ssn.checkUserSession(request);
			List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
			int cartProductCount = 0;
			if(cartProductList != null)
				cartProductCount = cartProductList.size();
						
			view.addObject("cartProductCount", cartProductCount);
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return view;
	}
	
	@RequestMapping(value = "/save-forgot-password", method = RequestMethod.POST)
	public @ResponseBody
    String saveForgtPassword(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,  @RequestBody String userInfo) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			User user = new User();
			userInfo = userInfo.replace("\"", "");
			String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
				
			user.setUserEmail(userDetail[0]); 
			user.setUserPassword(userDetail[1]);
				
			if(userService.saveForgotPassword(user)) {	
				result = Constants.FORGOT_PASSWORD_UPDATE_SUCCESS;
			}
			else
				result = Constants.FORGOT_PASSWORD_UPDATE_ERROR;
			 
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
		return result;
   		
	}

}
