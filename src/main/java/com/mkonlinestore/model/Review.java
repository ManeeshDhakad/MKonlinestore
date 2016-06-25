package com.mkonlinestore.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product_review")
public class Review {
	
	@Id
    @Column(name="reviewId")
    @GeneratedValue
	private int reviewId;
	
	@Column(name="productCode")
	private String productCode;
	
	@Column(name="reviewComment")
	private String reviewComment;
	
	@Column(name="reviewRating")
	private int reviewRating;
		
	@Column(name="reviewDate")
	private String reviewDate;
	
	@Column(name="userName")
	private String userName;

	public Review() {}
	
	public Review(int reviewId, String productCode, String reviewComment,
			int reviewRating, String reviewDate, String userName) {
		super();
		this.reviewId = reviewId;
		this.productCode = productCode;
		this.reviewComment = reviewComment;
		this.reviewRating = reviewRating;
		this.reviewDate = reviewDate;
		this.userName = userName;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
			
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
		      
}
