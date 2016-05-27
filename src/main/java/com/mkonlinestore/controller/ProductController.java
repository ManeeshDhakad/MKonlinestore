package com.mkonlinestore.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import antlr.Parser;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.common.ParseDataTypes;
import com.mkonlinestore.common.SessionManager;
import com.mkonlinestore.model.Order;
import com.mkonlinestore.model.Product;
import com.mkonlinestore.model.Review;
import com.mkonlinestore.model.User;
import com.mkonlinestore.service.ProductService;
import com.mkonlinestore.service.ReviewService;

@Controller
public class ProductController {
	private Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired  
	private ProductService productService;
	
	@Autowired
	private WishlistController wishlistController;
	
	@Autowired  
	private ReviewService reviewService;
	
	@Autowired
	CartController cartCotroller;
	
	SessionManager ssn = new SessionManager();
	
	ParseDataTypes parser = new ParseDataTypes();
	
	int category = 0;
	String productCode = "";
	
	@RequestMapping(value = "product-catelog", method = RequestMethod.GET)
    public ModelAndView productList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("product-list");
		try {
			String productCategory = request.getParameter("category").toLowerCase(); 
			
			if(productCategory != null) {
				switch(productCategory) {
					case "mens":
						category = Constants.CATEGORY_MENS;
						break;
					case "womens":
						category = Constants.CATEGORY_WOMENS;
						break;
					case "kids":
						category = Constants.CATEGORY_KIDS;
						break;
					default:
						category = 0;
						view.addObject("messageStatus", Constants.MESSAGE_ERROR);
						view.addObject("message", Constants.CATEGORY_NOT_AVAILABLE);
						break;
				}
			}
			
			if(category != 0) {
				List<Product> productList = new ArrayList<Product>(); 
			
				productList = productService.getProductList(category);
			
				if(productList != null && productList.size() > 0) {
					int ratings[] = new int[productList.size() + 1];
					int reviews[] = new int[productList.size() + 1];
					
					int rating = 0;
					int i = 0;
					for(Product product : productList) {
						rating = 0;
						
						List<Review> reviewList = reviewService.getReviewList(product.getProductCode());
						
						if(reviewList != null && reviewList.size() > 0) {
							for(Review review: reviewList) {
								rating = rating + review.getReviewRating();
							}
							ratings[i] = rating / reviewList.size();
							reviews[i++] = reviewList.size();
						}
						else {
							ratings[i] = 0;
							reviews[i++] = 0;
						}
						
					}
					
					view.addObject("ratings", ratings);
					view.addObject("reviews", reviews);
					
					view.addObject("productList", productList);
					view.addObject("productCategory", category);
				}
				
				
			}
			
			// Get cart products count
			User user = ssn.checkUserSession(request);
			List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
			int cartProductCount = 0;
			if(cartProductList != null)
				cartProductCount = cartProductList.size();
							
			view.addObject("cartProductCount", cartProductCount);
			
	
		}
		catch(Exception ex) {
			logger.info(ex);
			
		}
		return view;
    }
	
	@RequestMapping(value = "product-details", method = RequestMethod.GET)
    public ModelAndView productDetails(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("product-details");
		try {
			
			productCode = request.getParameter("productCode"); 
			
			Product product = new Product(); 
			product = productService.getProductDetails(productCode);
			
			if(product != null) {
				view.addObject("product", product);
			}
			
			// Get cart products count
			User user = ssn.checkUserSession(request);
			List<Product> cartProductList = cartCotroller.getCartProductList(session, request, response, user);
																					
			if(cartProductList != null) {
				if(cartProductList.size() > 0)
					view.addObject("cartProductList", cartProductList);
				view.addObject("cartProductCount", cartProductList.size());
			}
			
			List<Product> wishlistProductList = wishlistController.getWishlistProducts(request);
			if(wishlistProductList != null && wishlistProductList.size() > 0) {
				view.addObject("wishlistProductList", wishlistProductList);
			}
			
			List<Review> reviewList = reviewService.getReviewList(productCode);
			if(reviewList != null && reviewList.size() > 0) {
				view.addObject("reviewList", reviewList);
			}
		
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		return view;
    }
	
	@RequestMapping(value = "/save-product-review", method = RequestMethod.POST)
    public @ResponseBody
    String saveProductReview(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody String reviewDetail) {
 
		String result = Constants.COMMON_ERROR;
		try {
						
			reviewDetail = reviewDetail.replace("\"", "");
			String[] reviewInfo = reviewDetail.split(Constants.DELEMETER, -1); 
						
			if(reviewInfo != null && reviewInfo.length > 0) {
				User user = ssn.checkUserSession(request);
				String userName = "Anonymous User";
				if(user != null) 
					userName = user.getUserName();
				
				Review review = new Review();
				review.setProductCode(reviewInfo[0]);
				review.setReviewComment(reviewInfo[1]);
				review.setReviewRating(parser.parseInt(reviewInfo[2]));
				review.setUserName(userName);				
				
				 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				 Date date = new Date();
				 String reviewDate = dateFormat.format(date).toString();
				 
				 review.setReviewDate(reviewDate);
					
				if(reviewService.addReview(review)) 
						result = Constants.SAVE_REVIEW_SUCCESS;
					else
						result = Constants.SAVE_REVIEW_ERROR;	
				
					
			}			
			
		}
		catch(Exception ex) {
			logger.error(ex);
			
		}
		
        return result;
    }
	
	
}
