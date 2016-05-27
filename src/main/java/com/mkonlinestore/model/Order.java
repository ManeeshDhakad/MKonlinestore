package com.mkonlinestore.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_history")
public class Order {
	
	@Id
    @Column(name="orderId")
    @GeneratedValue
	private int orderId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="addressId")
	private int addressId;
	
	@Column(name="productCode")
	private String productCode;
	
	@Column(name="productName")
	private String productName;
	
	@Column(name="productPrice")
	private double productPrice;
	
	@Column(name="productQuantity")
	private int productQuantity;
	
	@Column(name="orderCode")
	private String orderCode;
	
	@Column(name="orderStatus")
	private String orderStatus;
	
	@Column(name="orderDate")
	private String orderDate;
	
	public Order() {}
			
	public Order(int orderId, int userId, int addressId, String productCode,
			String productName, double productPrice, int productQuantity,
			String orderCode, String orderStatus, String orderDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.addressId = addressId;
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.orderCode = orderCode;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
	}

	

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

//	public String toString(){
//	  return "Order Details: ID = " + orderId + "\nUser ID = " + userId + "\nProduct Code = " + productCode + " Order Code = " + orderCode + " Product Quantity = " + productQuantity + " Order Status = " + orderStatus + " Address ID = " + addressId;  
//	}  
		      
}
