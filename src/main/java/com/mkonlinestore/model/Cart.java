package com.mkonlinestore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class Cart {

	@Id
    @Column(name="cartId")
    @GeneratedValue
	private int cartId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="productCode")
    private String productCode;
	
	@Column(name="productQuantity")
    private int productQuantity;
	
	public Cart() {}

	public Cart(int cartId, int userId, String productCode, int productQuantity) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.productCode = productCode;
		this.productQuantity = productQuantity;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
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

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

}
