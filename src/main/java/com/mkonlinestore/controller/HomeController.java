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

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.common.Mail;
import com.mkonlinestore.common.SessionManager;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.ProductService;

@Controller  
public class HomeController {  
		 
	private Logger logger = Logger.getLogger(HomeController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	CartController cartCotroller;
	
	@Autowired
	Mail mail;
	
	SessionManager ssn = new SessionManager();
	int category;
			
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView indexPage(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("home");
		try {
			
			view = getHomePageCommonDetails(session, request, response, view);
			
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
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView homePage(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("home");
		try {
			
			view = getHomePageCommonDetails(session, request, response, view);
			
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
			ex.printStackTrace();
		}
		
		return view;
    }
	
	@RequestMapping("/about")
	public ModelAndView aboutUs(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("about");
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
	
	@RequestMapping("/contact")
	public ModelAndView contactUs(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("contact");
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
	
	public ModelAndView getHomePageCommonDetails(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelAndView view) {
		
		try {
					
			List<Product> mansProductList = new ArrayList<Product>(); 
			category = Constants.CATEGORY_MENS;
			mansProductList = productService.getProductList(category);
			if(mansProductList != null && mansProductList.size() > 0) {
				view.addObject("mansProductList", mansProductList);
			}
			
			List<Product> womansProductList = new ArrayList<Product>(); 
			category = Constants.CATEGORY_WOMENS;	
			womansProductList = productService.getProductList(category);
			if(womansProductList != null && womansProductList.size() > 0) {			
				view.addObject("womansProductList", womansProductList);
			}
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		return view;
	}
	
	
	@RequestMapping(value = "/send-feedbackmail", method = RequestMethod.POST)
	public @ResponseBody
    String sendFeedbackMail(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String mailDetails) {    
		String result = Constants.COMMON_ERROR;
		
		try {
			mailDetails = mailDetails.replace("\"", "");
			String[] mailInfo = mailDetails.split(Constants.DELEMETER, -1);
				
			String name = mailInfo[0];
			String userEmail = mailInfo[1];
			String subject = mailInfo[2];
			String body = mailInfo[3];
			
			
			// User Mail
			String userMailSubject = "RE: " + subject;
			String userMailbody = "Hi " + name + ", <br>"  + Constants.MK_FEEDBACK_MAIL_BODY;
			mail.sendMail(Constants.MK_EMAIL, userEmail, userMailSubject, userMailbody);
			
			// Feedback Mail
			mail.sendMail(userEmail, Constants.MK_EMAIL, subject, body);
			
			result = Constants.FEEDBACK_MAIL_SUCCESS;
			 
		}
		catch(Exception ex) {
			result = Constants.FEEDBACK_MAIL_ERROR;
			logger.error(ex);
			
		}
		
		return result;
   		
	}	
	
}  