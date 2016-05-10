package com.mkonlinestore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wishlist")
public class Wishlist {
	
	@Id
    @Column(name="wishlistId")
    @GeneratedValue
	private int wishlistId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="productCode")
	private String productCode;
	
	public Wishlist() {}
	
	public Wishlist(int wishlistId, int userId, String productCode) {
		super();
		this.wishlistId = wishlistId;
		this.userId = userId;
		this.productCode = productCode;
	}

	public int getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	
}
